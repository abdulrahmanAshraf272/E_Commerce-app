import 'package:ecommerce_app/controller/address/addres_view_controller.dart';
import 'package:ecommerce_app/controller/address/address_add_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressViewControllerImp());

    return Scaffold(
        appBar: AppBar(title: Text('Address')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.goToAddAddress();
            },
            child: Icon(Icons.add)),
        body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(controller.myAddresses.length,
                            (index) {
                          return AddressListItem(
                              addressModel: controller.myAddresses[index]);
                        })
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}

class AddressListItem extends StatelessWidget {
  final AddressModel addressModel;
  const AddressListItem({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressViewControllerImp());
    return Card(
        child: ListTile(
      title: Text(
        addressModel.addressName!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
              children: [
            TextSpan(text: addressModel.addressBuilding),
            TextSpan(text: ', '),
            TextSpan(text: addressModel.addressStreet),
            TextSpan(text: ', '),
            TextSpan(text: addressModel.addressCity),
          ])),
      trailing: IconButton(
          onPressed: () {
            controller.deleteData(addressModel);
          },
          icon: Icon(
            Icons.delete_outline,
            color: Colors.orange,
          )),
    ));
  }
}
