import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) { 
    ColorScheme colorContext = Get.theme.colorScheme;
    ever(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
            Center(
              child: CircularProgressIndicator(
                color: colorContext.tertiary,
              ),
            ),
            barrierDismissible: false);
      } else {
        Get.back(canPop: true);
      }
    });
  }
}
