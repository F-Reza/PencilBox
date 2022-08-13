import 'package:contact/pages/new_contact.dart';
import 'package:flutter/material.dart';

class Contactlist extends StatefulWidget {
  static const String routeName = '/';
  const Contactlist({Key? key}) : super(key: key);

  @override
  State<Contactlist> createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NewContact.routeName);
        },
        child: const Icon(Icons.add),
        tooltip: 'Add New Contact',
      ),
    );
  }
}

