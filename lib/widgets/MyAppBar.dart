// import 'package:ehsan_store/util/Constant.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height*0.2,
//             child: Stack(
//               children: [
//                 Container(
//                   height: size.height*0.2-28,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(36),
//                       bottomLeft: Radius.circular(36)
//                     )
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 56,
//                     margin: EdgeInsets.symmetric(horizontal: 30),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow:[
//                         BoxShadow(
//                           offset: Offset(0,1),
//                           blurRadius: 10,
//                           color: Theme.of(context).accentColor.withOpacity(0.8)
//                         )
//                       ]
//                     ),
//                     child: TextField(
//                       onChanged: (value){},
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         suffixIcon: Icon(Icons.search_rounded,color: PRIMARY_COLOR,)
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
