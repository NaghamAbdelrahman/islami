import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../core/model/Radios.dart';

class RadioController extends StatefulWidget {
  Radios radio;
  AudioPlayer audioPlayer;

  RadioController({required this.radio, required this.audioPlayer});

  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  play() async {
    await widget.audioPlayer.play(UrlSource(widget.radio.url ?? ''));
  }

  pause() async {
    await widget.audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: screenSize.width,
      child: Column(
        children: [
          Text(widget.radio.name ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: play,
                icon: Icon(
                  Icons.play_arrow_sharp,
                  size: screenSize.height * 0.05,
                ),
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: screenSize.width * 0.07),
              IconButton(
                onPressed: pause,
                icon: Icon(
                  Icons.pause,
                  size: screenSize.height * 0.05,
                ),
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
