import 'package:flutter/material.dart';
import 'number_audio.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.orange, "Two"),
    NumberAudio("three.wav", Colors.purple, "Three"),
    NumberAudio("four.wav", Colors.orange, "Four"),
    NumberAudio("five.wav", Colors.pink, "Five"),
    NumberAudio("six.wav", Colors.green, "Six"),
    NumberAudio("seven.wav", Colors.yellow, "Seven"),
    NumberAudio("eight.wav", Colors.indigo, "Eight"),
    NumberAudio("nine.wav", Colors.brown, "Nine"),
    NumberAudio("ten.wav", Colors.blue, "Ten"),
  ];

  played(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    height: 50.0,
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: played(numberList[i].audioUri),
                      child: Text(
                        numberList[i].buttonText,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
