import 'confirmation.dart';
class Student {
  final String nom;
  final String prenom;
  final String age;
  final String email;
  final String phone;
  final String password;
  final String verify;

  Student({
    required this.nom,
    required this.prenom,
    required this.age,
    required this.email,
    required this.phone,
    required this.password,
    required this.verify,
  });
}

 List<Student> students = [
    Student(
      nom: 'John',
      prenom: 'Doe',
      age: '25',
      email: 'john.doe@example.com',
      phone: '1234567890',
      password: "password",
      verify: 'password',
    ),
    Student(
      nom: 'Alice',
      prenom: 'Smith',
      age: '30',
      email: 'alice.smith@example.com',
      phone: '9876543210',
      password: 'password',
      verify: 'password',
    ),
    Student(
      nom: 'Bob',
      prenom: 'Johnson',
      age: '35',
      email: 'bob.johnson@example.com',
      phone: '5555555555',
      password: 'password',
      verify: 'password',
    ),
  ];