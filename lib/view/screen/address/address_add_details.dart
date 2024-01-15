import 'package:ecommerce_app/controller/address/address_add_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/address/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressAddDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(title: const Text('Add Address Details')),
        floatingActionButton: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(15)),
            child: MaterialButton(
              onPressed: () {
                controller.addAddress();
              },
              textColor: Colors.white,
              child: Text('Add'),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GetBuilder<AddressAddDetailsControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      CustomTextFormAddress(
                          hintText: 'ex: home',
                          labelText: 'Address Name',
                          textEditingController: controller.nameTextController,
                          valid: (val) {
                            return validInput(val!, 0, 70, '');
                          }),
                      CustomTextFormAddress(
                          hintText: 'ex: Alexandria',
                          labelText: 'City',
                          textEditingController: controller.cityTextController,
                          valid: (val) {
                            return validInput(val!, 0, 70, '');
                          }),
                      CustomTextFormAddress(
                          hintText: 'ex: Khalid ebn alwaleed',
                          labelText: 'Street',
                          textEditingController:
                              controller.streetTextController,
                          valid: (val) {
                            return validInput(val!, 0, 70, '');
                          }),
                      CustomTextFormAddress(
                          hintText: 'ex: 100',
                          labelText: 'Buidling',
                          textEditingController:
                              controller.buildingNoTextController,
                          valid: (val) {
                            return validInput(val!, 0, 70, '');
                          }),
                      CustomTextFormAddress(
                          hintText: 'ex: 7',
                          labelText: 'Floor',
                          textEditingController: controller.floorTextController,
                          valid: (val) {
                            return validInput(val!, 0, 70, '');
                          }),
                    ],
                  ),
                ),
              )),
        ));
  }
}
