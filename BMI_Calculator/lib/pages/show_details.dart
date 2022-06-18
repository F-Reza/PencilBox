import 'package:flutter/material.dart';

class ShowDetails extends StatefulWidget {
  static const String routeName = '/show_details';
  const ShowDetails({Key? key}) : super(key: key);

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {

//InitState Check
  @override
  void initState() {
    print('InitStake Call');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bmi = ModalRoute.of(context)!.settings.arguments as double;
    print('BMI is: $bmi');
    super.didChangeDependencies();
  }

  late double bmi;

  @override
  Widget build(BuildContext context) {

    print('Build Call');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('Category',style: TextStyle(fontSize: 25,),),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('BMI',style: TextStyle(fontSize: 25,),),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(height: 10,),
              DataTable(
                  headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
                  columns: [
                    DataColumn(
                      label: Text('Category',style: TextStyle(fontSize: 20,),),
                    ),
                    DataColumn(
                      label: Text('BMI',style: TextStyle(fontSize: 20,),),
                    ),
                  ],
                  rows: [

                    DataRow(
                          color: MaterialStateColor.resolveWith((states) {
                            return bmi<16 ? Colors.green : Colors.white;}),
                        cells: [
                      DataCell(Text('Underweight (Severe thinness')),
                      DataCell(Text('< 16.0')),
                    ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=16 && bmi<=16.9 ? Colors.yellow : Colors.white;}),
                        cells: [
                      DataCell(Text('Underweight (Moderate thinness')),
                      DataCell(Text('16-16.9')),
                    ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=17 && bmi<=18.4 ? Colors.yellow : Colors.white;}),
                        cells: [
                      DataCell(Text('Underweight (Mild thinness')),
                      DataCell(Text('17-18.4')),
                    ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=19 && bmi<=24.9 ? Colors.green : Colors.white;}),
                        cells: [
                          DataCell(Text('Normal')),
                          DataCell(Text('19-24.9')),
                        ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=25 && bmi<=29.9 ? Colors.orange : Colors.white;}),
                        cells: [
                          DataCell(Text('Overweight (Pre-Obese')),
                          DataCell(Text('25-29.9')),
                        ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=30 && bmi<=34.9 ? Colors.red : Colors.white;}),
                        cells: [
                          DataCell(Text('Obese(Class I)')),
                          DataCell(Text('30-34.9')),
                        ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>=35 && bmi<=39.9 ? Colors.red : Colors.white;}),
                        cells: [
                          DataCell(Text('Obese(Class II)')),
                          DataCell(Text('35-39.9')),
                        ]),
                    DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          return bmi>40 ? Colors.red : Colors.white;}),
                        cells: [
                          DataCell(Text('Obese(Class III)')),
                          DataCell(Text('> 40')),
                        ]),
                  ]),

            ],
          ),
        ),
      ),
    );
  }

}