// import 'package:flutter/material.dart';
// import '../main.dart';
// import '../seller/seller_choose.dart';

// class BuyerSeller extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //if you warp it in padding baccolor will be blac because
//       width: double.infinity, //no scaffold that with default white color
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 15,
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               elevation: 10.0,
//               backgroundColor: Colors.yellowAccent,
//               shape: CircleBorder(),
//               padding: EdgeInsets.all(75),
//             ),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Main(),
//                   ));
//             },
//             child: Text(
//               'I\'m the Buyer ',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'times',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               elevation: 10.0,
//               //shape: StadiumBorder()
//               //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
//               // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               backgroundColor: Colors.grey[200],
//               shape: CircleBorder(),
//               padding: EdgeInsets.all(75),
//             ),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SellerChoosen(),
//                     //DataBaseFloatButton(),
//                   ));
//             },
//             child: Text(
//               'I\'m the Owner',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'times',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           ElevatedButton.icon(
//             icon: Icon(
//               Icons.keyboard_backspace_sharp,
//               size: 20,
//               color: Colors.blue,
//             ),
//             label: Text(
//               "back",
//               style: TextStyle(
//                 fontFamily: 'times',
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 13,
//               ),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
