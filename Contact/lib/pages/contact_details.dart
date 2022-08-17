import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName = '/details';
  const ContactDetails({Key? key}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  late int id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ContactProvider>(
          builder: (context, provider, _) => FutureBuilder<ContactModel>(
            future: provider.getContactById(id),
            builder: (context, snapshot){
              if(snapshot.hasData) {
                final model = snapshot.data;
                return ListView(
                  children: [
                    model!.image == null? Image.asset('images/person.png')
                    : Image.file(File(model!.image!),width: double.infinity,height: 300,fit: BoxFit.cover,),
                  ],
                );
              }
              if(snapshot.hasError){
                return const Text('Failed to fetch data');
              }
              return const CircularProgressIndicator();
            },
        ),
        ),
      ),
    );
  }
}
