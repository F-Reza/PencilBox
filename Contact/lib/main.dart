import 'package:contact/pages/contact_details.dart';
import 'package:contact/pages/contact_list.dart';
import 'package:contact/pages/new_contact.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => ContactProvider() .. getAllContact())
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Contactlist.routeName,
      routes: {
        Contactlist.routeName:(context) => Contactlist(),
        NewContact.routeName:(context) => NewContact(),
        ContactDetails.routeName:(context) => ContactDetails(),
      },
    );
  }
}

