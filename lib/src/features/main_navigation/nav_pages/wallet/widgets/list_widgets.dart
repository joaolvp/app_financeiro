import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> listWidgets = [
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: Get.height * 0.22,
        //width: Get.width * 1.2 ,
        child: PieChart(
          PieChartData(
            sections: _buildSectionsIncome(),
            borderData: FlBorderData(show: false),
            sectionsSpace: 5,
            centerSpaceRadius: 30,
          ),
        ),
      ),
      const SizedBox(height: 16), // Espaço entre o gráfico e a legenda
      _buildLegendIncome(),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Text('Despesas', style: AppTextStyles.mediumText25),
      SizedBox(
        height: Get.height * 0.22,
        //width: Get.width ,
        child: PieChart(
          PieChartData(
            sections: _buildSectionsExpense(),
            borderData: FlBorderData(show: false),
            sectionsSpace: 5,
            centerSpaceRadius: 30,
          ),
        ),
      ),
      const SizedBox(height: 16), // Espaço entre o gráfico e a legenda
      _buildLegendExpense(), // Função que cria a legenda
    ],
  ),
];

// Função para criar as seções do gráfico

List<PieChartSectionData> _buildSectionsIncome() {
  return [
    PieChartSectionData(
      color: Colors.blueAccent,
      value: 35,
      title: '35%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.greenAccent,
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
      color: Colors.orangeAccent,
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
    PieChartSectionData(
      color: Colors.grey,
      value: 5,
      title: '5%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}

List<PieChartSectionData> _buildSectionsExpense() {
  return [
    PieChartSectionData(
      color: Colors.brown,
      value: 15,
      title: '15%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.greenAccent,
      value: 26,
      title: '26%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.yellowAccent,
      value: 11,
      title: '11%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.lightBlueAccent,
      value: 19,
      title: '19%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 27,
      title: '27%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.grey,
      value: 2,
      title: '2%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}

// Função para criar a legenda
Widget _buildLegendIncome() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 8,
      children: [
        _buildLegendItem(Colors.blueAccent, 'Trabalho'),
        _buildLegendItem(Colors.greenAccent, 'Investimento'),
        _buildLegendItem(Colors.orangeAccent, 'Serviços'),
        _buildLegendItem(Colors.redAccent, 'Empreendimentos'),
        _buildLegendItem(Colors.grey, 'Outros'),
      ],
    ),
  );
}

// Função para criar a legenda
Widget _buildLegendExpense() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 8,
      children: [
        _buildLegendItem(Colors.brown, 'Casa'),
        _buildLegendItem(Colors.greenAccent, 'Saúde'),
        _buildLegendItem(Colors.yellowAccent, 'Educação'),
        _buildLegendItem(Colors.blueAccent, 'Transporte'),
        _buildLegendItem(Colors.orangeAccent, 'Alimentação'),
        _buildLegendItem(Colors.grey, 'Outros'),
      ],
    ),
  );
}

// Função que cria cada item da legenda com a cor e o rótulo
Widget _buildLegendItem(Color color, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: AppTextStyles.smallText13,
      ),
      const SizedBox(
        width: 8,
      )
    ],
  );
}
