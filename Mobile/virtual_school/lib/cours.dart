import 'package:flutter/material.dart';
import 'main.dart';
import 'detailscourses.dart';
import 'student.dart';
import 'confirmation.dart';
class CoursePage extends StatefulWidget {
  final List<Course> courses;

  CoursePage(this.courses);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String _searchText = '';
  String _selectedCategory = 'All'; 

  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _categories = _getCategories();
  }

  List<String> _getCategories() {
    List<String> categories = ['All']; // Start with 'All' as a default category
    for (var course in widget.courses) {
      if (!categories.contains(course.category)) {
        categories.add(course.category);
      }
    }
    return categories;
  }

  List<Course> get _filteredCourses {
    return widget.courses
        .where((course) =>
            course.title.toLowerCase().contains(_searchText.toLowerCase()) &&
            (_selectedCategory == 'All' || course.category == _selectedCategory))
        .toList();
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
                      onTap: () {
                  Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailsPage(_filteredCourses[index]),
                                ),
                              );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              _filteredCourses[index].image,
                              fit: BoxFit.cover,
                              height: 150.0,
                            ),
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
                                  _filteredCourses[index].category,
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
                                      _filteredCourses[index].stars.toString(),
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
                                  MaterialPageRoute(builder: (context) => ConfirmationPage(student: students[0])),
                                     );
      }
    });
  },
  child: Text("S'inscrire au cours"),
),

                               
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailsPage(_filteredCourses[index]),
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
