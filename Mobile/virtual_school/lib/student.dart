import 'confirmation.dart';

class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? imagePath;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
     this.imagePath,
  });
}

List<Student> students = [
  Student(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    imagePath: 'assets/images/john_doe.png',
  ),
  Student(
    id: '2',
    firstName: 'Alice',
    lastName: 'Smith',
    email: 'alice.smith@example.com',
    imagePath: 'assets/images/alice_smith.png',
  ),
  Student(
    id: '3',
    firstName: 'Bob',
    lastName: 'Johnson',
    email: 'bob.johnson@example.com',
    imagePath: 'assets/images/bob_johnson.png',
  ),
];
