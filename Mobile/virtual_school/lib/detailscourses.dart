import 'package:flutter/material.dart';
import 'main.dart';
class CourseDetailsPage extends StatelessWidget {
  final Course course;

  CourseDetailsPage(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du cours'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              course.image,
              fit: BoxFit.cover,
              height: 300.0, 
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Category: ${course.category}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    course.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20.0),
                      SizedBox(width: 4.0),
                      Text(
                        course.stars.toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Spacer(),
                      Text(
                        '\$${course.price.toString()}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),   SizedBox(height: 16.0),
                  Center(
                child: ElevatedButton(
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
        // Action lorsque l'utilisateur clique sur "Oui"
      }
    });
  },
  child: Text("S'inscrire au cours"),
),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



