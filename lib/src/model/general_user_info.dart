// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:app_financeiro/src/model/transaction_financeiro.dart';

class GeneralUserInfo {
  num? saldoConta;
  num? despesaTotal;
  num? receitaTotal;
  List<TransactionFinanceiro>? listTransactionFinceiro;
  GeneralUserInfo({
    this.saldoConta,
    this.despesaTotal,
    this.receitaTotal,
    this.listTransactionFinceiro,
  });
 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'saldo_conta': saldoConta,
      'despesa_total': despesaTotal,
      'receita_total': receitaTotal,
      'transactions': listTransactionFinceiro?.map((x) => x.toMap()).toList(),
    };
  }

  factory GeneralUserInfo.fromMap(Map<String, dynamic> map) {
    return GeneralUserInfo(
      saldoConta: map['saldo_conta'] != null ? map['saldo_conta'] as num : null,
      despesaTotal: map['despesa_total'] != null ? map['despesa_total'] as num : null,
      receitaTotal: map['receita_total'] != null ? map['receita_total'] as num : null,
      listTransactionFinceiro: map['transactions'] != null ? List<TransactionFinanceiro>.from((map['transactions'] as List<int>).map<TransactionFinanceiro?>((x) => TransactionFinanceiro.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralUserInfo.fromJson(String source) => GeneralUserInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
