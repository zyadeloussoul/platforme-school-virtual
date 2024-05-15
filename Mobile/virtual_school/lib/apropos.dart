import 'package:flutter/material.dart';

class aapropos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/girl.png', 
            height: 300.0,
            width: 80.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apprentissage agréable',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Définissez la méthode d\'apprentissage selon vous souhaitez avec certaine des avantages que vous obtenez de nous, afin que vous puissiez profiter des leçons que nous proposons.',
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
                SizedBox(height: 20.0),
                _buildFeatureContainer(
                  icon: Icons.accessibility,
                  title: 'Facilement accessible',
                  description: 'Trouvez le contenu dont vous avez besoin est aussi simple qu\'un simple clic.',
                ),
                _buildFeatureContainer(
                  icon: Icons.schedule,
                  title: 'Horaires d\'étude flexibles',
                  description: 'Que vous soyez un lève-tôt ou un oiseau de nuit, nos cours seront toujours disponibles 24/24.',
                ),
                _buildFeatureContainer(
                  icon: Icons.attach_money,
                  title: 'Coût plus abordable',
                  description: 'Nous croyons en l\'accessibilité de l\'éducation pour tous.',
                ),
                _buildFeatureContainer(
                  icon: Icons.people,
                  title: 'Consultation avec un professeur',
                  description: 'L\'apprentissage va au-delà du contenu, il s\'agit également d\'orientation et de soutien.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildFeatureContainer({required IconData icon, required String title, required String description}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 5.0),
              Text(description, style: TextStyle(fontSize: 12.0, color: Colors.black54)),
            ],
          ),
        ),
      ],
    ),
  );
}
}