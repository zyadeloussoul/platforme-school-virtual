import "package:flutter/material.dart";
import "package:virtual_school/login.dart";
import 'dart:convert';
import 'main.dart';
import 'package:http/http.dart' as http;

class User {

  String firstName;
  String lastName;
  String email;
  String password;

  List<Course>? courseList;

  User({

    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,

    this.courseList,
  });

  Map<String, dynamic> toJson() {
    return {

      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,

      'courseList': courseList,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
    );
  }
}


class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController = TextEditingController();

  Future<void> signUp(User user) async {
    final response = await http.post(
      Uri.parse('http://localhost:8099/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('User registered successfully');
      
    } else {
      // Handle error
      print('Failed to register user: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'images/girl.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Z-learning',
                  style: TextStyle(fontSize: 36.0, color: Colors.green, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'FirstName'),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'LastName'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextFormField(
                  controller: verifyPasswordController,
                  decoration: InputDecoration(labelText: 'Verify Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text == verifyPasswordController.text) {
                      User newUser = User(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      signUp(newUser);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      // Handle password mismatch
                      print('Passwords do not match');
                    }
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Already have an account? Log in',
                    style: TextStyle(decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
