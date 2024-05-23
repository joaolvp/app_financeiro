import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/utils/validator.dart';
import 'package:app_financeiro/src/common/widgets/app_textformfield.dart';
import 'package:app_financeiro/src/common/widgets/google_button.dart';
import 'package:app_financeiro/src/common/widgets/primary_button.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /* SizedBox(
                          height: Get.height * 0.05,
                        ), */
                        /* Image.asset(
                          'assets/images/login.png',
                          height: Get.height * 0.3,
                        ), */
                        SvgPicture.asset(
                          'assets/images/login.svg',
                          //semanticsLabel: 'Acme Logo',
                          height: Get.height * 0.4,
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        AppTextformfield(
                          label: 'E-mail',
                          controller: _emailController,
                          validator: Validator.validateEmail,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        AppTextformfield(
                          controller: _passwordController,
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
                            function: () {}),
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
                        GoogleButton(),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '''Não tem uma conta? ''',
                                style: AppTextStyles.smallTextW500
                                    .copyWith(color: AppColors.grey),
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
