import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final VoidCallback function;
  const PrimaryButton({super.key, required this.text, required this.margin, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: double.infinity,
      margin: margin,
      child: Ink(
        decoration: BoxDecoration(
            color: const Color(0xff1D1A05),
            borderRadius: BorderRadius.circular(25),),
        child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: function,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style:
                    AppTextStyles.mediumText20.copyWith(color: Colors.white),
              ),
            )),
      ),
    );
  }
}
