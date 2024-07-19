import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:app_financeiro/src/repositories/transaction_repository.dart';
import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LoginService _loginService;
  final TransactionRepository _transactionRepository;

  HomeController({required LoginService loginService, required TransactionRepository transactionRepository}) : _loginService = loginService, _transactionRepository = transactionRepository;

  final userTransactions = <TransactionFinanceiro>[].obs;

  @override
  void onReady() async{
    super.onReady();
    var data = await _transactionRepository.getAllTransactions();
    if(data is List<TransactionFinanceiro>){
      userTransactions.assignAll(data);
    } 
    
  }

  void logout () async{
    await _loginService.logout();
  }


}