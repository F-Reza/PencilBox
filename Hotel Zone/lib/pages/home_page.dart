import 'package:flutter/material.dart';

import '../temp_db.dart';
import 'card_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool favorite = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) =>
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, CardView.routeName,
                    arguments: index);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  tag: index,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.asset(
                                hotels[index].image,
                                height: 200,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    hotels[index].favorite = !hotels[index].favorite;
                                  });
                                },
                                child: Icon(
                                  !hotels[index].favorite ?
                                  Icons.favorite_border : Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(hotels[index].name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.attach_money,color: Colors.black,),
                              Text(hotels[index].price.toString(),style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Address: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                hotels[index].address,style:  TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star_border),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
