import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watts_left/pages/splash_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
  );

  runApp(const WattsLeft());
}

class WattsLeft extends StatelessWidget {
  const WattsLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Watts Left",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}