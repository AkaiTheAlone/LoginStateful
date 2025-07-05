import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login_screen.dart';

class App extends StatelessWidget {
  //function build overrides build from stateless widget
  //context is a Build instance inherited from stateless widget also
  @override
  Widget build(context) {
    return MaterialApp(
      title: "Log me in!",
      home: Scaffold(body: LoginScreen()),
    );
  }
}
