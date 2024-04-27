import 'package:flutter/material.dart';
import 'package:virtual_school/utils/helper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Add your styling here
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            'Améliorez vos compétences',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          // Add other home page elements here
        ],
      ),
    );
  }
}
