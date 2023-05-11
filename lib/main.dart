import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/config/app_init_config.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_pages.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_routes.dart';

void main() {
  AppInitConfig.mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
        init: GlobalController(),
        builder: (ctrl) =>
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: ScreenUtilInit(
                designSize: const Size(1080, 1920),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, __) => GetMaterialApp(
                  title: 'Url Shortener',
                  getPages: AppPages.appPages,
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppRoutes.splashPage,
                  defaultTransition: Transition.fadeIn,
                  theme: ThemeData(
                    primarySwatch: Colors.red,
                  ),
                  supportedLocales: const [Locale('en', 'US')],
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                ),
              ),
            ));
  }
}
