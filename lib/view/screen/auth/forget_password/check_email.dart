import 'package:ecommerce_app/controller/auth/check_email_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_textform_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text('Forget Password',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white))),
      body: GetBuilder<CheckEmailControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: ListView(
                    children: [
                      const CustomTitleAuth(txt: 'Check Email'),
                      const SizedBox(height: 10),
                      const CustomTextBodyAuth(
                          txt:
                              'Please enter your email address to recieve the verification code.'),
                      SizedBox(height: Get.height * 0.1),
                      CustomTextFormAuth(
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        valid: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                        iconData: Icons.email_outlined,
                        textEditingController: controller.email,
                      ),
                      CustomButtonAuth(
                          textButton: 'Send Code',
                          onPressed: () {
                            controller.goToVerfiyCodeScreen();
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
    );
  }
}
