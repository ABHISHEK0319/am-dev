import 'package:am_dev/contactpage.dart';
import 'package:am_dev/homepage.dart';
import 'package:am_dev/projectspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhishek Maurya | Flutter Developer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/projects': (context) => ProjectsPage(),
        '/contact': (context) => const ContactPage(),
      },
    
    );
  }
}