import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: AppColors.black,
          minimumSize: Size.fromHeight(Get.height * 0.05),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset('assets/images/icon_google.png'))),
          Expanded(
              flex: 4,
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Entrar com o Google',
                  style:
                      AppTextStyles.mediumText20.copyWith(color: Colors.white),
                ),
              )),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
