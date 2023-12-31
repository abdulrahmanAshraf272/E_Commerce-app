import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/forget_password/verifycode_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPasswordScreen();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;
  String? email;

  VerifyCodeData verifycodeData = VerifyCodeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    print(statusRequest);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Response ===== ${response['status']}');
        update();
        return true;
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Is Not Correct!");
        statusRequest = StatusRequest.failure;
        update();
        return false;
      }
    } else {
      Get.defaultDialog(title: "Warning", middleText: "Something wrong happed");
      statusRequest = StatusRequest.failure;
      update();
      return false;
    }
  }

  @override
  goToResetPasswordScreen() async {
    if (await checkCode()) {
      Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
