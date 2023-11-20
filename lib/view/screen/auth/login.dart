import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_textform_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:ecommerce_app/view/widget/auth/forget_pass_button.dart';
import 'package:ecommerce_app/view/widget/auth/go_to_signup_button.dart';
import 'package:ecommerce_app/view/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            title: Text('Sign In',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white))),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const CustomTitleAuth(txt: 'Welcome Back'),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      txt:
                          'Sign in with your email and password or continue with social media.'),
                  SizedBox(height: Get.height * 0.1),
                  CustomTextFormAuth(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    valid: (val) {
                      return validInput(val!, 5, 100, 'email');
                    },
                    iconData: Icons.email_outlined,
                    textEditingController: controller.emailController,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomTextFormAuth(
                      obscureText: controller.visiblePassword,
                      visiblePasswordOnTap: () {
                        controller.showPassword();
                      },
                      hintText: 'Enter Your Password',
                      labelText: 'Password',
                      valid: (val) {
                        return validInput(val!, 5, 100, 'password');
                      },
                      iconData: Icons.lock_outline,
                      textEditingController: controller.passwordController,
                    ),
                  ),
                  ForgetPassButton(
                    onPress: () => controller.goToForgetPassword(),
                  ),
                  CustomButtonAuth(
                      textButton: 'Sign In',
                      onPressed: () {
                        controller.login();
                      }),
                  const SizedBox(height: 20),
                  GoToSignUpButton(
                    onPress: () => controller.goToSignUpScreen(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
