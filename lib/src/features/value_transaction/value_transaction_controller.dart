import 'dart:developer';

import 'package:app_financeiro/src/common/either/either.dart';
import 'package:app_financeiro/src/common/ui/dialog/dialog_mixin.dart';
import 'package:app_financeiro/src/common/ui/loader/loader_mixin.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';
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
    log('Entrou em saveValue');
    var response = await _transactionService.saveTransaction(transaction);
    switch(response){
      case Failure<Exception, Success<Exception, dynamic>>():
        loading(false);
        log('entrou failure');
        message(MessageModel.error(title: 'Erro', message: 'Erro ao cadastrar transação', textButton: 'Fechar'));
        //Get.back();
      case Success<Exception, Success<Exception, dynamic>>():
        loading(false);
        Get.back();
    }
    
    //message(MessageModel.info(title: 'Sucesso', message: 'Transação cadastrada com sucesso', textButton: 'Fechar'));
    //Get.back();
  }

 void editValue(TransactionFinanceiro transaction)async{
  log('Entrou em editValue');
  loading(true);
  var response = await _transactionService.editTransaction(transaction);
  loading(false);
  switch(response){
      case Failure<Exception, Success<Exception, dynamic>>():
        message(MessageModel.error(title: 'Erro', message: 'Erro ao salvar edição', textButton: 'Fechar'));
      case Success<Exception, Success<Exception, dynamic>>():
        // TODO: Handle this case.
  }
  //Get.back();
 }


}