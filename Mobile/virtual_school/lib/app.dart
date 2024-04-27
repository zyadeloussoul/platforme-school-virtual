import 'package:flutter/material.dart';
import '/header.dart';
import '/home.dart';
import '/course.dart';
import '/newletter.dart';
import '/fottter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZLearning',
      
      
      theme: ThemeData(
        primarySwatch: Colors.teal, // Replace with your desired color
        visualDensity: VisualDensity.adaptivePlatformDensity, // Adapts to platform
      ),
    
      home: Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // SvgPicture.asset('assets/logo.svg'), // Assuming you have an SVG logo
              Text('Z-Learning'),
            ],
            
          ),
          
         

           
          backgroundColor: Colors.yellowAccent, // Replace with your primary color
        ),
        body: SingleChildScrollView( // Enables scrolling if content overflows
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hero banner (replace with your image path)
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/hero_banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Learn Something New Today!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Courses',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, // Handle "See All" button press
                      child: Text('See All'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CourseCard(
                    title: 'Course Title 1',
                    image: 'assets/course_image1.jpg', // Replace with image path
                    price: '100',
                    category: 'Category 1',
                    description: 'Course Description 1',
                    rating: 4,
                    url: 'course_url1',
                  ),
                  CourseCard(
                    title: 'Course Title 2',
                    image: 'assets/course_image2.jpg', // Replace with image path
                    price: '150',
                    category: 'Category 2',
                    description: 'Course Description 2',
                    rating: 4,
                    url: 'course_url2',
                  ),
                ],
              ),

              // About ZLearning section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'About ZLearning',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod leo eu nulla tincidunt, vel tincidunt risus rhoncus. Ut vel arcu magna. Sed eu diam vel quam pretium tincidunt vitae vitae ut odio.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              // Newsletter section (replace with your Newsletter widget)
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Newsletter(),
              ),
              

              // Footer section (replace with your Footer widget)
              
              Footer(),
              
            ],
          ),
        ),
      ),
    );
  }
}
