import 'package:contact_state_management_class/nav_routes/routes.dart';
import 'package:flutter/material.dart';

import 'model/contact.dart';
import 'screens/new_contact_view.dart';
import 'services/contact_book.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ContactBook contactBook = ContactBook.singleton();

    return Scaffold(
      appBar: AppBar(
        title: const Text('C O N T A C T S'),
      ),
      body: ListView.builder(
        itemCount: contactBook.contactLength,
        itemBuilder: (context, index) {
          final Contact contact =
              contactBook.retriveContact(contactIndex: index)!;
          return ListTile(
            title: Text(contact.name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(newContactPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
