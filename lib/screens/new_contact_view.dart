import 'package:contact_state_management_class/services/contact_book.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text('Enter Contact Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.deepPurple,
              onPressed: () {
                final Contact newContact = Contact(name: nameController.text);
                ContactBook.singleton()
                    .addToContactList(newContact: newContact);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add contact',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
