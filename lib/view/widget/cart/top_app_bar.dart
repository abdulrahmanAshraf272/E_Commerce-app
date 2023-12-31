import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final String txt;
  const TopAppBar({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer()
          ],
        ));
  }
}
