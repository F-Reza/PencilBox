import 'dart:io';

import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth.dart';
import '../providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Size? size;
  final textController =TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                AuthService.logout();
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
                print('User Logout!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, provider, _) =>
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: provider.getUserById(AuthService.user!.uid),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final userModel = UserModel.fromMap(snapshot.data!.data()!);
                return ListView(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: size!.width,
                          height: 250,
                          decoration: const BoxDecoration(color: Colors.white60),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: userModel.image == null ?
                          Image.asset('images/person.png',
                            width: 200, height: 200, fit: BoxFit.cover,) :
                          Image.network(userModel.image!,
                            width: 200, height: 200, fit: BoxFit.cover,),
                        ),
                        Positioned(
                          bottom: 45,
                          right: 105,
                          child: IconButton(
                              onPressed: _getImage,
                              icon: Icon(Icons.add_a_photo,size: 40,)),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: _getImage, 
                        icon: const Icon(Icons.camera_alt),
                      label: const Text('Update Image'),
                    ),
                    const Divider(color: Colors.black,height: 1,),
                    ListTile(
                      title: Text(userModel.name == null ||  userModel.name!.isEmpty ?
                      'No display name added' : userModel.name!,
                        style: userModel.name == null ||  userModel.name!.isEmpty ?
                        const TextStyle(color: Colors.grey,fontSize: 14) :
                        const TextStyle(color: Colors.black,),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: (){
                          showInputDialog(
                              title: 'Display Name', 
                              value: userModel.name, 
                              onSaved: (value) {
                            provider.updateProfile(
                                AuthService.user!.uid,
                                {'name' : value});
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(userModel.email),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: (){
                          //
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(userModel.mobile == null ||  userModel.mobile!.isEmpty ?
                      'No mobile number added' : userModel.mobile!,
                        style: userModel.mobile == null ||  userModel.mobile!.isEmpty ?
                        const TextStyle(color: Colors.grey,fontSize: 14) :
                        const TextStyle(color: Colors.black,),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: (){
                          showInputDialog(
                              title: 'Mobile Number',
                              value: userModel.mobile,
                              onSaved: (value) {
                                provider.updateProfile(
                                    AuthService.user!.uid,
                                    {'mobile' : value});
                              });
                        },
                      ),
                    ),
                  ],
                );
              }
              if(snapshot.hasError) {
                return const Text('Failed to fatch Data');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  void _getImage() async {
    final xFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 75);
    if(xFile != null) {
      final downloadUrl = await Provider
          .of<UserProvider>(context, listen: false)
          .updateImage(File(xFile.path));
      await Provider
          .of<UserProvider>(context, listen: false)
          .updateProfile(AuthService.user!.uid, {'image' : downloadUrl});

    }
  }


  showInputDialog({
    required String title,
    String? value,
    required Function(String) onSaved}) {
    textController.text = value ?? '';
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Enter $title'
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            onSaved(textController.text);
            Navigator.pop(context);
          },
          child: const Text('UPDATE'),
        ),
      ],
    ));
  }

}
