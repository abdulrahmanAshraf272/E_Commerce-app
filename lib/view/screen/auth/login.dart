import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool t = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 600),
            width: t ? 200 : 6,
            height: t ? 200 : 6,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage(AppImageAssets.onBoardingImageFive))),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 70,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    t = !t;
                  });
                },
                textColor: Colors.white,
                color: Colors.black,
                child: const Text('click'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
