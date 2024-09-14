import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/wallet/widgets/list_widgets.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/wallet/widgets/transaction_widget.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Receitas / Despesas',
                      style: AppTextStyles.mediumText25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  items: listWidgets.map((item) {
                    return Builder(builder: (context) {
                      return item;
                    });
                  }).toList(),
                  options: CarouselOptions(
                      padEnds: true,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      enlargeFactor: 0.6,
                      height: Get.height * 0.35,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: listWidgets.length,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey.shade500,
                          activeDotColor: AppColors.asparagus),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 30,
                        )),
                    Text(
                      'Maio',
                      style: AppTextStyles.mediumText25,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 30,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.income,
                        value: 1000,
                        description: 'Vale - Salário',
                        category: CategoryType.work,
                        date: DateTime(2024, 05, 01),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.expense,
                        value: 269.32,
                        description: 'Conta Luz',
                        category: CategoryType.house,
                        date: DateTime(2024, 05, 03),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.expense,
                        value: 120,
                        description: 'Conta água',
                        category: CategoryType.house,
                        date: DateTime(2024, 05, 05),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.income,
                        value: 2000,
                        description: 'Salário',
                        category: CategoryType.work,
                        date: DateTime(2024, 05, 12),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.income,
                        value: 531.85,
                        description: 'Compras Mercado',
                        category: CategoryType.food,
                        date: DateTime(2024, 05, 18),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.expense,
                        value: 827,
                        description: 'gasolina',
                        category: CategoryType.transportation,
                        date: DateTime(2024, 05, 25),
                        received: true,
                        created_at: DateTime.now())),
                TransactionWidget(
                    item: TransactionFinanceiro(
                        type: TransactionType.expense,
                        value: 300,
                        description: 'Remédios RdFarma',
                        category: CategoryType.health,
                        date: DateTime(2024, 05, 30),
                        received: true,
                        created_at: DateTime.now()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
