
import 'package:ai_fortune_teller/screen/IntroScreen.dart';
import 'package:ai_fortune_teller/screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 시스템 UI 오버레이 제어를 위한 패키지
import 'package:audioplayers/audioplayers.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.top],
  );

  // final player = AudioPlayer();
  // await player.play(AssetSource("mp3/background.mp3"));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro to Home Demo',
      theme : ThemeData(fontFamily: 'figtree'),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/home': (context) => Homescreen(),
      },
    );
  }
}


