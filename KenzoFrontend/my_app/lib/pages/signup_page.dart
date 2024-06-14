import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/components/square_tile.dart';
import 'package:my_app/pages/login_page.dart';
import 'dart:convert';
import 'config.dart';

class signUp extends StatelessWidget {
  signUp({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final roomNoController = TextEditingController();
  final genderController = TextEditingController();
  final rollNoController = TextEditingController();
  final ageController = TextEditingController();


 void signUserIn() async {
    var regbody_sign = {
      "email": emailController.text,
      "password": passwordController.text,
      "name": passwordController.text,
      "age": passwordController.text,
      "gender": passwordController.text,
      "roll": passwordController.text,
      "room": passwordController.text,

    };
    var response = await http.post(
      Uri.parse(registeration),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regbody_sign),
    );
    print(response);
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
                
                  // google button
                  SquareTile(imagePath: 'lib/images/kenzo.png'),
               

              const SizedBox(height: 0),

              // welcome back, you've been missed!
              Text(
                'Welcome to Kenzo, your own healthcaretaker',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 35),

              //name text field
              MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
              ),
              const SizedBox(height: 5),

              //Age text field
              MyTextField(
                controller: ageController,
                hintText: 'Age',
                obscureText: false,
              ),

              //Gender text field
              const SizedBox(height: 5),
              MyTextField(
                controller: genderController,
                hintText: 'Gender',
                obscureText: false,
              ),

              //Roll no text field
              const SizedBox(height: 5),
              MyTextField(
                controller: rollNoController,
                hintText: 'Roll Number',
                obscureText: false,
              ),

              //room no text field
              const SizedBox(height: 5),
              MyTextField(
                controller: roomNoController,
                hintText: 'Room  Number',
                obscureText: false,
              ),

              // email textfield
              const SizedBox(height: 5),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              // password textfield
              const SizedBox(height: 5),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              // sign in button
              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 5),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Registered?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the sign-up page when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()), // Replace SignUpPage with your actual sign-up page
                      );
                      print("ur are my mommy , oh yeaahhhh!!!!!!!");
                    },
                    child: Text(
                      'Log in',
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