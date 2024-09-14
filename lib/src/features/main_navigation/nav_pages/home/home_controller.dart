import 'dart:developer';

import 'package:app_financeiro/src/common/either/either.dart';
import 'package:app_financeiro/src/common/ui/dialog/dialog_mixin.dart';
import 'package:app_financeiro/src/common/ui/loader/loader_mixin.dart';
import 'package:app_financeiro/src/model/general_user_info.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with LoaderMixin, DialogMixin{
  final TransactionService _transactionService;
  final RxBool loading = false.obs;
  var message = Rxn<MessageModel>();

  HomeController({required TransactionService transactionService})
      : _transactionService = transactionService;

  var userTransactions = <TransactionFinanceiro>[].obs;

  Rx<String> nameUser = ''.obs;
  Rx<num> saldoEmConta = 0.obs;
  Rx<num> receitaTotal = 0.obs;
  Rx<num> despesaTotal = 0.obs;

  var fabIsVisible = true.obs;



  @override
  void onReady() async {
    super.onReady();
    loaderListener(loading);
    dialogListenner(message);
    getHomeData();
  }
  

  getHomeData()async{
    nameUser.value = FirebaseAuth.instance.currentUser!.displayName.toString().split(' ')[0];
    loading(true);
    var data = await _transactionService.getAllTransactions();
    switch (data) {
      case Failure<Exception, GeneralUserInfo?>(exception: final exc):
        log(exc.toString());
      case Success<Exception, GeneralUserInfo?>():
        userTransactions.value = data.value!.listTransactionFinceiro!;
        saldoEmConta.value = data.value!.saldoConta!;
        receitaTotal.value = data.value!.receitaTotal!;
        despesaTotal.value = data.value!.despesaTotal!;
    }
    loading(false);
  }

  deleteTransaction(String uid)async{
    loading(true);
  var response = await _transactionService.deleteTransaction(uid);
  loading(false);
  switch(response){
      case Failure<Exception, Success<Exception, dynamic>>():
        await message(MessageModel.error(title: 'Erro', message: 'Erro ao salvar edição', textButton: 'Fechar'));
      case Success<Exception, Success<Exception, dynamic>>():
        Get.back();
  }
  }






  void teste() async {
    for (var item in userTransactions) {
      print('entrou no userTransactions.map');
      if (item.type.type() == TransactionType.income.type()) {
        print('entrou no income ${saldoEmConta.value} e ${item.value}');
        saldoEmConta.value += item.value;
        receitaTotal.value += item.value;
        //return item.value;
      } else {
        print('entrou no else');
        saldoEmConta.value += (item.value * -1);
        despesaTotal.value += (item.value * -1);
        //return (item.value * -1);
      }
    }

    userTransactions.map((item) {
      print('entrou no userTransactions.map');
      if (item.type.type() == TransactionType.income.type()) {
        print('entrou no income ${saldoEmConta.value} e ${item.value}');
        saldoEmConta.value += item.value;
        receitaTotal.value += item.value;
        //return item.value;
      } else {
        print('entrou no else');
        saldoEmConta.value += (item.value * -1);
        despesaTotal.value += (item.value * -1);
        //return (item.value * -1);
      }
    });
  }



}
