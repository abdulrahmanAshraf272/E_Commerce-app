import 'package:ecommerce_app/controller/address/addres_view_controller.dart';
import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:ecommerce_app/view/screen/address/address_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return GetBuilder<CheckoutController>(
      builder: (controller) {
        String title =
            controller.myAddresses.length > 1 ? 'Select Address' : 'Address';
        return HandlingDataRequest(
            statusRequest: controller.addressStatusRequest,
            widget: controller.myAddresses.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      ...List.generate(controller.myAddresses.length, (index) {
                        return AddressListItemCheckout(
                            addressModel: controller.myAddresses[index]);
                      })
                    ],
                  )
                : Center(
                    child: MaterialButton(
                    onPressed: () {
                      controller.goToAddAddress();
                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: const Text('Add Address'),
                  )));
      },
    );
  }
}

class AddressListItemCheckout extends StatelessWidget {
  final AddressModel addressModel;
  const AddressListItemCheckout({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return GetBuilder<CheckoutController>(
        builder: (controller) => GestureDetector(
              onTap: () {
                controller.selectAddress(addressModel);
              },
              child: Container(
                decoration: controller.addressSelected == addressModel &&
                        controller.myAddresses.length != 1
                    ? BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      )
                    : const BoxDecoration(),
                child: Card(
                    child: ListTile(
                  title: Text(
                    addressModel.addressName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: RichText(
                      text: TextSpan(
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                          children: [
                        TextSpan(text: addressModel.addressBuilding),
                        const TextSpan(text: ', '),
                        TextSpan(text: addressModel.addressStreet),
                        const TextSpan(text: ', '),
                        TextSpan(text: addressModel.addressCity),
                      ])),
                )),
              ),
            ));
  }
}
