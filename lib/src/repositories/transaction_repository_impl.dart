
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/repositories/transaction_repository.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService _transactionService;

  TransactionRepositoryImpl({required TransactionService transactionService}) : _transactionService = transactionService;


  @override
  Future<List<TransactionFinanceiro>?> getAllTransactions() async{
    var data = await _transactionService.getAllTransactions();
    //throw UnimplementedError();
    return data;
  }
  
}