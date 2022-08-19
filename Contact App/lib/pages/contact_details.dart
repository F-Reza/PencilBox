import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName = '/details';
  const ContactDetails({Key? key}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  late int id;
  Size? size;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit)
          ),
        ],
      ),
      body: Center(
        child: Consumer<ContactProvider>(
          builder: (context, provider, _) => FutureBuilder<ContactModel>(
            future: provider.getContactById(id),
            builder: (context, snapshot){
              if(snapshot.hasData) {
                final model = snapshot.data;
                return ListView(
                  children: [
                    // Card(
                    //   child: model!.image == null? Image.asset('images/person.png', height: 250, fit: BoxFit.contain,)
                    //       : Image.file(File(model.image!),width: double.infinity,height: 250,fit: BoxFit.cover,),
                    // ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: size!.width,
                          height: 280,
                          decoration: const BoxDecoration(color: Colors.blue),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:  model!.image == null ?
                              model.gender == "Male" ?
                              Image.asset('images/male.png', height: 200, width: 200, fit: BoxFit.cover) :
                              model.gender == 'Female' ?
                              Image.asset('images/female.png', height: 200, width: 200, fit: BoxFit.cover)
                              : Image.asset('images/person.png', height: 200, width: 200, fit: BoxFit.cover)

                                  : Image.file(File(model.image!), height: 200, width: 200, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              model.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  letterSpacing: 1,
                                  wordSpacing: 1),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(model.favourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                              size: 35,color: Colors.white,),
                            onPressed: () {
                              /*provider.updateFavorite(
                              final value = model.favourite ? 0 : 1;
                              provider.updateFavorite(id!, index!, value);*/
                            },
                          ),
                        ),
                      ],
                    ),

                    Card(
                      child: ListTile(
                        title: Text(model.number,style: const TextStyle(color: Colors.black, fontSize: 18),),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: (){
                              provider.callContact(model.number);
                            },
                                icon: const Icon(Icons.call,size: 30,color: Colors.greenAccent,),
                            ),
                            const SizedBox(width: 10,),
                            IconButton(onPressed: (){
                              provider.messageContact(model.number);
                            },
                              icon: const Icon(Icons.sms,size: 30,color: Colors.amberAccent,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          model.email == null || model.email!.isEmpty ? 'No email added!'
                          : model.email!,
                          style:  model.email == null || model.email!.isEmpty
                              ? const TextStyle(color: Colors.grey)
                              : const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16, letterSpacing: 1),
                        ),
                        trailing: IconButton(onPressed: (){
                          if (model.email == null ||
                              model.email!.isEmpty) {
                            throw 'No email address found!';
                          } else {
                            provider.mailContact(model.email!);
                          }
                        },
                          icon: const Icon(Icons.email,size: 30,color: Colors.redAccent,),
                        ),
                      ),
                    ),
                    Card(
                        child: ListTile(
                          title: Text(
                            model.address == null || model.address!.isEmpty ? 'No location added!'
                                : model.address!,
                            style:  model.address == null || model.address!.isEmpty
                                ? const TextStyle(color: Colors.grey)
                                : const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16, letterSpacing: 1),
                          ),
                          trailing: IconButton(onPressed: (){
                            provider.locateContact(model.address!);
                          },
                            icon: const Icon(Icons.location_on,size: 30,color: Colors.redAccent,),
                          ),
                        ),
                    ),
                    Card(
                        child: ListTile(
                          title: Text(
                            model.website == null || model.website!.isEmpty ? 'No website added!'
                                : model.website!,
                            style:  model.website == null || model.website!.isEmpty
                                ? const TextStyle(color: Colors.grey)
                                : const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16, letterSpacing: 1),
                          ),
                          trailing: IconButton(onPressed: (){
                            provider.webContact(model.website!);
                          },
                            icon: const Icon(Icons.link,size: 30,color: Colors.blue,),
                          ),
                        ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Gender:'),
                        trailing: Text(
                          model.gender == null || model.gender!.isEmpty ? 'Empty!'
                              : model.gender!,
                          style:  model.gender == null || model.gender!.isEmpty
                              ? const TextStyle(color: Colors.grey)
                              : const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16, letterSpacing: 1),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Date of Birth:'),
                        trailing: Text(
                          model.dob == null || model.dob!.isEmpty ? 'Empty!'
                              : model.dob!,
                          style:  model.dob == null || model.dob!.isEmpty
                              ? const TextStyle(color: Colors.grey)
                              : const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if(snapshot.hasError){
                return const Text('Failed to fetch data');
              }
              return const CircularProgressIndicator();
            },
        ),
        ),
      ),
    );
  }
}
