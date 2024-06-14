import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/components/my_button_log.dart';
import 'package:my_app/components/my_textfield.dart';
import "package:http/http.dart" as http;
import 'package:my_app/components/square_tile.dart';
import 'package:my_app/main_page/MainPage.dart';
import 'package:my_app/pages/signup_page.dart';
import 'config.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  // sign user in method
  void loginUserIn(BuildContext context) async {
    var regbody = {
      "email": emailController.text,
      "password": passwordController.text
    };
    var response = await http.post(
      Uri.parse(login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regbody),
    );

    var jsonresponse = jsonDecode(response.body);
    if (jsonresponse['status']) {
      print("HI");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MainPage()), // Replace SignUpPage with your actual sign-up page
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 0),

              // logo

              SquareTile(imagePath: 'lib/images/kenzo.png'),

              const SizedBox(height: 0),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 15),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // sign in button
              MyButton_log(
                onTap: () => loginUserIn(context),
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                signUp()), // Replace SignUpPage with your actual sign-up page
                      );
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
