import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var listTransactions = controller.userTransactions.map((item) {
      var color = item.type == TransactionType.expense ? AppColors.chiliRed : Colors.green;
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        leading: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.monetization_on),
        ),
        title: Text(
          item.description,
          style: AppTextStyles.mediumText16,
        ),
        subtitle: Text(
          item.date.toString(),
          style: AppTextStyles.smallText13,
        ),
        trailing: Text(
          item.value.toString(),
          style: AppTextStyles.mediumText18.apply(color: color),
        ),
      );
    });
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo, João Lucas',
                        style: AppTextStyles.mediumText25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.asparagus,
                            /* border: Border.all(width: 2, color: AppColors.asparagus), */ borderRadius:
                                BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Saldo em conta: ',
                                  style: AppTextStyles.mediumText20,
                                ),
                                Text(
                                  r'R$ 6.000,00 ',
                                  style: AppTextStyles.mediumText20,
                                ),
                              ],
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Text(
                                  ' Receitas: ',
                                  style: AppTextStyles.mediumText16,
                                ),
                                Text(
                                  r'R$ 750,00 ',
                                  style: AppTextStyles.mediumText16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Text(
                                  ' Despesas: ',
                                  style: AppTextStyles.mediumText16,
                                ),
                                Text(
                                  r'R$ 400,00',
                                  style: AppTextStyles.mediumText16,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ...listTransactions,
                  Center(
                      child: ElevatedButton(
                          onPressed: () => controller.logout(),
                          child: const Text('Sair'))),
                  // Center(
                  //     child: ElevatedButton(
                  //         onPressed: () async {
                  //           teste = await controller.teste();
                  //           print('olha o teste ${teste[0].description}');
                  //         },
                  //         child: const Text('Teste'))),
                  // Obx(() {
                  //   return Text(controller.userTransactions.toString());
                  // })
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
             await Get.toNamed(Routes.newValue);
             controller.onReady();
          },
          backgroundColor: AppColors.asparagus,
          //shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: AppColors.lemonChiffon,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
          //height: 60,
          backgroundColor: AppColors.asparagus,
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
          currentIndex: 0,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.lemonChiffon,
          onTap: (int value) {},
        ),
      );
    });
  }
}
