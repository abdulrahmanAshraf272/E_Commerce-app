import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/controller/auth/verify_code_controller.dart';
import 'package:ecommerce_app/controller/auth/verifycode_signup_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_textform_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text('Verification Code',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CustomTitleAuth(txt: 'Check Code'),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(txt: 'Please Enter The OTP Code.'),
            SizedBox(height: Get.height * 0.1),
            OtpTextField(
              numberOfFields: 6,
              //borderColor: Colors.black,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.verifyCode = verificationCode;
                controller.goToSuccessSignUp();
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text('Verification Code'),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     });
              },
            ),
          ],
        ),
      ),
    );
  }
}
