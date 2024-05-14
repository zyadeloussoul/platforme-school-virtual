import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z-learning',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.green, // Set the color to green
            fontSize: 20.0, // Set the font size
            fontWeight: FontWeight.bold, // Set the font weight
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Z-learning'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(),
                children: <Widget>[
                  ListTile(
                    title: Text('Accueil'),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                  ListTile(
                    title: Text('Cours'),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                  ListTile(
                    title: Text('À propos'),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                  ListTile(
                    title: Text('Newsletters'),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                  ListTile(
                    title: Text('Se connecter'),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                  ListTile(
                    title: Text("S'inscrire"),
                    onTap: () {
                      // Update the UI
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/girl.png',
                  height: 250.0,
                  width: 150.0,
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Améliorez vos compétences de différentes manières',
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Prenons un cours en ligne pour améliorer vos compétences d\'une manière différente. Vous pouvez définir votre propre temps d\'étude en fonction de votre rythme d\'apprentissage. Ainsi, vous pouvez étudier confortablement et assimiler facilement le matériel.',
                        style: TextStyle(fontSize: 12.0, color: Colors.black54),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Action when button is pressed
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text('Commencer'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
  color: Colors.white,
  elevation: 2.0,
  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  child: Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        _buildTextWithSubtext('10k+', 'Étudiants'),
        _buildTextWithSubtext('20+', 'Cours de qualité'),
        _buildTextWithSubtext('10+', 'Professeurs expérimentés'),
      ],
    ),
  ),
),
        ],
      ),
    );
  }

  Widget _buildTextWithSubtext(String number, String subtext) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              number,
              style: TextStyle(fontSize: 18.0, color: Colors.amber), // Set the color to gold
            ),
          ],
        ),
        SizedBox(width: 5.0),
        Column(
          children: [
            Text(
              subtext,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}
}