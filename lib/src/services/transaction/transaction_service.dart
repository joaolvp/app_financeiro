import 'package:app_financeiro/src/common/either/either.dart';
import 'package:app_financeiro/src/model/general_user_info.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';

abstract class TransactionService {
  Future<Either<Exception, GeneralUserInfo?>> getAllTransactions();
  Future<Either<Exception, Success>> saveTransaction(TransactionFinanceiro transaction);
}