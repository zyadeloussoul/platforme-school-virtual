import 'package:flutter/material.dart';
import 'signup.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
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
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Password text field
                  TextField(
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
                      // Add login logic here
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
