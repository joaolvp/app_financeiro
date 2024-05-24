// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_financeiro/src/common/constants/app_text_styles.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback callback;
  const GoogleButton({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorContext = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
          backgroundColor: colorContext.tertiary,
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
                      AppTextStyles.mediumText20.copyWith(color: colorContext.secondary),
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
