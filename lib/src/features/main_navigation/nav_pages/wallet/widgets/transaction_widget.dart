import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionFinanceiro item;
  const TransactionWidget({ super.key, required this.item });

   @override
   Widget build(BuildContext context) {
       
      var color = item.type == TransactionType.expense
          ? AppColors.chiliRed
          : AppColors.asparagus;
      return ListTile(
        onTap: () {
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
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(item.value),
          style: AppTextStyles.mediumText18.apply(color: color),
        ),
      );
 
  }
}