// // import 'package:calculator/app/pressed.dart';
// import 'package:flutter/material.dart';

// class button1 extends StatefulWidget {
//   final String btext;
//   final double bheight;
//   final Color color;
//   const button1({super.key,
//     required this.btext,
//     required this.bheight,
//     required this.color,});

//   @override
//   State<button1> createState() => _button1State();
// }

// class _button1State extends State<button1> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Container(
//                             height: MediaQuery.of(context).size.height * 0.1 * widget.bheight,
                            
//       decoration: BoxDecoration(
//         color: widget.color,
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(
//             color: Color.fromARGB(65, 255, 255, 255),
//             width: 1.0,
//           )),
//                             child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               primary: Colors.transparent, shadowColor: Colors.transparent),
//                               onPressed: () =>buttonPressed,
//                                child: Text(
//                                 widget.btext,
//                                style: TextStyle(
//                                 fontSize: 30.0,
//                                 color: Colors.white,
//                                ),
//                                )
//                                ),
//                           ),
//     );
//   }
// }