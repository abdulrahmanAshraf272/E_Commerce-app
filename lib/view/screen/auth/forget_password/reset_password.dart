import 'package:ecommerce_app/controller/auth/reset_password_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_textform_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text('Reset Password',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CustomTitleAuth(txt: 'New Password'),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(txt: 'Please Enter Your New Password.'),
            SizedBox(height: Get.height * 0.1),
            CustomTextFormAuth(
              hintText: 'Enter Your Password',
              labelText: 'Password',
              valid: (val) {
                return validInput(val!, 5, 100, 'password');
              },
              iconData: Icons.lock_outline,
              textEditingController: controller.password,
            ),
            const SizedBox(height: 20),
            CustomTextFormAuth(
              hintText: 'Re Enter Your Password',
              labelText: 'Password again',
              valid: (val) {
                return validInput(val!, 5, 100, 'password');
              },
              iconData: Icons.lock_outline,
              textEditingController: controller.checkMatchPassword,
            ),
            CustomButtonAuth(
                textButton: 'Save',
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
