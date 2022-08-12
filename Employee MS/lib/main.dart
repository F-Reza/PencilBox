import 'package:employee_ms/pages/employee_details.dart';
import 'package:employee_ms/pages/employee_list.dart';
import 'package:employee_ms/pages/new_employee.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee MS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: EmployeeList.routeName,
      routes: {
        EmployeeList.routeName : (context) => EmployeeList(),
        EmployeeDetails.routeName : (context) => EmployeeDetails(),
        NewEmployee.routeName : (context) => NewEmployee(),
      },
    );
  }
}
