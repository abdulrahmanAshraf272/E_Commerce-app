import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.height / 4.2, color: Colors.orange),
              Positioned(
                top: Get.height / 5.2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage:
                          AssetImage('assets/images/app_logo.png')),
                ),
              )
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                      title: Text('Disable Notifications'),
                      trailing: Switch(
                          value: true,
                          onChanged: (val) {
                            print(val);
                          })),
                  ListTile(
                      onTap: () {},
                      title: Text('Address'),
                      trailing: Icon(
                        Icons.location_city_outlined,
                      )),
                  ListTile(
                      onTap: () {},
                      title: Text('Contact us'),
                      trailing: Icon(
                        Icons.help_outline_rounded,
                      )),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text('Logout', style: TextStyle(color: Colors.red)),
                    trailing: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
