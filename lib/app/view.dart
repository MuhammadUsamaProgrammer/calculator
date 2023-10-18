// import 'package:calculator/app/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buText){
    setState(() {
      if (buText == 'C'){
        equation = '0';
        result = '0';
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }
      else if (buText == '⌫'){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length-1);
        if(equation == ''){
          equation = '0';
        }
      }
      else if (buText == '='){
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          print(e);
        }
      }
      else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        // if(buText == '0'){
        //   equation = buText;
        // }
        // else if(buText == '00'){
        //   equation = equation;
        // }
        // else{
        equation = equation + buText;
        // }
      }
    });
  }


  Widget button2(
  String btext,
  double bheight,
  Color color,
  ){
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1 * bheight,
      decoration: BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Color.fromARGB(65, 255, 255, 255),
            width: 1.0,
          )),
                            child: ElevatedButton(
                              
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              primary: Colors.transparent, shadowColor: Colors.transparent),
                              onPressed: () =>buttonPressed(btext),
                               child: Text(
                                btext,
                               style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                               ),
                               )
                               ),
                          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(backgroundColor: Colors.black,
        title: Center(
          child: Text('CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            ),
               ),
        ),
       
       ),
       body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,
            style: TextStyle(
              color: Colors.white,
              fontSize: equationFontSize,
            ),),
          ),
          
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,
            style: TextStyle(
              color: Colors.white,
              fontSize: resultFontSize,
            ),),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children:[
                        button2('C', 1,const Color.fromARGB(255, 255, 0, 0)),
                        button2('⌫', 1, Color.fromARGB(255, 122, 122, 122)),
                        button2('÷', 1, Color.fromARGB(255, 122, 122, 122)),
                      ], 
                    ),
                    TableRow(
                      children:[
                        button2('7', 1,  Colors.black54),
                        button2('8', 1,  Colors.black54),
                        button2('9', 1,  Colors.black54),
                      ], 
                    ),
                    TableRow(
                      children:[
                        button2('4', 1,  Colors.black54),
                        button2('5', 1,  Colors.black54),
                        button2('6', 1,  Colors.black54),
                      ], 
                    ),
                    TableRow(
                      children:[
                        button2('1', 1,  Colors.black54),
                        button2('2', 1,  Colors.black54),
                        button2('3', 1,  Colors.black54),
                      ], 
                    ),
                    TableRow(
                      children:[
                        button2( '.', 1, Colors.black54),
                        button2( '0', 1, Colors.black54),
                        button2( '00', 1, Colors.black54),
                      ], 
                    ),
                  ],
                ),
              ),
              
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button2('×', 1,Color.fromARGB(255, 122, 122, 122)),
                      ],
                    ),
                    TableRow(
                      children: [
                        button2('-', 1,Color.fromARGB(255, 122, 122, 122)),
                      ],
                    ),
                    TableRow(
                      children: [
                        button2('+', 1, Color.fromARGB(255, 122, 122, 122)),
                      ],
                    ),
                    TableRow(
                      children: [
                        button2('=', 2.03, const Color.fromARGB(255, 255, 0, 0)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
       ]),
    );
  }
}