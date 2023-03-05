// todo:This is a singleton class that will only return same instance and manage the state of our application
import '../model/contact.dart';

class ContactBook {
  ContactBook._sharedInstance();

  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook.singleton() => _shared;

  final List<Contact> _contacts = const [];

  int get contactLength => _contacts.length;

  void addToContactList({required Contact newContact}) {
    if (_contacts.contains(newContact)) {
      throw Exception("Contact already exist");
    }

    _contacts.add(newContact);
  }

  void deleteFromContactList({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? retriveContact({required int contactIndex}) {
    // int contactIndex = atIndex - 1;
    return _contacts.length > contactIndex
        ? _contacts.elementAt(contactIndex)
        : null;
  }
}