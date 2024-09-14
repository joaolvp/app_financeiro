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
              width: Get.width,
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: Get.height * 0.1,
                              backgroundImage: const NetworkImage(
                                  'https://i.pinimg.com/1200x/a3/96/63/a3966351deb43da383db28f854e2f6b3.jpg')),
                          const Positioned(
                            //top: 120,
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              maxRadius: 20,
                              backgroundColor: AppColors.asparagus,
                              child: Icon(Icons.edit)
                            ),
                          )
                        ],
                      ),
                      /* controller.photoUser.value != ''
                          ? CircleAvatar(
                              radius: Get.height * 0.1,
                              backgroundImage:
                                  NetworkImage('https://i.pinimg.com/1200x/a3/96/63/a3966351deb43da383db28f854e2f6b3.jpg'))
                          : CircleAvatar(
                              radius: Get.height * 0.1,
                              backgroundImage: NetworkImage('https://i.pinimg.com/1200x/a3/96/63/a3966351deb43da383db28f854e2f6b3.jpg'),
                              /* child: Icon(
                                Icons.person,
                                size: Get.height * 0.07,
                              ), */
                            ), */
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
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:
                                          AppColors.asparagus.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.email,
                                    color: AppColors.asparagus,
                                  )),
                              title: const Text(
                                'Alterar e-mail', /* style: TextStyle(color: AppColors.chiliRed), */
                              ),
                              trailing: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.grey.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.grey,
                                  )),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:
                                          AppColors.asparagus.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.person,
                                    color: AppColors.asparagus,
                                  )),
                              title: const Text(
                                'Alterar nome', /* style: TextStyle(color: AppColors.chiliRed), */
                              ),
                              trailing: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.grey.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.grey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.asparagus.withOpacity(0.2)),
                            child: const Icon(
                              Icons.delete,
                              color: AppColors.asparagus,
                            )),
                        title: const Text(
                          'Deletar conta', /* style: TextStyle(color: AppColors.chiliRed), */
                        ),
                        trailing: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.grey.withOpacity(0.2)),
                            child: const Icon(
                              Icons.chevron_right,
                              color: AppColors.grey,
                            )),
                      ),
                      ListTile(
                        onTap: () => controller.logout(),
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.asparagus.withOpacity(0.2)),
                            child: const Icon(
                              Icons.logout,
                              color: AppColors.asparagus,
                            )),
                        title: const Text(
                          'Encerrar sessão',
                          style: TextStyle(color: AppColors.chiliRed),
                        ),
                        trailing: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.grey.withOpacity(0.2)),
                            child: const Icon(
                              Icons.chevron_right,
                              color: AppColors.grey,
                            )),
                      ),
                    ],
                  ),
                );
              })),
        ],
      ),
    );
  }
}
