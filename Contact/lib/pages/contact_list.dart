import 'dart:io';

import 'package:contact/auth/auth_prefs.dart';
import 'package:contact/pages/contact_details.dart';
import 'package:contact/pages/login_page.dart';
import 'package:contact/pages/new_contact.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactList extends StatefulWidget {
  static const String routeName = '/';

  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    setLoginStatus(false).then((value) => 
                    Navigator.pushReplacementNamed
                      (context, LoginPage.routeName));
                  },
                    child: Text('Logout')
                ),
              ]
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Consumer<ContactProvider>(
          builder: (context, provider, _) => BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              if (selectedIndex == 0) {
                provider.getAllContact();
              } else if (selectedIndex == 1) {
                provider.getAllFavoriteContacts();
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.all_inbox), label: 'All Contact'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Favorites')
            ],
          ),
        ),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemCount: provider.contactList.length,
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return Dismissible(
                key: ValueKey(contact.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: _showConfirmationDialog,
                onDismissed: (direction) {
                  provider.deleteContact(contact.id!);
                },
                background: Container(
                  padding: const EdgeInsets.only(right: 10),
                  color: Colors.red[300],
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                child: Card(
                  child: ExpansionPanelList.radio(
                    children: [
                      ExpansionPanelRadio(
                        value: contact.id!,
                        headerBuilder: (context, isExpanded) => ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, ContactDetails.routeName,
                            arguments: contact.id),
                        title: Text(contact.name),
                        subtitle: Text(contact.number),
                        // leading: contact.image == null ?
                        // const CircleAvatar(
                        //   backgroundImage: AssetImage('images/person.png'),
                        //   backgroundColor: Colors.black12,
                        // ) :CircleAvatar(
                        //   backgroundImage: FileImage(File(contact.image!)),
                        // ),
                        /*trailing: IconButton(
                          icon: Icon(contact.favourite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {
                            provider.updateFavorite(
                                contact.id!, contact.favourite, index);
                          },
                        ),*/
                        leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: contact.image == null ?

                        contact.gender == 'Male' ?
                        Image.asset('images/male.png',
                            height: 50, width: 50, fit: BoxFit.cover)
                        :

                        contact.gender == 'Female'
                            ? Image.asset('images/female.png',
                            height: 50, width: 50, fit: BoxFit.cover)
                            : Image.asset('images/person.png',
                            height: 50, width: 50, fit: BoxFit.cover)

                            : Image.file(File(contact.image!),
                                height: 50, width: 50, fit: BoxFit.cover),
                    ),
                  ),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            provider.callContact(contact.number);
                          },
                          icon: const Icon(Icons.call)),
                      IconButton(
                          onPressed: () {
                            provider.messageContact(contact.number);
                          },
                          icon: const Icon(Icons.message)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                        icon: Icon(
                          contact.favourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          provider.updateFavorite(
                              contact.id!, contact.favourite, index);
                        },
                      ),
                    ],
                  ),
              ),
              ],
              ),
                )

              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewContact.routeName);
        },
        child: const Icon(Icons.add),
        tooltip: 'Add New Contact',
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Contact'),
        content: Text('Are you sure to delete this contact?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('NO'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('YES'),
          ),
        ],
      ),
    );
  }
}
