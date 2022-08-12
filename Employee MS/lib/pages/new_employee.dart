import 'dart:ffi';
import 'dart:io';

import 'package:employee_ms/employee_model.dart';
import 'package:employee_ms/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewEmployee extends StatefulWidget {
  static const String routeName = '/new_employee';

  const NewEmployee({Key? key}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {

  final nameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final streetAddressCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();

  String? dob;
  String gValue = 'Male';
  String? _imagePath;
  ImageSource source = ImageSource.camera;
  String? designation;


  @override
  void dispose() {
    nameCtrl.dispose();
    mobileCtrl.dispose();
    emailCtrl.dispose();
    streetAddressCtrl.dispose();
    salaryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Employee'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: _saveEmployee,
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 10,
                child: _imagePath == null
                    ?
                Image.asset(
                  'images/bg.png', height: 100, width: 100, fit: BoxFit.cover,)
                    :
                Image.file(File(_imagePath!), height: 100,
                  width: 100,
                  fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          source = ImageSource.camera;
                          getImage();
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text('Camera')),
                    TextButton.icon(
                        onPressed: () {
                          source = ImageSource.gallery;
                          getImage();
                        },
                        icon: const Icon(Icons.photo),
                        label: const Text('Gallery')),
                  ],
                ),
              )
            ],
          ),
          TextField(
            controller: nameCtrl,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Employee Name..',
                prefixIcon: Icon(Icons.person),
                filled: true,
                labelText: 'Employee Name'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: mobileCtrl,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Mobile No..',
                prefixIcon: Icon(Icons.phone),
                filled: true,
                labelText: 'Mobile'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email Add..',
                prefixIcon: Icon(Icons.email),
                filled: true,
                labelText: 'Email'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: streetAddressCtrl,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Street Adress..',
                prefixIcon: Icon(Icons.text_format),
                filled: true,
                labelText: 'Street Address'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: salaryCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Salary..',
                prefixIcon: Icon(Icons.monetization_on),
                filled: true,
                labelText: 'Salary'
            ),
          ),
          const SizedBox(height: 10,),
          DropdownButton<String>(
              isExpanded: true,
              value: designation,
              hint: const Text('Select designation'),
              items: designationList.map((e) =>
                  DropdownMenuItem(
                      value: e,
                      child: Text(e)),
              ).toList(),
              onChanged: (value) {
                setState(() {
                  designation = value;
                });
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: selectDate,
                child: const Text('Select Date of Birth'),
              ),
              Chip(
                label: Text(dob == null ? 'No Date chosen' : dob!),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Text('Select Gender?', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 'Male',
                groupValue: gValue,
                onChanged: (value) {
                  setState(() {
                    gValue = value.toString();
                  });
                },
              ),
              const Text('Male'),
              Radio(
                value: 'Female',
                groupValue: gValue,
                onChanged: (value) {
                  setState(() {
                    gValue = value.toString();
                  });
                },
              ),
              const Text('Female'),
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }

  void selectDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
    print('Date Selected');
  }


  void getImage() async {
    final selectedImage = await ImagePicker()
        .pickImage(source: source);
    if (selectedImage != null) {
      setState(() {
          _imagePath = selectedImage.path;
      });
      print('Image Selected');
    } else {
      print('No Image Selected');
    }
  }

  void _saveEmployee() {
    if (nameCtrl.text.isEmpty) {
      showMessage(context, 'Please provide a name for Employee');
      return;
    }
    if (mobileCtrl.text.isEmpty) {
      showMessage(context, 'Please provide a mobile number for Employee');
      return;
    }
    if (emailCtrl.text.isEmpty) {
      showMessage(context, 'Please provide a email for Employee');
      return;
    }
    if (streetAddressCtrl.text.isEmpty) {
      showMessage(context, 'Please provide a address for Employee');
      return;
    }
    if (salaryCtrl.text.isEmpty) {
      showMessage(context, 'Please provide a salary for Employee');
      return;
    }
    if (designation == null) {
      showMessage(context, 'Please select designation');
      return;
    }
    if (dob == null) {
      showMessage(context, 'Please select date of birth');
      return;
    }
    if (_imagePath == null) {
      showMessage(context, 'Please take image');
      return;
    }


    final employee = EmployeeModel(
        name: nameCtrl.text,
        dob: dob!,
        designation: designation!,
        mobile: mobileCtrl.text,
        email: emailCtrl.text,
        streetAddress: streetAddressCtrl.text,
        salary: num.parse(salaryCtrl.text),
        image: _imagePath!,
        gender: gValue);

    employeeList.add(employee);
    Navigator.pop(context);
  }

}
