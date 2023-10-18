import 'package:calculator/app/view.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 243, 4, 4)),
      home: SimpleCalculator(),
    );
  }
}