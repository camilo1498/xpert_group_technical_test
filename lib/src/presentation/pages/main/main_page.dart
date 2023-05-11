import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/main/main_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_pages.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_routes.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/navigation/bottom_navbar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: GetBuilder<MainController>(
        builder: (ctrl) => SafeArea(
          child: Column(
            children: [
              /// pages
              Expanded(
                child: Navigator(
                  key: Get.nestedKey(0),
                  initialRoute: AppRoutes.homePage,
                  onGenerateRoute: (route) => AppPages.homePageRoutes(route),
                ),
              ),

              /// navBar
              GetBuilder<MainController>(
                  id: 'bottom_bar',
                  builder: (ctrl) => BottomNavbarWidget(
                        selectItem: ctrl.selectItemBottomNav,
                        items: [
                          BottomNavBarWidgetItem(
                            activeColor: AppColor.redEuphoria,
                            inactiveColor: AppColor.blackHardness,
                            icon: Icons.home_filled,
                            onTap: (i) => ctrl.nextPage(
                                indexPag: i, route: AppRoutes.homePage),
                          ),
                          BottomNavBarWidgetItem(
                            activeColor: AppColor.redEuphoria,
                            inactiveColor: AppColor.blackHardness,
                            icon: Icons.history,
                            iconSize: 32,
                            onTap: (i) => ctrl.nextPage(
                                indexPag: i, route: AppRoutes.historyPage),
                          ),
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
