import 'dart:io';

import 'package:contact/db/sqf_lite_helper.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewContact extends StatefulWidget {
  static const String routeName = '/new';

  const NewContact({Key? key}) : super(key: key);

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  String? _dob;
  String? _genderGroupValue;
  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;

  final formKey = GlobalKey <FormState>();


  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _saveContactInfo,
              icon: Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    child: _imagePath == null ? Image.asset(
                      'images/person.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,)
                        : Image.file(File(_imagePath!),
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        _imageSource = ImageSource.camera;
                        _getImage();
                      },
                          child: const Text('Camera')
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: (){
                        _imageSource = ImageSource.gallery;
                        _getImage();
                      },
                          child: const Text('Gallery')
                      ),
                    ],

                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  if (value.length > 20) {
                    return 'name must be in 20 character';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  if (value.length > 14) {
                    return 'number must be in 14 character';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: _selectDate,
                      child: Text('Select Date of Birth')),
                  Text(_dob == null ? 'No Date Selected' : _dob!)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select Gender'),
                  Radio<String>(
                    value: 'Male',
                    groupValue: _genderGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _genderGroupValue = value;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _genderGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _genderGroupValue = value;
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveContactInfo() async {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
        name: nameController.text,
        number: numberController.text,
        email: emailController.text,
        address: addressController.text,
        dob: _dob,
        gender: _genderGroupValue,
        image: _imagePath,
      );
      print(contact.toString());
      final status = await Provider.of<ContactProvider>(context, listen: false)
      .insertContact(contact);
      if(status){
        Navigator.pop(context);
      }else{
        
      }
    }
  }


  void _selectDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        _dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void _getImage() async {
    final selectedImage = await ImagePicker()
        .pickImage(source: _imageSource);
    if(selectedImage!=null){
      setState((){
        _imagePath = selectedImage.path;
      });
    }
  }


}
