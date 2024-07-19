import 'dart:developer';

import 'package:app_financeiro/src/common/either/either.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart' as model;
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TransactionServiceImpl implements TransactionService{
  @override
  Future<List<model.TransactionFinanceiro>?> getAllTransactions() async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      List<model.TransactionFinanceiro> list = [];
      CollectionReference collectionRef = FirebaseFirestore.instance.collection('user-transactions').doc(uid).collection('transactions');
      QuerySnapshot querySnapshot = await collectionRef.get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      for (var doc in documents) {
        var transaction = model.TransactionFinanceiro.fromMap(doc.data() as Map<String, dynamic>);
        list.addAll({transaction});
      }
      return list;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<Either<Exception, Success<Exception, dynamic>>> saveTransaction(model.TransactionFinanceiro transaction) async{
    //
    var uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('user-transactions').doc(uid).collection('transactions');
    collectionRef.add(transaction.toMap());
    return Success(null);
  }

}