import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text('Success SignUp',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white))),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
                child: Icon(Icons.check_circle_outline,
                    size: 200, color: AppColor.primaryColor)),
            Text('Congratulations!',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 15),
            Text('Congratulations!',
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.5))),
            const Spacer(),
            CustomButtonAuth(
                textButton: 'start',
                onPressed: () {
                  Get.offAllNamed(AppRoute.login);
                })
          ],
        ),
      ),
    );
  }
}
