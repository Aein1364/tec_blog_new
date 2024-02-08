import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/controller/register_controller.dart';
import 'package:tec_blog_new/controller/verify_code_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/main.dart';

class EmptyStateScreen extends StatelessWidget {
  EmptyStateScreen({super.key});
  RxBool visible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterController registerController = Get.put(RegisterController());
  VerifyCodeController verifyCodeController = Get.put(VerifyCodeController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.monkey.svg(width: Get.width / 3),
            const SizedBox(
              height: 40,
            ),
            Text(
              '''به تک‌بلاگ خوش اومدی
      
      برای ارسال مطلب و پادکست باید حتما 
      ثبت نام کنی ''',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Container(
                        width: Get.width,
                        height: Get.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'لطفا ایمیلت رو وارد کن',
                              style: textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              // key: formKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 7.38),
                                child: TextFormField(
                                  controller:
                                      registerController.emailController.value,
                                  // width: Get.width / 1.5,
                                  // height: Get.height / 19,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'ایمیلت رو وارد کن';
                                    }
                                    if (!value.isEmail) {
                                      return 'ایمیلت رو درست وارد کن';
                                    }
                                    return 'آفرین';
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: MyColors.purpleColor,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    hintText: 'techblog@gmail.com',
                                    hintStyle:
                                        textTheme.headlineSmall!.copyWith(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                await registerController.registerPostMethode();
                                if (registerController.responseState.value ==
                                    true) {
                                  Get.snackbar(
                                      'موفق', 'کد تایید به ایمیلت ارسال شد',
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white);
                                  Navigator.of(context).pop();
                                  Get.bottomSheet(
                                    GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Container(
                                        width: Get.width,
                                        height: Get.height / 3,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'لطفا کد فعال سازی رو وارد کن',
                                              style: textTheme.headlineSmall!
                                                  .copyWith(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Form(
                                              // key: formKey,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Get.width / 7.38),
                                                child: Obx(
                                                  () => TextFormField(
                                                    obscureText: visible.value,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        verifyCodeController
                                                            .verifyCodeController
                                                            .value,
                                                    // width: Get.width / 1.5,
                                                    // height: Get.height / 19,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'لطفا کد فعال سازی رو وارد کن';
                                                      }
                                                      if (value.length != 6) {
                                                        return 'لطفا کد فعال سازی رو درست وارد کن';
                                                      }
                                                      return '';
                                                    },
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      prefixIcon:
                                                          GestureDetector(
                                                              onTap: () {
                                                                visible.value =
                                                                    !visible
                                                                        .value;
                                                              },
                                                              child:
                                                                  visible.value
                                                                      ? Icon(
                                                                          Icons
                                                                              .visibility,
                                                                          color:
                                                                              Colors.grey,
                                                                        )
                                                                      : Icon(
                                                                          Icons
                                                                              .visibility_off,
                                                                          color:
                                                                              Colors.grey,
                                                                        )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: MyColors
                                                              .purpleColor,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      hintText: '******',
                                                      hintStyle: textTheme
                                                          .headlineSmall!
                                                          .copyWith(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                await verifyCodeController
                                                    .verifyPostMethode();
                                                if (verifyCodeController
                                                        .responseState.value ==
                                                    'verified') {
                                                  Get.snackbar('موفق',
                                                      'ثبت نام شما با موفقیت انجام شد',
                                                      backgroundColor:
                                                          Colors.green,
                                                      colorText: Colors.white);
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.of(context).pop();
                                                  Get.toNamed(
                                                      RoutPage.wellcomeScreen);
                                                } else if (verifyCodeController
                                                        .responseState.value ==
                                                    'expired') {
                                                  Get.snackbar('خطا',
                                                      'کد فعال سازی منقضی شده',
                                                      backgroundColor:
                                                          Colors.red,
                                                      colorText: Colors.white);
                                                } else {
                                                  Get.snackbar('خطا',
                                                      'کد فعال سازی رو اشتباه وارد کردی',
                                                      backgroundColor:
                                                          Colors.red,
                                                      colorText: Colors.white);
                                                }
                                              },
                                              child: const Text('ادامه'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                // formKey.currentState!.validate()
                                //     ? const GetSnackBar(
                                //         title: 'موفق ',
                                //         message: 'ایمیلت رو وارد کن',
                                //       )
                                //     : const GetSnackBar(
                                //         title: 'خطا',
                                //         message: 'ایمیلت رو صحیح وارد نکردی',
                                //       );
                              },
                              child: const Text('ادامه'),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('بزن بریم'))
          ],
        ),
      ),
    ));
  }
}
