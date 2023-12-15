import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text('${controller.data[0]['users_name']}');
              },
            ));
      }),
    );
  }
}
//abdulraman ashraf mohamed abdulghani esmaeel abdulghane ashraf mohameed abdulghanei ssmael abdulramana hraf 
