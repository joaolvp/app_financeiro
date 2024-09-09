import 'dart:developer';

import 'package:app_financeiro/src/common/either/either.dart';
import 'package:app_financeiro/src/model/general_user_info.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart' as model;
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionServiceImpl implements TransactionService {
  @override
  Future<Either<Exception, GeneralUserInfo?>> getAllTransactions() async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      List<model.TransactionFinanceiro> list = [];
      DocumentReference documentRef =
          FirebaseFirestore.instance.collection('user-transactions').doc(uid);
      QuerySnapshot querySnapshot =
          await documentRef.collection('transactions').get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      log('Documents é: $documents');

      DocumentSnapshot documentGeneralData = await documentRef.get();
      log('Document General Data é: ${documentGeneralData.data()}');
      Object? generalData = documentGeneralData.data();
      log('General Data é: $generalData');
      var generalUserInfo =
          GeneralUserInfo.fromMap(generalData as Map<String, dynamic>);
      log('General User Info é: $generalUserInfo');
      for (var doc in documents) {
        log(doc.id);
        var transaction = model.TransactionFinanceiro.fromMap(
            doc.data() as Map<String, dynamic>);
        transaction.uid = doc.id;
        list.addAll({transaction});
      }
      generalUserInfo.listTransactionFinceiro = list;

      return Success(generalUserInfo);
    } catch (e) {
      log(e.toString());
      return Failure(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Success<Exception, dynamic>>> saveTransaction(
      model.TransactionFinanceiro transaction) async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      CollectionReference collectionRef = FirebaseFirestore.instance
          .collection('user-transactions')
          .doc(uid)
          .collection('transactions');
      log('$collectionRef');
      log('${collectionRef.get()}');
      collectionRef.add(transaction.toMap());
      //throw Exception();
      return Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Either<Exception, Success<Exception, dynamic>>> editTransaction(
      model.TransactionFinanceiro transaction) async {
    try {
      log('Entrou no editTransaction');
      var uidUser = FirebaseAuth.instance.currentUser!.uid;
      var uidDoc = transaction.uid;
      CollectionReference collectionRef = FirebaseFirestore.instance
          .collection('user-transactions')
          .doc(uidUser)
          .collection('transactions');
      collectionRef.doc(uidDoc).update(transaction.toMap());
      //throw Exception();
      return Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
