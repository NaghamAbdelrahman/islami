import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/model/Radio.dart';

class RadioItem extends StatefulWidget {
  Radios radio;

  RadioItem(this.radio);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState

    audioPlayer = AudioPlayer();
  }

  play() async {
    await audioPlayer.play(UrlSource(widget.radio.radioUrl ?? ''));
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(widget.radio.name ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
                counter % 2 == 0 ? pause() : play();
              });
            },
            icon: Icon(
              counter % 2 == 0
                  ? Icons.play_circle_rounded
                  : Icons.pause_circle_filled_rounded,
              size: MediaQuery.of(context).size.height * 0.08,
            ),
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
