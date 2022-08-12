

import 'dart:io';

import 'package:employee_ms/employee_model.dart';
import 'package:flutter/material.dart';

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
                    onPressed: () {

                    },
                    icon: const Icon(Icons.call)
                ),
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.sms)
                ),
              ],

            ),
          ),
          ListTile(
            title: Text(employee.email),
            trailing: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.email)
            ),
          ),
          ListTile(
            title: Text(employee.streetAddress),
            trailing: IconButton(
                onPressed: () {

                },
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
}
