import "package:flutter/material.dart";
import "package:virtual_school/login.dart";
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'images/placeholder.png',
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
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Prénom'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Verify Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement sign-up logic
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