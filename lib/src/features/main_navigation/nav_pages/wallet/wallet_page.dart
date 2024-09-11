import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/features/main_navigation/nav_pages/wallet/wallet_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: Get.height * 0.4,
                child: PieChart(
                  PieChartData(
                    sections: _buildSections(), // Função que cria as fatias do gráfico
                    borderData: FlBorderData(show: false), // Remove as bordas
                    sectionsSpace: 10, // Espaço entre as fatias
                    centerSpaceRadius: 40, // Raio do espaço central (para um círculo vazio no centro)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  List<PieChartSectionData> _buildSections() {
    return [
      PieChartSectionData(
        color: Colors.blueAccent,
        value: 40,
        title: '40%', // Texto dentro da fatia
        radius: 50, // Tamanho da fatia
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent,
        value: 30,
        title: '30%',
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.greenAccent,
        value: 20,
        title: '20%',
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.redAccent,
        value: 10,
        title: '10%',
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

}
