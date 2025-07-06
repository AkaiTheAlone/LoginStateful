import 'package:flutter/material.dart';
import '../mixins/validations_mixins.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

//with is a very important keyword in dart
//it allows you to use mixins, which are a way to reuse code in multiple classes
//mixins are like a class that can be used in multiple classes, but they don't have
//to be instantiated. They are used to add functionality to a class without using inheritance.
//in this case, we are using the ValidationsMixins mixin to add validation functionality
class LoginScreenState extends State<LoginScreen> with ValidationsMixins {
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
      validator:validateEmail, //this is a method from the mixin ValidationsMixins{
       
      },
      onSaved: (String? value){
          print("Email saved: $value");
      },
    );
  }

  Widget passwordField() 
  {
    // margin: EdgeInsets.only(bottom: 20.0),
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Your password",
      ),
      validator: validatePassword, //this is a method from the mixin ValidationsMixins
    onSaved: (String? value) {
      //this is called when the form is submitted
      //you can save the value to a variable or send it to a server
      print("Password saved: $value");
    },
    );  
  }
  

Widget submitButton() {
  return ElevatedButton(
    onPressed: () {
      //reset -> clear the form
      //print(formKey.currentState?.validate());
      if (formKey.currentState?.validate() ?? false) 
      {
        formKey.currentState?.save();
        print("Email and password posted successfully!"); 
        //if the form is valid, save the values
        //this one only works in scaffold
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Form submitted successfully!")),
        // );
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white, 
    ),
    child: Text("Submit"),
  );
  }
}