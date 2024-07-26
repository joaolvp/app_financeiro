import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';

class MainNavigationController extends GetxController {
  // Variável reativa para rastrear o item selecionado no BottomNavigationBar
  var selectedItem = 0.obs;

  // Chave do Navigator para navegação aninhada (opcional, mas útil)
  final navigatorKey = 1;

  // Método chamado quando um item do BottomNavigationBar é selecionado
  void onTabSelected(int index) {
    selectedItem.value = index;

    // Navega para a rota correspondente com base no índice selecionado
    switch (index) {
      case 0:
        Get.offNamedUntil(Routes.home, ModalRoute.withName(Routes.home), id: navigatorKey);
        break;
      case 1:
        Get.offNamedUntil(Routes.wallet, ModalRoute.withName(Routes.wallet), id: navigatorKey);
        break;
      case 2: 
        Get.offNamedUntil(Routes.profile, ModalRoute.withName(Routes.profile), id: navigatorKey);
        break;
      /* case 0:
        Get.toNamed(Routes.home, id: navigatorKey);
        break;
      case 1:
        Get.toNamed(Routes.wallet, id: navigatorKey);
        break;
      case 2:
        Get.toNamed(Routes.profile, id: navigatorKey);
        break; */
    }
  }
}
