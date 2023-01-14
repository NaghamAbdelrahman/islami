import 'package:flutter/material.dart';
import 'package:islami/home/radio/radio_controller.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 5, child: Image.asset('assets/images/radio_logo.png')),
      Expanded(flex: 4, child: RadioController()),
    ]);
  }
}
