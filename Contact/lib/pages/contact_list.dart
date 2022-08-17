import 'package:contact/pages/contact_details.dart';
import 'package:contact/pages/new_contact.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return ListTile(
                onTap: () => Navigator
                    .pushNamed(context,
                  ContactDetails.routeName, arguments: contact.id),
                title: Text(contact.name),
                subtitle: Text(contact.number),
                trailing: IconButton(
                  icon: Icon(contact.favourite ? Icons.favorite : Icons.favorite_border),
                  onPressed: (){
                    provider.updateFavorite(contact.id!, contact.favourite, index);
                  },
                ),
              );
            }),
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

