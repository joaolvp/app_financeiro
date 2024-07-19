import 'dart:developer';

import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/common/utils/validator.dart';
import 'package:app_financeiro/src/common/widgets/app_textformfield.dart';
import 'package:app_financeiro/src/common/widgets/google_button.dart';
import 'package:app_financeiro/src/common/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.find();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorContext = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: colorContext.surface,
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/login.svg',
                          height: Get.height * 0.4,
                        ),
                        AppTextformfield(
                          label: 'E-mail',
                          controller: emailController,
                          validator: Validator.validateEmail,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        AppTextformfield(
                          controller: passwordController,
                          label: 'Senha',
                          obscureText: true,
                          /* helperText:
                                      'Must have at least 8 characters, 1 capital letter and 1 number.', */
                          validator: Validator.validatePassword,
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        PrimaryButton(
                            text: 'Entrar',
                            margin: EdgeInsets.zero,
                            function: () {
                              final valid = formKey.currentState!.validate();
                              //final valid = true;
                              if (valid) {
                                controller.loginEmail(
                                    email: emailController.text,
                                    password: passwordController.text);
                              } else {
                                log('erro ao logar');
                              }
                            }),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Ou',
                                  style: AppTextStyles.mediumText20,
                                ),
                              )
                            ]),
                        GoogleButton(
                          callback: () => controller.loginGoogle(),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.register),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '''Não tem uma conta? ''',
                                style: AppTextStyles.smallTextW500
                                    .copyWith(color: colorContext.tertiary),
                              ),
                              Text(
                                'Cadastre-se',
                                style: AppTextStyles.smallTextW500
                                    .copyWith(color: AppColors.asparagus),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
