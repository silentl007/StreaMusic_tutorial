import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Music',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: RaisedButton(
                child: Text('Stream'),
                onPressed: () async {
                  try {
                    print('trying...');
                    await assetsAudioPlayer.open(
                      Audio.network(
                          "https://res.cloudinary.com/mediacontrol/video/upload/v1617959387/music_stream/tumblr_laxvb57sah1qd60n9o1_nufkvv.mp3"),
                    );
                  } catch (t) {
                    //mp3 unreachable
                    print(t);
                  }
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('Stop'),
                onPressed: () {
                  assetsAudioPlayer.stop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
