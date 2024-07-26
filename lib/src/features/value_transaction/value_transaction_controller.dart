import 'package:app_financeiro/src/common/ui/dialog/dialog_mixin.dart';
import 'package:app_financeiro/src/common/ui/loader/loader_mixin.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueTransactionController extends GetxController with LoaderMixin, DialogMixin {
  final TransactionService _transactionService;
  final loading = false.obs;
  var message = Rxn<MessageModel>();

  ValueTransactionController({required TransactionService transactionService}) : _transactionService = transactionService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    dialogListenner(message);
  }
  
  void saveValue(TransactionFinanceiro transaction)async{
    loading(true);
    await _transactionService.saveTransaction(transaction);
    loading(false);
    //message(MessageModel.info(title: 'Sucesso', message: 'Transação cadastrada com sucesso', textButton: 'Fechar'));
    Get.back();
  }
}