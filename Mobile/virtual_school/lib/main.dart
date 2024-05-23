import 'package:flutter/material.dart';
import 'package:virtual_school/apropos.dart';
import 'package:virtual_school/signup.dart';
import 'newlettress.dart';
import 'footer.dart';
import 'login.dart';
import 'cours.dart';
import 'confirmation.dart';
import 'student.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cours.dart' as cours; 
import 'dart:typed_data';


Future<List<cours.Course>> fetchCourses() async {
  final response = await http.get(Uri.parse('http://localhost:8099/admin/courses'));
  if (response.statusCode == 200) {
    List<dynamic> coursesJson = json.decode(response.body);
    List<cours.Course> courses = coursesJson.map((json) => cours.Course.fromJson(json)).toList();
    
    // Print a success message
    print('Successfully fetched courses');

    // Print the titles of all fetched courses
    for (var course in courses) {
      print('Course Title: ${course.title}');
    }

    return courses;
  } else {
    throw Exception('Failed to load courses');
  }
}



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
            color: Colors.green,
            fontSize: 20.0, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
        home: FutureBuilder<List<cours.Course>>(
        future: fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Fetching courses...");
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error fetching courses: ${snapshot.error}");
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print("Successfully fetched courses");
            snapshot.data!.forEach((course) {
              print('Course Title: ${course.title}');
            });
            return HomePage(courses: snapshot.data!);
          } else {
            print("No courses found");
            return Center(child: Text('No courses found'));
          }
        },
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  
  final List<cours.Course> courses;

  HomePage({required this.courses});

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
Future<Uint8List> _downloadImage(String id) async {
  final response = await http.get(Uri.parse('http://localhost:8099/Api/Certif/downloadCertifImage/$id'));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to download image');
  }
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
                        builder: (context) => HomePage(courses: courses),
                      ));
                    },
                  ),
                 ListTile(
  title: Text('Cours'),
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CoursePage(),
    ));
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
        controller: _scrollController,
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CoursePage(),
                          ));
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

FutureBuilder<Uint8List>(
  future: _downloadImage(course.id),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error loading image: ${snapshot.error}');
    } else {
      Uint8List imageData = snapshot.data!;
      return Image.memory(
        imageData,
        height: 150.0,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  },
),



                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.categoryName,
                                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5.0),
                                Text(
                                  course.title ?? 'No Title', 
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
                                          course.rating.toString(),
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
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirmation"),
                                              content: Text("Voulez-vous vraiment vous inscrire au cours ?"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(false); // Ferme la boîte de dialogue et renvoie false
                                                  },
                                                  child: Text("Non"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(true); // Ferme la boîte de dialogue et renvoie true
                                                  },
                                                  child: Text("Oui"),
                                                ),
                                              ],
                                            );
                                          },
                                        ).then((value) {
                                          if (value == true) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ConfirmationPage(student: students[0]),
                                              ),
                                            );
                                          }
                                        });
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
  final String id;
  final String title;
  final String description;
  final String mainImagePath;
  final double price;
  final DateTime startDate;
  final String instructorName;
  final DateTime endDate;
  final String categoryName;
  final double rating;
  final String? url;


  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.mainImagePath,
    required this.price,
    required this.startDate,
    required this.instructorName,
    required this.endDate,
    required this.categoryName,
    required this.rating,
     this.url,
 
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      mainImagePath: json['mainImagePath'],
      price: json['price'].toDouble(),
      startDate: DateTime.parse(json['startDate']),
      instructorName: json['instructorName'],
      endDate: DateTime.parse(json['endDate']),
      categoryName: json['categoryName'],
      rating: json['rating'].toDouble(),
   
    // Assign the value from the JSON to the image field
    );
  }
}
