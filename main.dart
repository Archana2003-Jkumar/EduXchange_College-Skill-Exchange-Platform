import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final demoUser = {
      "name": "Krithika",
      "email": "krithika@gmail.com",
      "credits": 5,
      "skills_teach": ["Flutter", "Python"],
      "skills_learn": ["AI", "Web"],
      "free_slots": [],
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(user: demoUser),
    );
  }
}
