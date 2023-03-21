import 'package:flutter/material.dart';

class SuraStyleWidget extends StatelessWidget {
  String content;
  int index;

  SuraStyleWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Text(
        '$content [$index]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
