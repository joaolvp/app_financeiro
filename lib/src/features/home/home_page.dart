import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('HomePage'),),
      body: Center(
          child: ElevatedButton(
              onPressed: () => controller.logout(), child: const Text('Sair'))),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.asparagus,
        child: IconTheme(
          data: const IconThemeData(color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Home',
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Profile',
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
