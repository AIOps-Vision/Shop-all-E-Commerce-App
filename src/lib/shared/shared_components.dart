import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

// it will be used with every time so we used it as usable component
Widget defaultAnyButton({
  required double width,
  required double height,
  Color color = Colors.blue, // Iadded value here because this is the default
  //so not should be added every button creation but you can change in call if you need
  required VoidCallback function,
  bool isUpperCase = true,
  required String text,
  double radius = 5.0,
}) =>
    Container(
      height: height,
      width: width,
      color: color,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
        ),
        // style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
      ),
    );

Widget defaultTextFormField({
  InputDecoration? decoration,
  Color? color,
  required TextEditingController controller,
  required TextInputType type,
  final Function(String)? onSubmit,
  final Function(String)? onChange,
  final Function()? onTap,
  bool isPassword = false,
  String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        filled: false,
        fillColor: color,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

//Widget defaultItem({required String text, required String stext}) => Padding(
Widget defaultItem(Map model, context) => Dismissible(
      //Dismissible enable deleting by swap from database
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        ChangeCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Text('1'),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(model['title']),
                Text(model['time']),
                IconButton(
                    onPressed: () {
                      ChangeCubit.get(context)
                          .updateData(status: 'Done', id: model['id']);
                    },
                    icon: Icon(
                      Icons.check_box_outlined,
                      color: Colors.greenAccent,
                    )),
                IconButton(
                    onPressed: () {
                      ChangeCubit.get(context)
                          .updateData(status: 'Deleted', id: model['id']);
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.yellowAccent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
// return null; //function should return any thing by {} those curely so use => instead of {}

Widget sellerItemsBuilder({required List<Map> tasks, required choose}) =>
    // tasks.length==0? Center(child:CircularProgressIndicator()): screens[currentIndex]// also can use conditionalbuilder
    ConditionalBuilder(
      // condition:true,
      // condition:state is! GetDataLoad,
      condition: tasks.length > 0,
      // builder:(context)=>ChangeCubit.screens[ChangeCubit.currentIndex],
      builder: (context) => Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.yellow,
              size: 20,
            ),
          ),
          ListView.separated(
            itemBuilder: (context, index) => defaultItem(tasks[index], context),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 2.0,
              color: Colors.blueAccent,
            ),
            shrinkWrap: true,
            itemCount: tasks.length,
          ),
        ],
      ),
      // fallback:(context)=>Center(child:CircularProgressIndicator())
      fallback: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.yellow,
              size: 30,
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.yellowAccent,
                ),
                height: 30,
                //width: double.infinity,
                child: Center(
                  child: Text(
                    choose,
                    style: TextStyle(
                      fontFamily: 'times',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          //SellerList(),
        ],
      ),
    );



//good example for assign list of string to list of map
// List<String> stringList = ["one", "two", "three"];
// List<Map<String, dynamic>> mapList = [];
// stringList.forEach((element) {
//   mapList.add({"name": "$element", "selected": false});
// });

//good example to convert list of string int map values
// List<String> l= ["1","2","3","4"];
//   Map<String,dynamic> mapp = {};
// l.forEach((element) { 
//   mapp["id"] = element;
// });