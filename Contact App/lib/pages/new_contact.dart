import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

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
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final websiteController = TextEditingController();

  final formKey = GlobalKey <FormState>();


  @override
  void dispose() {
    nameController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    companyController.dispose();
    designationController.dispose();
    websiteController.dispose();
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
                  if (value.length > 20) {
                    return 'name must be in 14 character';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: companyController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Name',
                  prefixIcon: Icon(Icons.work_outline),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: designationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Designation',
                  prefixIcon: Icon(Icons.add_chart_sharp),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: websiteController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                  prefixIcon: Icon(Icons.link),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  void _saveContactInfo() {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
          name: nameController.text,
          number: numberController.text,
        email: emailController.text,
        address: addressController.text,
        company: companyController.text,
        designation: designationController.text,
        website: websiteController.text
      );
      print(contact.toString());
    }
  }


}
