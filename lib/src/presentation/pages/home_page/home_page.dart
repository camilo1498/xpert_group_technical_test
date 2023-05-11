import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_global_asset.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_utils_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_app_font.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/animations/animated_loading.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/animations/animated_onTap_widget.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/buttons/button_widget.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/text/text_widget.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/textfields/form_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'home_page',
      builder: (ctrl) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Column(
              children: [
                20.verticalSpace,

                /// title
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppGlobalAsset.appIcon,
                      height: 80.w,
                      width: 80.w,
                    ),
                    40.horizontalSpace,
                    TextWidget(
                      'Url shortener',
                      font: AppFont.h1,
                      color: AppColor.blackHardness,
                    ),

                    /// white space to equilibrate text balance
                    SizedBox(
                      height: 80.w,
                      width: 80.w,
                    )
                  ],
                ),
                150.verticalSpace,

                /// body
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// QR (add conditional when data is not null)
                      GetBuilder<HomeController>(
                          id: 'shorten_url',
                          builder: (ctrl) => Center(
                                child: SizedBox(
                                  width: 600.w,
                                  height: 600.w,
                                  child: ctrl.shortenUrl.isNotEmpty
                                      ? RepaintBoundary(
                                          key: ctrl.qrKey,
                                          child: QrImage(
                                            size: 600.w,
                                            version: QrVersions.auto,
                                            gapless: false,
                                            eyeStyle: const QrEyeStyle(
                                                eyeShape: QrEyeShape.circle),
                                            foregroundColor:
                                                AppColor.blackHardness,
                                            padding: EdgeInsets.zero,
                                            data: ctrl.shortenUrl,
                                          ),
                                        )
                                      : Icon(
                                          Icons.qr_code,
                                          size: 600.w,
                                          color: AppColor.blackHardness25,
                                        ),
                                ),
                              )),
                      50.verticalSpace,

                      /// title
                      TextWidget(
                        'Url (*)',
                        font: AppFont.captionBold,
                      ),
                      10.verticalSpace,

                      /// text form - validate message - generate button - loading
                      GetBuilder<HomeController>(
                          id: 'validate',
                          builder: (ctrl) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// text form
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            AppUtilsGlobal.globalRadius,
                                        border: Border.all(
                                            color: AppColor.blackHardness75)),
                                    child: Row(
                                      children: [
                                        /// textForm
                                        Expanded(
                                          child: FormWidget(
                                            bordeColor: Colors.transparent,
                                            controller: ctrl.urlController,
                                            focusNode: ctrl.urlNode,
                                            inputFormatters: [
                                              /// restrict white spaces
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'\s')),
                                            ],
                                            hint:
                                                'Ingresa la URL que quieres acortar',
                                          ),
                                        ),
                                        20.horizontalSpace,

                                        /// clear icon
                                        if (ctrl.urlController.text
                                            .trim()
                                            .isNotEmpty)
                                          AnimatedOnTapWidget(
                                            onTap: ctrl.onTapClearIcon,
                                            child: SizedBox(
                                              width: 80.w,
                                              height: 80.w,
                                              child: const Icon(
                                                  Icons.delete_outline),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  20.verticalSpace,

                                  /// error text
                                  if (!ctrl.validateUrl)
                                    TextWidget(
                                      'URL invalida, la url debe tener el siguiente patron: \nhttp://www.example.com',
                                      font: AppFont.captionBold,
                                      color: AppColor.redAlert,
                                    ),
                                  50.verticalSpace,

                                  /// generate button
                                  if (!ctrl.generatingURL)
                                    ButtonWidget(
                                      text: 'Acortar',
                                      onTap: ctrl.generateUrl,
                                      enable: ctrl.validateUrl,
                                      font: AppFont.bodyBold,
                                      background: ctrl.validateUrl
                                          ? AppColor.redEuphoria
                                          : AppColor.blackHardness25,
                                      textColor: AppColor.whiteSnow,
                                    )
                                  else
                                    const Center(
                                      child: AnimatedLoadingWidget(
                                          size: 25, color: AppColor.redAlert),
                                    ),
                                ],
                              )),

                      30.verticalSpace,

                      GetBuilder<HomeController>(
                        id: 'shorten_url',
                        builder: (ctrl) => Column(
                          children: [
                            if (ctrl.shortenUrl.isNotEmpty)
                              Row(
                                children: [
                                  /// copy
                                  Expanded(
                                    child: ButtonWidget(
                                      text: 'Copiar',
                                      font: AppFont.bodyBold,
                                      onTap: ctrl.onTapCopyButton,
                                      textColor: AppColor.whiteSnow,
                                      background: AppColor.redEuphoria,
                                    ),
                                  ),
                                  40.horizontalSpace,

                                  /// share
                                  Expanded(
                                    child: ButtonWidget(
                                      text: 'Compartir',
                                      font: AppFont.bodyBold,
                                      onTap: ctrl.onTapShareButton,
                                      textColor: AppColor.whiteSnow,
                                      background: AppColor.redEuphoria,
                                    ),
                                  )
                                ],
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
