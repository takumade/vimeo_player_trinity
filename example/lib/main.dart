import 'package:flutter/material.dart';
import 'package:vimeoplayer_trinity/vimeoplayer_trinity.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //primarySwatch: Colors.red,
      theme: ThemeData.dark(),
      home: const VideoScreen(),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: const Text('Vimeo Player Trinity'),
              centerTitle: true,
            )
          : null,
      body: Column(
        children: const [
          VimeoPlayer(
            id: '395212534',
            autoPlay: true,
            fullScreenByDefault: false,
          ),
        ],
      ),
    );
  }
}
