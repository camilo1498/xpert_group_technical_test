import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/animations/animated_loading.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/animations/animated_onTap_widget.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({
    Key? key,
    this.selectItem = 0,
    this.background,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.animationDuration = const Duration(milliseconds: 500),
    this.itemMinHeight = 70,
    required this.items,
  })  : assert(items.length <= 5 && selectItem >= 0),
        super(key: key);

  final int selectItem;
  final Color? background;
  final MainAxisAlignment mainAxisAlignment;
  final Duration animationDuration;
  final double itemMinHeight;
  final List<BottomNavBarWidgetItem> items;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingBottom = MediaQuery.of(context).padding.bottom;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: background ?? AppColor.background,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: paddingBottom > 0 && GetPlatform.isIOS
                ? paddingBottom - 20.h
                : 0),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: List.generate(
            items.length,
            (i) => AnimatedOnTapWidget(
              onTap: () => items[i].onTap(i),
              child: _ItemWidget(
                item: items[i],
                isSelected: i == selectItem,
                animationDuration: animationDuration,
                itemMinHeight: itemMinHeight,
                boxItem: items[i].boxItem,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.animationDuration,
    required this.itemMinHeight,
    required this.boxItem,
  }) : super(key: key);

  final BottomNavBarWidgetItem item;
  final bool isSelected;
  final Duration animationDuration;
  final double itemMinHeight;
  final bool boxItem;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: itemMinHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(minHeight: 50, minWidth: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: boxItem
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: item.boxItemGradient,
                      )
                    : null,
              ),
              child: item.isLoading
                  ? const Center(
                      child: AnimatedLoadingWidget(
                        size: 16,
                        color: AppColor.redEuphoria,
                      ),
                    )
                  : Icon(
                      isSelected ? item.icon : item.inactiveIcon ?? item.icon,
                      size: item.isMobile ? item.iconSize : item.iconSize + 5,
                      color: item.boxIconColor ??
                          (isSelected
                              ? item.activeColor
                              : item.inactiveColor ?? item.activeColor),
                    ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: animationDuration,
              curve: Curves.ease,
              width: isSelected
                  ? boxItem
                      ? 50
                      : 12
                  : 1,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? item.activeColor : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarWidgetItem {
  BottomNavBarWidgetItem({
    required this.icon,
    this.inactiveIcon,
    this.iconSize = 28,
    this.isMobile = true,
    this.activeColor = Colors.blue,
    this.inactiveColor,
    this.boxItem = false,
    this.boxItemGradient = const [Colors.grey, Colors.white],
    this.isLoading = false,
    this.boxIconColor,
    required this.onTap,
  });

  final IconData icon;
  final IconData? inactiveIcon;
  final double iconSize;
  final bool isMobile;
  final Color activeColor;
  final Color? inactiveColor;
  final bool boxItem;
  final List<Color> boxItemGradient;
  final Color? boxIconColor;
  final bool isLoading;
  final ValueChanged<int> onTap;
}
