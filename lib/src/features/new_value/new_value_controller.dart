import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';
import 'package:get/get.dart';

class NewValueController extends GetxController {
  final TransactionService _transactionService;

  NewValueController({required TransactionService transactionService}) : _transactionService = transactionService;

  
  
  void saveValue(TransactionFinanceiro transaction){
    _transactionService.saveTransaction(transaction);
  }
}