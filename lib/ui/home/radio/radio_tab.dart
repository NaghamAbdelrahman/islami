import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/radio/radio_controller.dart';

import '../../../data/api/api_manager.dart';
import '../../../data/model/RadioResponse.dart';

class RadioTab extends StatelessWidget {
  AudioPlayer audioPlayer = AudioPlayer();

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
          var radios = snapshot.data?.radios ?? [];
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                flex: 2, child: Image.asset('assets/images/radio_logo.png')),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    itemBuilder: (buildContext, index) {
                      return RadioController(
                        radio: radios[index],
                        audioPlayer: audioPlayer,
                      );
                    },
                    itemCount: radios.length)),
          ]);
        });
  }
}
