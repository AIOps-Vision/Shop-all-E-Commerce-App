import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';
import 'cataloge.dart';
import '../cubit/cubit.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeCubit(),
      child: BlocConsumer<ChangeCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 5.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 3.0,
                    ),
                    width: double.infinity,
                    height: 25.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment
                          .baseline, // to align things at same baseline
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                            //container can be used instead of sizedbox but with color
                            width: 7.0),
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          foregroundImage: NetworkImage(
                              'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/282046421_339208438356088_8842411959126027028_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MpqQGhaSigsAX8A-cm-&_nc_ht=scontent.fcai20-1.fna&oh=00_AfCxiZdzyskTykXBou1aCIRN7Yo7MU1FPnVS7xBDUte9mg&oe=6366F7F5'),
                          radius: 10,
                        ),
                        SizedBox(
                            //container can be used instead of sizedbox but with color
                            width: 7.0),
                        const Text('SHOPE ALL',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'times'),
                            textAlign: TextAlign.left),
                        SizedBox(width: 7.0),
                        const Text('Save Money, Efforts,Time and be Safe.',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'times',
                                color: Colors.yellowAccent),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  // ListView.builder(
                  // itemExtent: 3,
                  ListView.separated(
                    // to add separating box between list
                    shrinkWrap:
                        true, //it build list once because it scroll with screen not alone and only for
                    // vertical list, horizontal listview take, scrollDirection Axis.horizontal
                    physics:
                        NeverScrollableScrollPhysics(), //it prevent list from scroll  bexcause i will scroll with screen, don't use it with horiaontal list
                    itemBuilder: (context, index) {
                      // buildRow_cataloge()
                      return Cataloge(
                        branches: ChangeCubit.myList,
                        catalogeIcon: index,
                      );
                    },
                    separatorBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                        )),
                    itemCount: ChangeCubit.myList.length,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
