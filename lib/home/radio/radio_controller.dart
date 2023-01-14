import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/model/Radio.dart';
import 'package:islami/core/model/RadioResponse.dart';
import 'package:islami/home/radio/radio_item.dart';

class RadioController extends StatefulWidget {
  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  late AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
        future: ApiManager.fetchRadio(),
        builder: (buildContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).accentColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('error loading \n ${snapshot.error}'),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (buildContext, index) {
                return RadioItem(snapshot.data?.radios![index] ?? Radios());
              },
              itemCount: snapshot.data?.radios?.length);
        });
  }
}
