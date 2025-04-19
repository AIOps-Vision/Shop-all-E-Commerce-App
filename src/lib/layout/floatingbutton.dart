// import 'package:flutter/material.dart';
// import '../cubit/cubit.dart';
// import '../shared/shared_components.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/states.dart';

// class FloatingButton extends StatelessWidget {
//   final formkey = GlobalKey<FormState>();
//   final titlecontroller = TextEditingController();
//   final timecontroller = TextEditingController();
//   final datecontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ChangeCubit(),
//       child: BlocConsumer<ChangeCubit, States>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Container(
//             margin: EdgeInsets.only(left: 15.0, bottom: 15.0),
//             child: FloatingActionButton.extended(
//               extendedPadding: EdgeInsets.symmetric(
//                 horizontal: 2.0,
//               ),
//               backgroundColor: Colors.amber,
//               foregroundColor: Colors.white,
//               label: Text(
//                 'Add New Item',
//                 style: TextStyle(
//                   fontFamily: 'times',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//               icon: Icon(ChangeCubit.get(context).butIcon),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               //child: Text('Data'),
//               onPressed: () {
//                 //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
//                 if (!ChangeCubit.get(context).isButtomSheetopened) {
//                   if (formkey.currentState!.validate()) {
//                     ChangeCubit.get(context).insertShopDatabase(
//                         title: titlecontroller.text,
//                         time: timecontroller.text,
//                         date: datecontroller.text);
//                   }
//                 } else {
//                   ChangeCubit.get(context)
//                       .scaffoldKey
//                       .currentState!
//                       .showBottomSheet(
//                         (context) => Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth: 300.0,
//                                 // maxHeight: 500,
//                               ),
//                               child: Container(
//                                 alignment: Alignment.bottomCenter,
//                                 padding: const EdgeInsets.only(
//                                   right: 10.0,
//                                   left: 10.0,
//                                   top: 10.0,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: 10.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   // shape: BoxShape.circle, //this will make container as circle and must add width and height
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(10.0),
//                                     topLeft: Radius.circular(10),
//                                   ),
//                                   color: Colors.yellowAccent,
//                                 ),
//                                 child: SingleChildScrollView(
//                                   child: Form(
//                                     key: formkey,
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         const SizedBox(
//                                           height: 10.0,
//                                         ),
//                                         Container(
//                                           color: Colors.white,
//                                           child: defaultTextFormField(
//                                               decoration: InputDecoration(
//                                                 filled: true,
//                                                 fillColor: Colors.yellowAccent,
//                                                 enabledBorder:
//                                                     OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: Colors
//                                                               .greenAccent,
//                                                           width: 5.0,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     20.0)),
//                                                 errorBorder: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                         color: Colors
//                                                             .purpleAccent)),
//                                                 focusedErrorBorder:
//                                                     OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             color: Colors
//                                                                 .redAccent)),
//                                                 errorStyle: TextStyle(
//                                                     color: Colors.purpleAccent),
//                                               ),
//                                               controller: titlecontroller,
//                                               type: TextInputType.text,
//                                               validate: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'title must not be empty';
//                                                 }
//                                                 return null;
//                                               },
//                                               label: 'task one',
//                                               prefix: Icons.title),
//                                         ),
//                                         const SizedBox(
//                                           height: 10.0,
//                                         ),
//                                         Container(
//                                           color: Colors.white,
//                                           child: defaultTextFormField(
//                                               //  isClickable: false,
//                                               onTap: () {
//                                                 showTimePicker(
//                                                         context: context,
//                                                         initialTime:
//                                                             TimeOfDay.now())
//                                                     .then((value) {
//                                                   if (value != null)
//                                                     timecontroller.text =
//                                                         value.format(
//                                                             context); // as it take it also fill time in its place after choosing date
//                                                 });
//                                               },
//                                               controller: timecontroller,
//                                               type: TextInputType.datetime,
//                                               validate: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'title must not be empty';
//                                                 }
//                                                 return null;
//                                               },
//                                               label: 'task time',
//                                               prefix:
//                                                   Icons.watch_later_outlined),
//                                         ),
//                                         const SizedBox(
//                                           height: 10.0,
//                                         ),
//                                         Container(
//                                           color: Colors.white,
//                                           child: defaultTextFormField(

//                                               // isClickable: false,
//                                               onTap: () {
//                                                 showDatePicker(
//                                                   context: context,
//                                                   initialDate: DateTime.now(),
//                                                   firstDate: DateTime.now(),
//                                                   lastDate: DateTime.parse(
//                                                       '2023-02-20'),
//                                                 ).then((value) {
//                                                   if (value != null)
//                                                     datecontroller.text =
//                                                         DateFormat.yMMM()
//                                                             .format(value);
//                                                 });
//                                               },
//                                               controller: datecontroller,
//                                               type: TextInputType.datetime,
//                                               validate: (value) {
//                                                 if (value == null ||
//                                                     value.isEmpty) {
//                                                   return 'title must not be empty';
//                                                 }
//                                                 return null;
//                                               },
//                                               label: 'task date',
//                                               prefix: Icons
//                                                   .calendar_month_outlined),
//                                         ),
//                                         const SizedBox(
//                                           height: 10.0,
//                                         ),
//                                         // Center(child: Wrap(children: <Widget>[], //wrap is like column but it didn't take full height by default
//                                         //   child: ElevatedButton(child: const Text('Close'),
//                                         //     onPressed: () { Navigator.pop(context);},),),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         // elevation: 5,
//                       )
//                       .closed
//                       .then((value) {
//                     //Navigator.pop(context);
//                     ChangeCubit.get(context).bottomSheetOpend(
//                       ButtomSheetopened: false,
//                       edit: Icons.edit,
//                     );
//                     // setState(() { edit = Icons.edit; });
//                   });
//                   ChangeCubit.get(context).bottomSheetOpend(
//                     ButtomSheetopened: true,
//                     edit: Icons.add,
//                   );
//                   // setState(() { edit = Icons.add; });
//                 }
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
