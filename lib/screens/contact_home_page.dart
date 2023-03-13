import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/contact.dart';
import '../nav_routes/routes.dart';
import '../services/contact_book.dart';

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
      body: ValueListenableBuilder(
        valueListenable: contactBook,
        builder: (context, value, child) {
          final contacts = value;
          child = ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final Contact contact = contacts[index];
              return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.teal,
                      icon: Icons.call,
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.deepOrange,
                      icon: Icons.message,
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        contactBook.deleteFromContactList(contact: contact);
                      },
                      backgroundColor: Colors.redAccent,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 6.0,
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  ),
                ),
              );
            },
          );
          return child;
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
