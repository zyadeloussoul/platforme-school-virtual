import 'package:flutter/material.dart';
import 'student.dart'; 
class ConfirmationPage extends StatelessWidget {
 final Student student; 

  ConfirmationPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mr/Mme ${student.nom} ${student.prenom},',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nous vous confirmons votre inscription avec les informations suivantes :',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nom: ${student.nom}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Prénom: ${student.prenom}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Age: ${student.age}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Email: ${student.email}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Phone Number: ${student.phone}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Vous recevrez un e-mail à ${student.email} contenant les détails du cours ainsi que le lien pour rejoindre la réunion Google Meet.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Merci pour votre inscription !',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
