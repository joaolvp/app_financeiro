import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: Get.width * 0.65,
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.photoUser.value != ''
                        ? CircleAvatar(
                            radius: Get.height * 0.1,
                            backgroundImage:
                                NetworkImage(controller.photoUser.value))
                        : CircleAvatar(
                            radius: Get.height * 0.1,
                            child: Icon(
                              Icons.person,
                              size: Get.height * 0.07,
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.nameUser.value,
                      style: AppTextStyles.mediumText18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.emailUser.value,
                      style: AppTextStyles.mediumText16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                        visible: controller.providerIdUser.value == 'password',
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        //color: AppColors.chiliRed,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Alterar e-mail',
                                        style: AppTextStyles
                                            .mediumText16 /* .copyWith(color: AppColors.chiliRed) */,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        //color: AppColors.chiliRed,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Alterar nome',
                                        style: AppTextStyles
                                            .mediumText16 /* .copyWith(color: AppColors.chiliRed) */,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.delete,
                                //color: AppColors.chiliRed,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Deletar conta',
                                style: AppTextStyles
                                    .mediumText16 /* .copyWith(color: AppColors.chiliRed) */,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => controller.logout(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.logout,
                                //color: AppColors.chiliRed,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Encerrar sessão',
                                  style: AppTextStyles.mediumText16
                                  //.copyWith(color: AppColors.chiliRed),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              })),
        ],
      ),
    );
  }
}
