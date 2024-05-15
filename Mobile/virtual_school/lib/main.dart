import 'package:flutter/material.dart';
import 'package:virtual_school/apropos.dart';
import 'package:virtual_school/signup.dart';
import 'newlettress.dart';
import 'footer.dart';
import 'login.dart';
import 'signup.dart';
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
  List<Course> courses = [
    Course(
      image: 'images/girl.png',
      category: 'Category 1',
      title: 'Course 1',
      description: 'Description for Course 1',
      stars: 4.5,
      price: 19.99,
    ),
    Course(
      image: 'images/girl.png',
      category: 'Category 2',
      title: 'Course 2',
      description: 'Description for Course 2',
      stars: 4.2,
      price: 24.99,
    ),
    Course(
      image: 'images/girl.png',
      category: 'Category 3',
      title: 'Course 3',
      description: 'Description for Course 3',
      stars: 4.0,
      price: 29.99,
    ),
  ];
 final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text('Cours'),
                    onTap: () {
                   
                    },
                  ),
                  ListTile(
                    title: Text('À propos'),
                   onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => aapropos(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text('Newsletters'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewLettres(),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text('Se connecter'),
                    onTap: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("S'inscrire"),
                    onTap: () {
                        Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
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
            color: Colors.white54,
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
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Cours les plus populaires',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Apprentissage fluide pour tous, où que vous soyez',
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
                SizedBox(height: 20.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: courses.map((course) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        width: 200.0,
                        child: Card(
                          color: Colors.white54,
                          elevation: 2.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                course.image,
                                height: 150.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.category,
                                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      course.title,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      course.description,
                                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber, size: 16.0),
                                        SizedBox(width: 5.0),
                                        Text(
                                          course.stars.toString(),
                                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      '\$${course.price.toString()}',
                                      style: TextStyle(fontSize: 14.0, color: Colors.green),
                                    ),
                                    SizedBox(height: 10.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Action when button is pressed
                                      },
                                      child: Text("S'inscrire au cours"),
                                    ),
                                  ],
                                ),
                               
                              ), 
                           
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          
          ),
           aapropos(),
           NewLettres(),
          Container(
  height: 200.0, // Adjust the height as needed
  child: Footer(),
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
                style: TextStyle(fontSize: 18.0, color: Colors.amber),
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

class Course {
  final String image;
  final String category;
  final String title;
  final String description;
  final double stars;
  final double price;

  Course({
    required this.image,
    required this.category,
    required this.title,
    required this.description,
    required this.stars,
    required this.price,
  });
}
