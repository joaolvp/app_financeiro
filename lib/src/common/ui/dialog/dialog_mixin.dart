import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DialogMixin on GetxController {
  void dialogListenner(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.defaultDialog(
            backgroundColor: AppColors.iceWhite,
            titleStyle: const TextStyle(
              color: AppColors.black,
            ),
            title: model.title,
            content: Text(
              model.message,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.black,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                style:
                    TextButton.styleFrom(backgroundColor: model.type.color()),
                child: const Text(
                  'Fechar',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ]);
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final String textButton;
  final MessageType type;

  MessageModel(
      {required this.title,
      required this.message,
      required this.textButton,
      required this.type});

  MessageModel.error({
    required this.title,
    required this.message,
    required this.textButton,
  }) : type = MessageType.error;

  MessageModel.info({
    required this.title,
    required this.message,
    required this.textButton,
  }) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return AppColors.chiliRed;
      case MessageType.info:
        return AppColors.asparagus;
    }
  }
}
