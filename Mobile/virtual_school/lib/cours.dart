import 'package:flutter/material.dart';
import 'detailscourses.dart';
import 'student.dart';
import 'confirmation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String _searchText = '';
  String _selectedCategory = 'All';

  List<String> _categories = [];
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    final response = await http.get(Uri.parse('http://localhost:8099/admin/courses'));
    if (response.statusCode == 200) {
      List<dynamic> coursesJson = json.decode(response.body);
      setState(() {
        _courses = coursesJson.map((json) => Course.fromJson(json)).toList();
        _categories = _getCategories();
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  List<String> _getCategories() {
    List<String> categories = ['All'];
    for (var course in _courses) {
      if (!categories.contains(course.categoryName)) {
        categories.add(course.categoryName);
      }
    }
    return categories;
  }

  List<Course> get _filteredCourses {
    return _courses
        .where((course) =>
            course.title.toLowerCase().contains(_searchText.toLowerCase()) &&
            (_selectedCategory == 'All' || course.categoryName == _selectedCategory))
        .toList();
  }

  Future<Course> _fetchCourse(String id) async {
    final response = await http.get(Uri.parse('http://localhost:8099/Api/Certif/$id'));
    if (response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load course');
    }
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
      appBar: AppBar(
        title: Text('Cours'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rechercher un cours',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Entrez le nom du cours...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 6.0,
              children: _categories.map((category) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return category == _selectedCategory ? Colors.green : Colors.grey;
                      },
                    ),
                  ),
                  child: Text(category),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () async {
                        Course course = await _fetchCourse(_filteredCourses[index].id);
                        Uint8List image = await _downloadImage(course.id);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CourseDetailsPage(course, image),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FutureBuilder<Uint8List>(
                            future: _downloadImage(_filteredCourses[index].id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Image.asset(
                                  'assets/placeholder.png',
                                  fit: BoxFit.cover,
                                  height: 300.0,
                                );
                              } else {
                                return Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                  height: 300.0,
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _filteredCourses[index].title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  _filteredCourses[index].categoryName,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  _filteredCourses[index].description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 16.0),
                                    SizedBox(width: 4.0),
                                    Text(
                                      _filteredCourses[index].rating.toString(),
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$${_filteredCourses[index].price.toString()}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
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
                                                    Navigator.of(context).pop(false);
                                                  },
                                                  child: Text("Non"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(true);
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
                                              MaterialPageRoute(builder: (context) => ConfirmationPage(student: students[0])),
                                            );
                                          }
                                        });
                                      },
                                      child: Text("S'inscrire au cours"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        Course course = await _fetchCourse(_filteredCourses[index].id);
                                        Uint8List image = await _downloadImage(course.id);

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => CourseDetailsPage(course, image),
                                          ),
                                        );
                                      },
                                      child: Text("Détails du cours"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
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
  final double price;
  final DateTime startDate;
  final String instructorName;
  final DateTime endDate;
  final String categoryName;
  final double rating;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.startDate,
    required this.instructorName,
    required this.endDate,
    required this.categoryName,
    required this.rating,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      startDate: DateTime.parse(json['startDate']),
      instructorName: json['instructorName'],
      endDate: DateTime.parse(json['endDate']),
      categoryName: json['categoryName'],
      rating: json['rating'].toDouble(),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  final Course course;
  final Uint8List image;

  CourseDetailsPage(this.course, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(
              image,
              fit: BoxFit.cover,
              height: 300.0,
            ),
            SizedBox(height: 16.0),
            Text(
              course.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              course.categoryName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              course.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Price: \$${course.price}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Rating: ${course.rating}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Instructor: ${course.instructorName}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
