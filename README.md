# Vimeo Player Trinity
[![pub package](https://img.shields.io/pub/v/better_player.svg)](https://pub.dartlang.org/packages/better_player)
[![pub package](https://img.shields.io/github/license/jhomlala/betterplayer.svg?style=flat)](https://github.com/jhomlala/betterplayer)
[![pub package](https://img.shields.io/badge/platform-flutter-blue.svg)](https://github.com/jhomlala/betterplayer)

A Flutter package for playing any videos from Vimeo by id. Forked from [prilogy/vimeo_player](https://github.com/prilogy/vimeo_player) 

Functions:
* Quality change
* Responsive full screen
* Pause and play
* Rewind
* Playback speed

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Installation
First, add video_player as a dependency in your `pubspec.yaml` file.

## iOS
Warning: The video player is not functional on iOS simulators. An iOS device must be used during development/testing.

Add the following entry to your `Info.plist` file, located in `<project root>/ios/Runner/Info.plist`:

```<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```
This entry allows your app to access video files by URL.

## Android
Ensure the following permission is present in your Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```<uses-permission android:name="android.permission.INTERNET"/>```

The Flutter project template adds it, so it may already be there.

## Supported Formats
On iOS, the backing player is AVPlayer. The supported formats vary depending on the version of iOS, AVURLAsset class has audiovisualTypes that you can query for supported av formats.
On Android, the backing player is ExoPlayer, please refer here for list of supported formats.
On Web, available formats depend on your users' browsers (vendor and version). Check package:video_player_web for more specific information.

## Example

```import 'package:flutter/material.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //primarySwatch: Colors.red,
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xFF22A3D2),
      ),
      home: VideoScreen(),
    );
  }
}

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF15162B), //FF15162B // 0xFFF2F2F2
        appBar: MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar(
                leading: BackButton(color: Colors.white),
                title: Text('Название видео'),
                backgroundColor: Color(0xAA15162B),
              )
            : PreferredSize(
                child: Container(
                  color: Colors.transparent,
                ),
                preferredSize: Size(0.0, 0.0),
              ),
        body: ListView(children: <Widget>[
          VimeoPlayer(id: '395212534', autoPlay: true, loaderColor: Colors.pink),
        ]));
  }
}
```


## Options

| Option        | Desc                                 | Type  |Default Value | Required
|---------------|--------------------------------------|-------|--------------|-------
| id            | Vimeo video id                       |String | ""           | Y
| autoPlay      | Auto play video                      |bool   | null         | Y
| controlColor  | Change color of control icons        |Color  | Color.red    | N
| loaderColor   | Change color of circular indicator   |Color  | Colors.red   | N
| loaderBackgroundColor  | Change background color of circular indicator   |Color  | Colors.blue  | N
| controlsConfig   | Change color, icons and behavior of controls   |ControlsConfig  | ControlsConfig()   | N


## Screenshots

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/1.jpg">
      </td>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/2.jpg">
      </td>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/3.jpg">
      </td>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/4.jpg">
      </td>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/5.jpg">
      </td>
      
   </tr>

  
   <img  src="https://raw.githubusercontent.com/takumade/vimeo_player_trinity/main/screenshots/7.jpg">

   
  </table>



## Specials Thanks

- [Алексей](https://github.com/aolychkin)
- [Nipun Shah](https://github.com/nvshah)
- [trustmefelix](https://github.com/trustmefelix)
- [felixmcy](https://github.com/felixmcy)
- [takumade](https://github.com/takumade)