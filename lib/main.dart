import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_pages.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
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
                  title: 'Flutter Demo',
                  getPages: AppPages.appPages,
                  initialRoute: AppRoutes.splashPage,
                  theme: ThemeData(
                    primarySwatch: Colors.red,
                  ),
                ),
              ),
            ));
  }
}
