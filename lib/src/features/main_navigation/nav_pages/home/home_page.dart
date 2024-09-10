import 'dart:developer';

import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var listTransactions = controller.userTransactions.map((item) {
      var color = item.type == TransactionType.expense
          ? AppColors.chiliRed
          : AppColors.asparagus;
      return ListTile(
        onTap: () {
          showModalBottomSheet(
              useRootNavigator: true,
              context: context,
              builder: (builder) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () =>
                          Get.toNamed(Routes.valueTransaction, arguments: item),
                      leading: const Icon(Icons.edit),
                      title: const Text('Editar'),
                    ),
                    ListTile(
                      onTap: () async {
                        controller.deleteTransaction(item.uid);
                      },
                      leading: const Icon(Icons.delete),
                      title: const Text('Excluir'),
                    ),
                  ],
                );
              });
          log(item.uid);
          //Get.toNamed(Routes.valueTransaction, arguments: item);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        leading: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(8.0),
          child: Icon(item.type == TransactionType.expense
              ? Icons.trending_down
              : Icons.trending_up),
        ),
        title: Text(
          item.description,
          style: AppTextStyles.mediumText16,
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy').format(item.date),
          style: AppTextStyles.smallText13,
        ),
        trailing: Text(
          'R\$ ${item.value.toString()}',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.nameUser.value.length > 1
                            ? 'Bem-vindo, ${controller.nameUser}'
                            : 'Bem-vindo',
                        style: AppTextStyles.mediumText25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.indigo,
                                  AppColors.asparagus
                                  
                                ]),
                            //color: AppColors.asparagus,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Text(
                              'R\$ ${controller.saldoEmConta} ',
                              style: AppTextStyles.mediumText30,
                            ),
                            Text(
                              'Saldo Total ',
                              style: AppTextStyles.mediumText18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: AppColors.asparagus,
                                  size: 30,
                                ),
                                Text(
                                  ' Receitas: ',
                                  style: AppTextStyles.mediumText18,
                                ),
                                Text(
                                  'R\$ ${controller.receitaTotal} ',
                                  style: AppTextStyles.mediumText18,
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
                                  Icons.trending_down,
                                  color: AppColors.chiliRed,
                                  size: 30,
                                ),
                                Text(
                                  ' Despesas: ',
                                  style: AppTextStyles.mediumText18,
                                ),
                                Text(
                                  'R\$ ${controller.despesaTotal}',
                                  style: AppTextStyles.mediumText18,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Transações recentes',
                    style: AppTextStyles.mediumText18,
                  ),
                  ...listTransactions,
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Get.toNamed(Routes.valueTransaction);
            controller.onReady();
          },
          backgroundColor: AppColors.asparagus,
          child: const Icon(
            Icons.add,
            color: AppColors.lemonChiffon,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}
