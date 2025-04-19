import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_all/cubit/states.dart';
import '../cubit/cubit.dart';
import '../database_floatbutton.dart';

class SellerChoosen extends StatelessWidget {
  const SellerChoosen({Key? key}) : super(key: key);
  //if there list of class objects inside myList use e.object instead of e['']

  //ChangeCubit.myList.map((e) => emyListHeads.toString()['declare']['branch'].toString()).toList();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeCubit(),
      child: BlocConsumer<ChangeCubit, States>(
        listener: (context, index) {},
        builder: (context, index) {
          return Material(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Expanded(
                      child: DropdownButtonHideUnderline(
                        //this hide any under choosen value line
                        child: DropdownButtonFormField<String>(
                          //formfield only for decoration, also can only use DropdownButton
                          //and wrap it with container for decoration
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ),

                          items: ChangeCubit.get(context)
                              .myListHeads //myListHeads.forEach((String element) forEach return void so use .map
                              .map(
                                (element) => DropdownMenuItem<String>(
                                  //here element type is string

                                  value: element,
                                  child: Text(
                                    element,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'times',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          hint: Text(
                            'Select your Category',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times',
                              fontSize: 20,
                            ),
                          ),
                          // value: ChangeCubit.get(context).selectedItem,
                          onChanged: (element) {
                            ChangeCubit.get(context).select = null;
                            ChangeCubit.get(context).selectedItem = element!;
                            ChangeCubit.get(context).checkMyDownList(element);
                          },
                          iconSize: 40,
                          iconEnabledColor: Colors.black,
                          icon: const Icon(Icons.badge_outlined),
                          isExpanded: true,
                          // style: GoogleFonts.patauaOne(
                          //   textStyle: TextStyle(color: Colors.amberAccent),
                          // ),
                        ),
                      ),
                    )),
                  ),
                  // DropdownButton<String>(
                  //   items: [
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play')),
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play')),
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play')),
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play')),
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play')),
                  //     DropdownMenuItem<String>(
                  //         value: '1', child: Text('play'))
                  //   ],
                  //   hint: Text('Select your place'),
                  //   onChanged: (value) {
                  //     if (value != null || value!.isEmpty) {
                  //       ChangeCubit.get(context).disableDrop = true;
                  //       ChangeCubit.get(context).val = value;
                  //       Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: DropdownButton<String>(
                  //           items: ChangeCubit.get(context).placesitems,
                  //           onChanged: ChangeCubit.get(context).check()
                  //               ? true
                  //               : null,
                  //           disabledHint: Text('First choose your place'),
                  //           hint: Text('Select your second place'),
                  //         ),
                  //       );
                  //     }
                  //     Text('${ChangeCubit.get(context).val}');
                  //   },
                  // ),

                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Expanded(
                      child: DropdownButtonFormField<String>(
                        //formfield only for decoration, also can only use DropdownButton
                        //and wrap it with container for decoration
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.yellowAccent,
                            ),
                          ),
                        ),
                        items: ChangeCubit.get(context)
                            .checkMyDownList(
                                ChangeCubit.get(context).selectedItem)
                            // ChangeCubit.get(context).choosenMyDownListHead,
                            // ChangeCubit.get(context).state)
                            .map(
                              (element) => DropdownMenuItem<String>(
                                value: element,
                                child: Text(
                                  element,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'times',
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        hint: Text(
                          'Select your ${ChangeCubit.get(context).selectedItem} list',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'times',
                            fontSize: 13,
                          ),
                        ),
                        value: ChangeCubit.get(context).select,
                        onChanged: (element) {
                          // ChangeCubit.get(context).select = element!;
                          ChangeCubit.get(context).chooseSelectItem(element!);
                        },

                        iconSize: 40,
                        iconEnabledColor: Colors.black,
                        icon: const Icon(Icons.badge_outlined),
                        isExpanded: true,
                        // style: GoogleFonts.patauaOne(
                        //   textStyle: TextStyle(color: Colors.amberAccent),
                        // ),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ChangeCubit.get(context).select == null
                              ? 'Choose your ${ChangeCubit.get(context).selectedItem} list'
                              : 'Add ${ChangeCubit.get(context).select} offers',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'times',
                            fontSize: 13,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              ChangeCubit.get(context).select != null
                                  //  ? Navigator.of(context).push(
                                  // ? Navigator.pushNamed(
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DataBaseFloatButton(
                                            sele:
                                                'ChangeCubit.get(context).select!'),
                                        //DataBaseFloatButton(sele: ''),
                                      ),
                                    )
                                  : null;
                            },
                            child: Text(
                              'Add items',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'times',
                                fontSize: 14,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),

      // ListTile(
      //   trailing: IconButton(
      //     icon: Icon(
      //       Icons.arrow_drop_down_circle_outlined,
      //       color: Colors.yellowAccent,
      //     ),
      //     onPressed: () {
      //       ListView.builder(
      //         shrinkWrap: true,
      //         physics: AlwaysScrollableScrollPhysics(),
      //         itemCount: headerlist.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             onTap: () {
      //               clicked ? button : Icon(Icons.circle_outlined);
      //             },
      //             title: Text(headerlist[index]['head'].toString()),
      //           );
      //         },
      //       );
      //     },
      //   ),
      // );
    );
  }
}
