import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/extension/context_extension.dart';
import 'package:xpert_goup_tecnical_test/src/core/extension/date_extension.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_utils_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_app_font.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/history_page/history_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/animations/animated_onTap_widget.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/text/text_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        builder: (ctrl) => Scaffold(
              backgroundColor: AppColor.background,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Stack(
                  children: [
                    /// list
                    Column(
                      children: [
                        40.verticalSpace,

                        /// if list is not empty show data
                        if (ctrl.historyList.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: ctrl.historyList.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (ctx, index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Container(
                                  width: context.maxWidth,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteSnow,
                                      borderRadius: AppUtilsGlobal.globalRadius,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.blackHardness10
                                                .withOpacity(0.2),
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5,
                                            offset: const Offset(0, 0.7))
                                      ]),
                                  child: Row(
                                    children: [
                                      /// url, date
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            /// url
                                            TextWidget(
                                              ctrl.historyList[index].url,
                                              font: AppFont.bodyBold,
                                              color: AppColor.blackHardness,
                                            ),

                                            /// date
                                            if (ctrl.historyList[index]
                                                    .createdAt !=
                                                null)
                                              TextWidget(
                                                ctrl.historyList[index]
                                                    .createdAt!.formatDate,
                                                font: AppFont.caption,
                                                color: AppColor.blackHardness75,
                                              ),
                                          ],
                                        ),
                                      ),
                                      20.horizontalSpace,

                                      /// copy url button
                                      buttonCard(
                                          icon: Icons.copy,
                                          onTap: () => ctrl.onTapCopyButton(
                                              index: index)),
                                      20.horizontalSpace,

                                      /// delete item button
                                      buttonCard(
                                          icon: Icons.delete,
                                          color: AppColor.redAlert,
                                          onTap: () => ctrl.onTapDeleteButton(
                                              index: index)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: Center(
                              child: TextWidget(
                                'No hay datos para mostrar',
                                font: AppFont.h1,
                                color: AppColor.blackHardness25,
                              ),
                            ),
                          ),
                        20.verticalSpace,
                      ],
                    ),

                    /// delete all button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: AnimatedOnTapWidget(
                          onTap: ctrl.onTapDeleteAll,
                          child: Container(
                            width: 140.w,
                            height: 140.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.redEuphoria),
                            child: const Icon(
                              Icons.delete_outline,
                              size: 25,
                              color: AppColor.whiteSnow,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget buttonCard(
      {required Function() onTap, required IconData icon, Color? color}) {
    return AnimatedOnTapWidget(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
            color: AppColor.blackHardness10,
            borderRadius: AppUtilsGlobal.globalRadius),
        child: Icon(
          icon,
          size: 20,
          color: color ?? AppColor.blackHardness75,
        ),
      ),
    );
  }
}
