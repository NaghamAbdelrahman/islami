import 'package:flutter/material.dart';
import 'package:islami/sura_content/sura_content_arguments.dart';

class SuraContentScreen extends StatelessWidget {
  static const routeName = 'suraContent';

  @override
  Widget build(BuildContext context) {
    SuraDetailsArguments args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.tittle),
          ),
        ));
  }
}
