import 'package:alvo_joystick/app/views/about_page.dart';
import 'package:flutter/material.dart';
import 'app/views/config_page.dart';
import 'app/views/help_page.dart';
import 'app/views/joystick_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey
        ,
      ),
      routes: <String, WidgetBuilder>{
        '/':(context) => JoystickPage(),
        '/config':(context) => ConfigPage(),
        '/about':(context) => AboutPage(),
        '/help':(context) => Helppage(),
      },
    );
  }
}
