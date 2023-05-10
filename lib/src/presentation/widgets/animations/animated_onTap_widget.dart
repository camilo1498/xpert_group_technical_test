// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedOnTapWidget extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final bool? enabled;
  final Color? background;
  final BorderRadius? borderRadius;
  final Function()? onLongPress;

  const AnimatedOnTapWidget({
    Key? key,
    this.onTap,
    required this.child,
    this.enabled = true,
    this.background,
    this.borderRadius,
    this.onLongPress,
  }) : super(key: key);

  @override
  AnimatedOnTapWidgetState createState() => AnimatedOnTapWidgetState();
}

class AnimatedOnTapWidgetState extends State<AnimatedOnTapWidget>
    with TickerProviderStateMixin {
  double squareScaleA = 1;
  AnimationController? _controllerA;
  Timer _timer = Timer(const Duration(milliseconds: 300), () {});

  @override
  void initState() {
    if (mounted) {
      _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.95,
        upperBound: 1.0,
        value: 1,
        duration: const Duration(milliseconds: 10),
      );
      _controllerA?.addListener(() {
        setState(() {
          squareScaleA = _controllerA!.value;
        });
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    if (mounted) {
      _controllerA!.dispose();
      _timer.cancel();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap != null
          ? () {
              if (widget.enabled!) {
                /// set vibration
                HapticFeedback.lightImpact();
                _controllerA!.reverse();
                widget.onTap!();
              }
            }
          : () {},
      onTapDown: (dp) {
        if (widget.enabled!) {
          _controllerA!.reverse();
        }
      },
      onTapUp: (dp) {
        if (widget.enabled!) {
          try {
            if (mounted) {
              _timer = Timer(const Duration(milliseconds: 100), () {
                _controllerA!.fling();
              });
            }
          } catch (e) {
            debugPrint(e.toString());
          }
        }
      },
      onTapCancel: () {
        if (widget.enabled!) {
          _controllerA!.fling();
        }
      },
      child: Transform.scale(
        scale: squareScaleA,
        child: widget.child,
      ),
    );
  }
}
