import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/home/home_bindings.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/home/home_page.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/profile/profile_bindings.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/profile/profile_page.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/wallet/wallet_bindings.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/wallet/wallet_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './main_navigation_controller.dart';

class MainNavigationPage extends GetView<MainNavigationController> {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: AppColors.asparagus ,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              tooltip: 'Home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              tooltip: 'Carteira',
              label: 'Carteira',
              icon: Icon(Icons.wallet),
            ),
            BottomNavigationBarItem(
              tooltip: 'Profile',
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          currentIndex: controller.selectedItem.value,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.lemonChiffon,
          onTap: (int value) {
            controller.onTabSelected(value);
          },
        );
      }),
      body:  Navigator(
          key: Get.nestedKey(controller.navigatorKey),
          initialRoute: Routes.home,
          onGenerateRoute: (settings) {
            print('settings: $settings');
            if (settings.name == Routes.home) {
              return GetPageRoute(
                  page: () => const HomePage(), binding: HomeBindings(), transition: Transition.fadeIn);
            }
            if (settings.name == Routes.wallet) {
              return GetPageRoute(
                  page: () => const WalletPage(), binding: WalletBindings(), transition: Transition.fadeIn);
            }
            if (settings.name == Routes.profile) {
              return GetPageRoute(
                  page: () => const ProfilePage(), binding: ProfileBindings(), transition: Transition.fadeIn);
            }
            return null;
          },
        ),
      
    );
  }
}
