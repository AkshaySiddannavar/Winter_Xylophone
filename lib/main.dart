import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playNote(AudioCache player, int noteNumber) {
    player.play('note$noteNumber.wav');
  }

  Color relateColor(int noteNumber) {
    //Winter Themed Colors (UI)
    //higher the note number higher the pitch and frequency(science)

    //Lower notes(note till 4) represent Winter Nights - deep blue, tone is similar tone used for indicating 'sleep' (opinion)
    //Higher notes(notes after 4) represent Winter Days - light blue and white, tone feels like it indicates 'dawn' (a very subtle one) (opinion)
    //These are just my inferences, not necessarily applicable to everyone since everyone might relate these sounds in a different manner
    //This is just what I 'felt' and wanted to represent

    var decidedColor = Colors.black;

    if (noteNumber == 1) {
      //for 1st
      decidedColor = const Color.fromARGB(255, 2, 62, 165);
    } else if (noteNumber == 2) {
      //for 2nd
      decidedColor = const Color.fromARGB(255, 19, 99, 237);
    } else if (noteNumber == 3) {
      //for 3rd
      decidedColor = const Color.fromARGB(255, 42, 109, 243);
    } else if (noteNumber == 4) {
      //for 4th
      decidedColor = const Color.fromARGB(255, 53, 123, 244);
    } else if (noteNumber == 5) {
      //for 5th
      decidedColor = const Color.fromARGB(255, 69, 133, 244);
    } else if (noteNumber == 6) {
      //for 6th
      decidedColor = const Color.fromARGB(255, 97, 152, 247);
    } else if (noteNumber == 7) {
      //for 7th
      decidedColor = const Color.fromARGB(255, 147, 183, 245);
    } else {
      decidedColor = Colors.deepOrangeAccent;
    }

    return decidedColor;
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioCache();
    //creating an AudioCache object which will be used to play audio in assets

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(
            255, 2, 62, 165), //same color as 1st bar for consistent looks
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              xylophoneBar(player, 1), //Expanded 1
              xylophoneBar(player, 2), //Expanded 2
              xylophoneBar(player, 3), //Expanded 3
              xylophoneBar(player, 4), //Expanded 4
              xylophoneBar(player, 5), //Expanded 5
              xylophoneBar(player, 6), //Expanded 6
              xylophoneBar(player, 7), //Expanded 7
            ],
          ),
        ),
      ),
    );
  }

  Expanded xylophoneBar(AudioCache player, int noteNumber) {
    //does the function of an actual xylophone Bar
    return Expanded(
      child: TextButton(
        onPressed: () {
          playNote(player, noteNumber);
        },
        child: Container(
          padding: EdgeInsets.zero,
          color: relateColor(noteNumber),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
      ),
    );
  }
}
