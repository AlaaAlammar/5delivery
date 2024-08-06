//  import 'package:flutter/material.dart';

// import '../constants.dart';

//   class CustomTextField extends StatelessWidget {
//  final double width, height;
//  final TextInputType keyBoared;
//  final String lableText;
//  final Function(String) onChange;
//  final Icon icon;
//  // final Icon icon;

//  CustomTextField( {
//        required this.width,
//      required this.height,
//      required this.keyBoared,
//    required this.lableText,
//    required this.onChange,
//    required this.icon

//    // required this.icon
//  } );

//  @override
//     Widget build(BuildContext context) {
//       return Container(
//         width: width,
//         height:60,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade200,
//             border: Border(
//                 top: BorderSide(width: 2, color: Colors.grey.shade200),
//                 left: BorderSide(width: 2, color: Colors.grey.shade200),
//                 right: BorderSide(width: 2, color: Colors.grey.shade200),
//                 bottom: BorderSide(width: 2, color: Colors.grey.shade200))),
//         child: SizedBox(
//           child: TextField(

//             keyboardType: keyBoared,
//            onChanged: onChange,
//             style: TextStyle(color: Colors.black,fontSize: 20),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               // prefixIcon: icon,
//               labelText: lableText,
//               icon: icon,
//             ),
//           ),
//         ),
//       );
//     }
//   }
import 'dart:ui';

import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final double width, height;
  final TextInputType keyBoared;
  final String lableText;
  final Function(String) onChange;
  final Icon icon;

  // final Icon icon;

  CustomTextField({
    required this.width,
    required this.height,
    required this.keyBoared,
    required this.lableText,
    required this.onChange,
    required this.icon,
    // required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return
        //   Container(
        //   width: width,
        //   height:60,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade200,
        //       border: Border(
        //           top: BorderSide(width: 2, color: Colors.grey.shade200),
        //           left: BorderSide(width: 2, color: Colors.grey.shade200),
        //           right: BorderSide(width: 2, color: Colors.grey.shade200),
        //           bottom: BorderSide(width: 2, color: Colors.grey.shade200))),
        //   child: SizedBox(
        //     child: TextField(
        //       keyboardType: keyBoared,
        //      onChanged: onChange,
        //       style: TextStyle(color: Colors.black,fontSize: 20),
        //       decoration: InputDecoration(
        //         border: OutlineInputBorder(),
        //         // prefixIcon: icon,
        //         labelText: lableText,
        //         prefix: icon,
        //       ),
        //     ),
        //   ),
        // );
        Container(
      color: Colors.grey.shade200,
      child: TextFormField(
        textAlign: TextAlign.right,
        //textAlign: TextAlign.right,
        //textDirection: TextDecoration.rtl,
        //  textDirection: TextDirection.rtl,
        keyboardType: keyBoared,
        onChanged: onChange,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: lableText,
          suffixIcon: icon,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
