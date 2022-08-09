import 'package:flutter/material.dart';

import '../temp_db.dart';

class CardView extends StatefulWidget {
  static const String routeName = '/card_view';
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

  late String url;
  int index = 0;

  @override
  void didChangeDependencies() {
    index = ModalRoute.of(context)!.settings.arguments as int;
    url = Img[index];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text('List View Example'),
          centerTitle: true,
        ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(hotels[index].name),
              background: Hero(
                tag: index,
                child: Image.asset(
                  hotels[index].image,
                  width: double.maxFinite,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Description:',style: TextStyle(fontSize: 22,),textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(hotels[index].description),
                    ),
                  ]
              )
          ),
        ],
      ),
    );
  }
}
