import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:xpert_goup_tecnical_test/src/data/models/history_model.dart';

class AppInitConfig {
  static mainInit() async {
    /// Make sure that the widget are already initialized
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    Paint.enableDithering = true;

    /// navigation bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    /// Force device orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// Adding Hive init
    await Hive.initFlutter();

    /// Register Hive Adapters
    Hive.registerAdapter(HistoryModelAdapter());

    /// Open Hive Boxes
    await Hive.openBox<HistoryModel>('local_storage');
  }
}
