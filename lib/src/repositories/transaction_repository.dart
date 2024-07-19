import 'package:app_financeiro/src/model/transaction_financeiro.dart';

abstract class TransactionRepository {
  Future<List<TransactionFinanceiro>?> getAllTransactions();
}