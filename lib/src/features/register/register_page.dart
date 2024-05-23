import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
    
    const RegisterPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('RegisterPage'),),
            body: Container(),
        );
    }
}