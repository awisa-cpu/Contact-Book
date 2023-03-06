// ?:This is a singleton class that will only return same instance and manage the state of our application
import 'package:flutter/cupertino.dart';

import '../model/contact.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);

  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook.singleton() => _shared;

  int get contactLength => value.length;

  void addToContactList({required Contact newContact}) {
    final contacts = value;
    contacts.add(newContact);
    notifyListeners();
  }

  void deleteFromContactList({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? retriveContact({required int contactIndex}) {
    return value.length > contactIndex ? value.elementAt(contactIndex) : null;
  }
}
