import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart'; // Import for icons

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _isPanelVisible = false;
  final List<String> _categories = [
    "Art",
    "Architecture",
    "Finance",
    "Science",
    "Psychologie",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // Logo
          Image.asset('assets/logo.png'), // Replace with your logo

          // Navigation links
          Spacer(),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/home'),
            child: Text('Accueil'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isPanelVisible = !_isPanelVisible;
              });
            },
            child: Text('Cours'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: Text('À propos'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/newsletter'),
            child: Text('Newsletter'),
          ),

          // Authentication buttons
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Se connecter'),
          ),
         OutlinedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.add_circle), // Using Material icon
  label: Text('S’inscrire'),
),
        ],
      ),
    );
  }
}
