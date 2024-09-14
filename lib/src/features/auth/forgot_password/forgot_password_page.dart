import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/utils/validator.dart';
import 'package:app_financeiro/src/common/widgets/app_textformfield.dart';
import 'package:app_financeiro/src/common/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/forgot_password.svg',
              height: Get.height * 0.2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Esqueceu sua senha?',
              style: AppTextStyles.mediumText30,
            ),
            Text(
              'Digite seu e-mail para que possamos recuperá-la para você.',
              style: AppTextStyles.mediumText20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const AppTextformfield(
              label: 'E-mail',
              //controller: emailController,
              validator: Validator.validateEmail,
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryButton(
                text: 'Enviar', margin: EdgeInsets.zero, function: () {}),
          ],
        ),
      ),
    );
  }
}
