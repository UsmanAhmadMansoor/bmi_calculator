import 'dart:math';

import 'package:bmi_calculator/MeasureCard.dart';
import 'package:bmi_calculator/ReuseableCard.dart';
import 'package:bmi_calculator/iconContent.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedGender = 0;
  int weight = 50;
  int height = 160;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(children: [
          ReuseableCard(cardChild: IconContent(
                  icon: Icons.male,
                  title: "Male",
                  active: selectedGender == 0,
                ), onPress: (){
                    setState(() {
                      selectedGender = 0;
                });
                }),

          ReuseableCard(cardChild: IconContent(
                  icon: Icons.female,
                  title: "Female",
                  active: selectedGender == 1,
                ), onPress: (){
                    setState(() {
                      selectedGender = 1;
                });
                }), 
        ],),
        Row(
          children: [
            ReuseableCard(cardChild: MeasureCard(
              measure: weight,
              title: 'Weight',
              unit: 'kg',
              increment: (){
                setState(() {
                  weight++;
                });
              },
              decrement: (){
                setState(() {
                  if(weight>0)
                    weight--;
                });
              },
            ), onPress: (){}),
            ReuseableCard(cardChild: MeasureCard(
              measure: height,
              title: 'Height',
              unit: 'cm',
              increment: (){
                setState(() {
                  height++;
                });
              },
              decrement: (){
                setState(() {
                  if(height>0)
                    height--;
                });
              },
            ), onPress: (){}),
          ],
        ),
        GestureDetector(
          onTap: (){
            double bmi = weight / pow(height / 100, 2);
            String bmiString = bmi.toStringAsFixed(2);
            String bmiStatus = '';
            if(bmi<18.5)
              bmiStatus = 'Underweight';
            else if(bmi>18.5 && bmi<24.9)
              bmiStatus = 'Normal/Healthy';
            else if(bmi>24.9)
              bmiStatus = 'Overweight';
          
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text(
                  'Your BMI is $bmiString\nStatus : $bmiStatus',
                  style: TextStyle(
                    fontSize: 25,
                ),
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text('Back')
                  )
                ],
            );
          });
        
          },
          child: Container(
            color: Colors.pink,
            width: double.infinity,
            height: 70,
            child: Center(
              child: Text('Calculate',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
          
          ),
        ),
      ],),
    );
  }
}
