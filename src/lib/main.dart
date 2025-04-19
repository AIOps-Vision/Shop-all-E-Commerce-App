import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shope_all/layout/buy_or_sell.dart';
import 'layout/home.dart';
import 'log/login.dart';
import 'package:bloc/bloc.dart';
import './shared/bloc_observer.dart';
import 'layout/saved_item.dart';
import './layout/my_orders.dart';
import './seller/seller_choose.dart';
import './cubit/cubit.dart';

// to toggle between two use tru or false to toogle between more than two use list of them type
void main() {
  Bloc.observer = MyBlocObserver();
  return runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Widget> downbottoms = [
    Home(),
    SavedItems(),
    MyOrders(),
    SellerChoosen(),
    LogIn(),
  ];

  int currentBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'APP',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(
        //   backgroundColor: Colors.black,
        // ),
        // textTheme: GoogleFonts
        //     .emilysCandyTextTheme(),
        //   backwardsCompatibility: true, //this allow me to controll status bar
        //  systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.pink,
        //     statusBarBrightness: Colors.amberAccent,
        //     statusBarIconBrightness: Brightness.light,
        //   ),
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.yellowAccent,
        //   elevation: 2,
        // ),
      ),
      // theme: ThemeData.dark(),
      // darkTheme: ThemeData(),
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.teal,
        //   titleSpacing: 20.0,
        //   elevation: 0.0,
        //   leading: Builder(builder: (context) {
        //     return IconButton(
        //       onPressed: () => Scaffold.of(context).openDrawer(),
        //       icon: Icon(Icons.propane),
        //     );
        //   }),
        //   title: const Text(
        //     'With Shope_All you saved time',
        //     style: TextStyle(
        //       fontSize: 15.0,
        //     ),
        //     // textAlign: TextAlign.center,
        //   ),
        //   //centerTitle: true,
        //   actions: const [
        //     IconButton(
        //       icon: CircleAvatar(
        //         radius: 20.0,
        //         backgroundColor: Colors.black,
        //         child: Icon(
        //           Icons.camera_alt_outlined,
        //           color: Colors.white,
        //           size: 30.0,
        //         ),
        //       ),
        //       onPressed: null,
        //     ),
        //   ],
        // ),
        // drawer: Drawer(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       DrawerHeader(
        //           decoration: BoxDecoration(color: Colors.pink),
        //           child: Text('wahba')),
        //       InkWell(
        //         onTap: () {
        //           Navigator.pop(context);
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => SaveItems(),
        //               ));
        //         },
        //         child: Container(
        //           //you can remove container and color and wrap inkwell with material widget with color
        //           padding: EdgeInsets.all(10),
        //           color: Colors.blue,
        //           child: Column(
        //             children: [
        //               CircleAvatar(
        //                 radius: 50,
        //                 backgroundImage: NetworkImage('url'),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text('Wahba Mousa'),
        //               Text('engineerwahba@gmail.com'),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Wrap(
        //         // same as Column, can use Listview also
        //         runSpacing: 16, //vertical spacing between elements
        //         children: [
        //           ListTile(
        //             leading: Icon(
        //               Icons.menu,
        //               color: Colors.pink,
        //             ),
        //             title: Text('data'),
        //             onTap: () {
        //               Navigator.pop(context);
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => SaveItems(),
        //                   ));
        //             },
        //           ),
        //           ListTile(
        //             leading: Icon(
        //               Icons.menu,
        //               color: Colors.pink,
        //             ),
        //             title: Text('data'),
        //             onTap: () {},
        //           ),
        //           Divider(
        //             //as sizedbox with height 1
        //             color: Colors.yellowAccent,
        //           ),
        //           ListTile(
        //             leading: Icon(
        //               Icons.menu,
        //               color: Colors.pink,
        //             ),
        //             title: Text('data'),
        //             onTap: () {},
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        body: SafeArea(
          child: IndexedStack(
            //this widget keep other widgets alife when yu turn between them if not found when you go back to
            //the last one it will start from the first
            children: downbottoms,
            index: currentBottomBarIndex,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 40,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            margin: const EdgeInsets.only(
              right: 10.0,
              left: 10.0,
              top: 3.0,
            ),
            height: 40.0,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.yellowAccent,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
                selectedFontSize: 8,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedFontSize: 8,
                iconSize: 20,
                elevation: 1.0,
                //showUnselectedLabels: false,
                //showSelectedLabels: true, //default
                currentIndex: currentBottomBarIndex,
                onTap: (index) {
                  setState(() {
                    currentBottomBarIndex = index;
                  });
                },
                items: // ListView.builder(itemBuilder: itemBuilder, itemCount: ,scrollDirection: Axis.horizontal,)
                    const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline),
                    label: 'Saved Items',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_grocery_store_outlined),
                    label: 'My Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sell_outlined),
                    label: 'Seller',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_add_alt_outlined),
                    label: 'Log In',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
