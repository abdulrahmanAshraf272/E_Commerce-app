import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_textform_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:ecommerce_app/view/widget/auth/go_to_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            title: Text('Sign Up',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white))),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const CustomTitleAuth(txt: 'Welcome'),
                            const SizedBox(height: 10),
                            const CustomTextBodyAuth(
                                txt:
                                    'Sign in with your email and password or continue with social media.'),
                            SizedBox(height: Get.height * 0.1),
                            CustomTextFormAuth(
                              hintText: 'Enter Your Username',
                              labelText: 'Username',
                              valid: (val) {
                                return validInput(val!, 5, 100, 'username');
                              },
                              iconData: Icons.person,
                              textEditingController: controller.username,
                            ),
                            CustomTextFormAuth(
                              hintText: 'Enter Your Email',
                              labelText: 'Email',
                              valid: (val) {
                                return validInput(val!, 5, 100, 'email');
                              },
                              iconData: Icons.email_outlined,
                              textEditingController: controller.email,
                            ),
                            CustomTextFormAuth(
                              hintText: 'Enter Your Phone',
                              labelText: 'Phone',
                              valid: (val) {
                                return validInput(val!, 5, 11, 'phone');
                              },
                              iconData: Icons.phone_android_outlined,
                              textEditingController: controller.phone,
                            ),
                            CustomTextFormAuth(
                              hintText: 'Enter Your Password',
                              labelText: 'Password',
                              valid: (val) {
                                return validInput(val!, 5, 20, 'password');
                              },
                              iconData: Icons.lock_outline,
                              textEditingController: controller.password,
                            ),
                            CustomButtonAuth(
                                textButton: 'Sign Up',
                                onPressed: () async {
                                  await controller.signup();
                                }),
                            const SizedBox(height: 20),
                            GoToSignInButton(onPress: () {
                              controller.goToSignInScreen();
                            })
                          ],
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
