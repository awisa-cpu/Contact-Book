import 'package:contact_state_management_class/nav_routes/routes.dart';
import 'package:flutter/material.dart';

import 'screens/contact_home_page.dart';
import 'screens/new_contact_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatio
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        newContactPage: (context) => const NewContactView(),
      },
      home: const MyHomePage(),
    );
  }
}
