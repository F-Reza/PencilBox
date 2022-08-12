

import 'dart:io';

import 'package:employee_ms/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeDetails extends StatefulWidget {
  static const String routeName = '/details';
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  late EmployeeModel employee;

  @override
  void didChangeDependencies() {
    employee = ModalRoute.of(context)!.settings.arguments as EmployeeModel;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //Image.file(File(employee.image),width: double.maxFinite,height: 240,),
          ClipRRect(
            child: employee.image != 'images/male.png' ?
            Image.file(File(employee.image),
                width: double.maxFinite, height: 250, fit: BoxFit.cover):
            Image.asset(employee.image,
                width: double.maxFinite, height: 250, fit: BoxFit.cover),
          ),
          ListTile(
            title: Text(employee.mobile),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: _callContact,
                    icon: const Icon(Icons.call)
                ),
                IconButton(
                    onPressed: _messageContact,
                    icon: const Icon(Icons.sms)
                ),
              ],

            ),
          ),
          ListTile(
            title: Text(employee.email),
            trailing: IconButton(
                onPressed: _mailContact,
                icon: const Icon(Icons.email)
            ),
          ),
          ListTile(
            title: Text(employee.streetAddress),
            trailing: IconButton(
                onPressed: _locateContact,
                icon: const Icon(Icons.map)
            ),
          ),
          ListTile(
            title: Text(employee.designation),
            trailing: Text('BDT ${employee.salary}'),
          ),
        ],
      )
    );
  }

  void _callContact() async {
    final uri = Uri.parse('tel:${employee.mobile}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch call app';
    }
  }

  void _messageContact() async {
    final uri = Uri.parse('sms: ${employee.mobile}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch message app';
    }
  }

  void _mailContact() async {
    final uri = Uri.parse('mailTo:${employee.email}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch mail app';
    }
  }


  void _locateContact() async {
    String urlString = '';
    if (Platform.isAndroid) {
      urlString = 'geo:00?q=${employee.streetAddress}';
    } else if (Platform.isIOS) {
      urlString = 'https://maps.apple.com/q=${employee.streetAddress}';
    }

    final uri = Uri.parse(urlString);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch map';
    }
  }


}
