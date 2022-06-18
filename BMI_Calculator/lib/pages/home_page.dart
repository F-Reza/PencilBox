import 'package:bmi_calculator/pages/show_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double sliderWeight = 50;
  double sliderHeight= 1.5;
  double bmi = 0;
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.blue,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (
              Text('© Next Digit',style: TextStyle(fontSize: 30),)
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Weight',style: TextStyle(fontSize: 25),),
            Slider(
                value: sliderWeight,
                min: 20,
                max: 120,
                divisions: 100,
                label: '${sliderWeight.round()}',
                onChanged: (value){
                  setState((){
                    sliderWeight = value;
                    calculateBmi();
                  });
                }),
            Text('${sliderWeight.toStringAsFixed(2)} kg',style: TextStyle(fontSize: 25),),
            SizedBox(height: 30,),
            const Text('Height',style: TextStyle(fontSize: 25),),
            Slider(
                value: sliderHeight,
                min: 1.2,
                max: 2.2,
                divisions: 10,
                label: '${sliderHeight.round()}',
                onChanged: (value){
                  setState((){
                    sliderHeight = value;
                    calculateBmi();
                  });
                }),
            Text('${sliderHeight.toStringAsFixed(1)} m',style: TextStyle(fontSize: 25),),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI', style: TextStyle(fontSize: 40, color: Colors.white),),
                  Text('${bmi.toStringAsFixed(1)}', style: TextStyle(fontSize: 40, color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Text(status, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                //onPressed: () => Navigator.pushNamed(context, SecondPage.routeName),
                //onPressed: () => Navigator.pushReplacementNamed(context, SecondPage.routeName),
                onPressed: () => Navigator
                    .pushNamed(context, ShowDetails.routeName, arguments: bmi),
                child: const Text('View Details'),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    bmi = sliderWeight/(sliderHeight*sliderHeight);
    if(bmi<16){
      status = 'Underweight (Severe thinness)';
    } else if(bmi>=16 && bmi <=16.9){
      status = 'Underweight (Moderate thinness)';
    }else if(bmi>=17 && bmi <=18.4){
      status = 'Underweight (Mild thinness)';
    }else if(bmi>=19 && bmi <=24.9){
      status = 'Normal';
    }else if(bmi>=25 && bmi <=29.9){
      status = 'Overweight (Pre-obese)';
    }else if(bmi>=30 && bmi <=34.9){
      status = 'Obese (Class I)';
    }else if(bmi>=35 && bmi <=39.9){
      status = 'Obese (Class II)';
    } else {
      status = 'Obese (Class III)';
    }
  }
}