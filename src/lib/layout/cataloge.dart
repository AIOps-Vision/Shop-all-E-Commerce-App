import 'package:flutter/material.dart';
import 'brand_button.dart';

class Cataloge extends StatelessWidget {
  final List<Map<String, Object>> branches;
  final int catalogeIcon;

  Cataloge({
    required this.branches,
    required this.catalogeIcon,
  });
  final List<IconData> ico = [
    Icons.restaurant,
    Icons.health_and_safety,
    Icons.car_crash,
    Icons.local_cafe_outlined,
    Icons.family_restroom,
    Icons.workspaces_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadiusDirectional.only(
      //     topStart: Radius.circular(
      //       20.0,
      //     ),
      //     topEnd: Radius.circular(
      //       20.0,
      //     ),
      //   ),
      // ),
      margin: const EdgeInsets.only(
        right: 5,
        left: 5,
        top: 5,
        bottom: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: ListTile(
              // leading: Icon(
              //   Icons.search,
              //   size: 15.0,
              //   color: Colors.black.withOpacity(.9),
              // ),
              title: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellowAccent, width: 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // disabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.black,
                  //     width: 1.0,
                  //   ),
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 20.0,
                  ),
                  suffixIcon: Icon(
                    ico[catalogeIcon],
                    color: Colors.blue,
                    size: 20.0,
                  ),
                  labelText: branches[catalogeIcon]['head'].toString(),

                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(
                  //     10.0,
                  //   ),
                  //   borderSide: const BorderSide(
                  //     width: 2,
                  //     color: Colors.yellow,
                  //   ),
                  // ),
                ),
              ),
              //subtitle: Text(branches[inde]['head'].toString()),
              isThreeLine: false, //if this true must but subtitle
              dense: true,
              // trailing: Icon(
              //   ico[catalogeIcon],
              //   color: Colors.black45,
              // ),
              enabled: true,
              selected: true,
              // onTap: () {},
            ),
          ),
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const SizedBox(
          //       width: 2.0,
          //     ),
          //     Text(
          //       branches[inde]['head'].toString(),
          //       style: const TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 18,
          //           fontFamily: 'times',
          //           color: Colors.black),
          //       // textAlign: TextAlign.center,
          //     ),
          //     Container(
          //       width: 150.0,
          //       height: 35.0,
          //       decoration: BoxDecoration(
          //         color: Colors.grey[100],
          //         borderRadius: BorderRadius.circular(
          //           10.0,
          //         ),
          //       ),
          //       margin: const EdgeInsets.all(
          //         1.0,
          //       ),
          //       padding: const EdgeInsets.all(
          //         3.0,
          //       ),
          //       child: TextFormField(
          //         //if you used TextField it will not give validation but will give color and icon beside by
          //         //filled: true,
          //         //filledColor:Colors.white,
          //         //icon:Icon(Icons.home, color: .....),hintText: '', hintStyle: TextStyle(color:...),
          //         decoration: InputDecoration(
          //           // prefix: const Icon(
          //           prefixIcon: const Icon(
          //             //you can wrap this to container to add all that you need inside search bar as google search
          //             Icons.search,
          //             size: 15.0,
          //           ),
          //           labelText: 'Search',
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(
          //               10.0,
          //             ),
          //             borderSide: const BorderSide(
          //               width: 2,
          //               color: Colors.yellow,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Icon(
          //       ico[inde],
          //       color: Colors.black.withOpacity(.9),
          //     ),
          //     const SizedBox(
          //       width: 1.0,
          //     ),
          //   ],
          // ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...(branches[catalogeIcon]['declare']
                          as List<Map<String, Object>>)
                      .map((answers) {
                    //here answers is type list of map
                    return BrandButton(
                        answers['branch'] as String, answers['url'] as String);
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
