import 'package:flutter/material.dart';
import 'signup.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
  final response = await http.post(
  Uri.parse('http://localhost:8099/user/login'),
  headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },
  body: <String, String>{
    'email': usernameController.text,
    'password': passwordController.text,
  },
);

    if (response.statusCode == 200) {
      // Handle successful login
      print('Login successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  MyApp()),
      );
    } else {
      // Handle unsuccessful login
      print('Failed to login: ${response.body}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/girl.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Username text field
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Password text field
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20.0),
                  // Sign up button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign up', style: TextStyle(decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
