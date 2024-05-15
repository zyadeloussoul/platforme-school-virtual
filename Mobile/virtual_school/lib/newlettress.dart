import 'package:flutter/material.dart';

class NewLettres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      elevation: 2.0,
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abonnez-vous à notre newsletter',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              'Abonnez-vous à notre newsletter pour obtenir toutes les informations sur nos cours.',
              style: TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Entrer votre numéro de téléphone',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Action when button is pressed
                  },
                  child: Text('Abonnez-vous'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}
