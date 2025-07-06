import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(), 
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Adress",
        hintText: "youremail@gmail.com",
      ),
      validator: (String? value) {
        //return null if the input is valid
        //return a string if the input is invalid

        //this wasnt necessary until dart 2.12, where null safety was introduced
        if (value == null || value.isEmpty) {
          return "Please enter your email address.";
        }
        if (!value.contains("@") || value.isEmpty) {
          return "Please enter a valid email address.";
        }
        return null; //input is valid
      },
    );
    
  }

  Widget passwordField() {
    // margin: EdgeInsets.only(bottom: 20.0),
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Your password",
      ),
      validator: (value){
        if (value == null || value.isEmpty) {
          return "Please enter your password.";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters long.";
        }
        return null; //input is valid
      },
    );  
}
  

Widget submitButton() {
  return ElevatedButton(
    onPressed: () {
      //reset -> clear the form
      print(formKey.currentState?.validate());
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white, 
    ),
    child: Text("Submit"),
  );
  }
}