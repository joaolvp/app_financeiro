import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'wallet_controller.dart';

class WalletPage extends GetView<WalletController> {
    
    const WalletPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(child: Text('Estamos em obras', style: TextStyle(fontSize: 20),),),
        );
    }
}