import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName = '/details';
  const ContactDetails({Key? key}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
        centerTitle: true,
      ),
    );
  }
}
