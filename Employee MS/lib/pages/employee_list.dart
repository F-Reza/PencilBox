import 'dart:io';

import 'package:employee_ms/employee_model.dart';
import 'package:employee_ms/pages/new_employee.dart';
import 'package:flutter/material.dart';

import 'employee_details.dart';

class EmployeeList extends StatefulWidget {
  static const String routeName = '/';
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: employeeList.length,
          itemBuilder: (context, index) {
          final emp = employeeList[index];
          return ListTile(
            onTap: () => Navigator.pushNamed(context, EmployeeDetails.routeName, arguments: emp),
            leading: emp.image != 'images/male.png' ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(File(emp.image),
                  height: 50, width: 50, fit: BoxFit.cover),
            ) :
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(emp.image,
                  height: 50, width: 50, fit: BoxFit.cover),
            ),
            title: Text(emp.name),
            subtitle: Text(emp.designation),
          );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
            context, NewEmployee.routeName)
            .then((value) => setState((){})),
        child: const Icon(Icons.add),
      ),
    );
  }
}
