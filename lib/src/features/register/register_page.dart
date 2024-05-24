import 'dart:developer';

import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/utils/validator.dart';
import 'package:app_financeiro/src/common/widgets/app_textformfield.dart';
import 'package:app_financeiro/src/common/widgets/primary_button.dart';
import 'package:app_financeiro/src/features/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
    
    const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  RegisterController controller = Get.find();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Preencha o formulário abaixo para realizar seu cadastro.', style: AppTextStyles.titleText20,),
                    const SizedBox(
                       height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextformfield(
                              label: 'Nome',
                              controller: _nameController,
                              //inputFormatters: [UppercaseTextFormatter()],
                              validator: Validator.validateName),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextformfield(
                            label: 'E-mail',
                            controller: _emailController,
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextformfield(
                            controller: _passwordController,
                            label: 'Senha',
                            obscureText: true,
                            helperText:
                                'Deve ter pelo menos 8 caracteres, 1 letra maiúscula, 1 minúscula, 1 número e 1 caractere especial.',
                            validator: Validator.validatePassword,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextformfield(
                            label: 'Confirmar senha',
                            obscureText: true,
                            validator: (value) => Validator.validateConfirmPassword(
                                value!, _passwordController.text),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: Get.height * 0.04,),
                  PrimaryButton(
                      text: 'Cadastrar',
                      margin: EdgeInsets.zero,
                      function: () {
                        final valid = _formKey.currentState!.validate();
                        //final valid = true;
                        if (valid) {
                          controller.register(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                        } else {
                          log('Erro ao Cadastrar');
                        }
                      }),
                  ],
                ),
              ),
            ),
        );
    }
}