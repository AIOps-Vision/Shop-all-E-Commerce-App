// OutlinedButton.icon(
//   icon: Icon(Icons.star_outline),
//   label: Text("OutlinedButton"),
//   onPressed: () => print("it's pressed"),
//   style: ElevatedButton.styleFrom(
//     side: BorderSide(width: 2.0, color: Colors.blue),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(32.0),),),)
                

      //  Container( //container decoration parentheses didn't include child in it
      //   clipBehavior: Clip.antiAliasWithSaveLayer, width: 100, height: 100,
      //   decoration: BoxDecoration( borderRadius: BorderRadius.circular( 20.5, ), color: Colors.yellow, ),
      //   child: Image.network(fit: BoxFit.cover,
      //     'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320',),),

// Container( width: 100, height: 100, //container decoration parentheses include image in it
// decoration: BoxDecoration( borderRadius: BorderRadius.circular(20.5,), color: Colors.yellow,
// image: DecorationImage(fit: BoxFit.cover,
// image: NetworkImage( 'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320',),), )),

              // Image. network( 'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320',
              // width: 110.0,
              // height: 140.0,),

          // Image.asset() //without avatar and center take real dimension you gived with full width

                  //Container( decoration: BoxDecoration( color: Colors.black.withOpacity(.5),
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/market.jpg'), ),
                  // borderRadius: BorderRadius.circular(0.5,),),)

          // CircleAvatar( //with cicleAvatar
          //   child: ClipOval(
          //    child: Center(
          //     child: Image.asset(links, //Image.asset(') internally use AssetImage as Image (image: AssetImage(''))
          //         width: 110.0,
          //         height: 140.0,
          //         fit: BoxFit.cover,),),),),

          // Container( //to add border to image wrap in container
          //   child: ClipRRect(
          //     borderRadiusBorderRadius.circular(20.0,),
          //       child: Image.asset(
          //         links,
          //         width: 110.0,
          //         height: 140.0,
          //         fit: BoxFit.cover,),),),),

          // InkWell( // can use InkResponse both cause color splash effect on any child Text or image and they take onTap (){}
          //   onTap: () {}, //InkWell can't take borderRadius do this through Material and Ink widgets
          //   splashColor: Colors.red,
          //   child: Image.asset('assets/images/market.jpg',
          //     width: 110.0,
          //     height: 140.0,
          //     fit: BoxFit.cover,) ),

          // Center(
          //   child: Material( //you can use Ink direct with decoration: BoxDecoration(borderRadius:...) without Material
          //     clipBehavior: Clip.antiAlias, // this make ink child as decoration border and it only with material widget
          //     shape: RoundedRectangleBorder( //and clip you can use ink only and wrap InkWell child with Padding
          //       borderRadius: BorderRadius.circular( 20.0,),),
          //     child: Ink( //ink here is urgent because it take height and width but InkWell didn't also if its image child has width and height
          //      color: Colors.yellowAccent,
          //       child: GestureDetector( // same as InkWell but without click color effect
          //       child: InkWell( // to put decoration around InkWell must use Ink wigget alone or with Material widget and clip
          //  focusColor: Colors.black,
          //       splashColor: Colors.black,
          //       highlightColor: Colors.amber,
          //       hoverColor: Colors.amber,
          //      child: Image.network('src',fit: BoxFit.cover,),
          //         onTap: () {},),
          //       height: 250,
          //       width: 250,
          //       ),),),

          // Center(
          //   child: Ink(
          //     decoration: BoxDecoration( //decoration here act like shape in material widget
          //       borderRadius: BorderRadius.circular(30),
          //       color: Colors.yellowAccent,), // this give color
          //     child: InkWell( // to put decoration around InkWell must use Ink wigget or Material widget
          //       child: Padding( // padding here act like clip in material widget
          //         padding: const EdgeInsets.all(10.0),
          //         child: Image.network( 'src',
          //           fit: BoxFit.cover,),),
          //       onTap: () {},),
          //     height: 250,
          //     width: 250,),),

          // Center(
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(
          //         20.0,),
          //       child: Material( //needed to apply borderradius on child
          //     child: Ink( //ink here is urgent because it take height and width but InkWell didn't also if its image child has width and height
          //       color: Colors.yellowAccent,
          //       // child: GestureDetector( // same as InkWell but without click color effect
          //       child: InkWell(  // to put decoration around InkWell must use Ink wigget alone or with Material widget and clip
          //         focusColor: Colors.black,
          //         splashColor: Colors.black,
          //         highlightColor: Colors.amber,
          //         hoverColor: Colors.amber,
          //         child: Image.network( 'src', fit: BoxFit.cover,),
          //         onTap: () {},),
          //       height: 250,
          //       width: 250,),),),),

          // InkWell(
          // onTap: () {},
          // onDoubleTap: (){},
          // child: Ink(
          //   width: 200,
          //   height: 200,
          //   color: Colors.blue,
          // ),)

          // GestureDetector(
          // onTap: () {},
          // onDoubleTap: (){},
          // onLongPress: (){},
          // child: Container(
          //   width: 200,
          //   height: 200,
          //   color: Colors.blue,
          //child: text('check'), ),)


         // GestureDetector(
         //   onTap: () {  },
         //   child: const CircleAvatar(
         //     radius: 16.0,
        //     backgroundColor: Colors.blue,
        //     child: CircleAvatar(
        // backgroundImage: AssetImage('assets/images/logo.jpg'),
         // radius: 13.0,),),)

          // Slider(value: 120,max: 200,min: 100,onChanged: (value) { //create slider with different values
          //   print(value.round()); },)

                  // TextButton(
                  //   child: Text( 'Log In',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold,
                  //       fontFamily: 'times',color:Colors.lightBlueAccent),),
                  // // style: ButtonStyle( foregroundColor: MaterialStateProperty.all( Colors.lightBlueAccent),),
                  // //  // style: TextButton.styleFrom(primary :Colors.amberAccent),
                  //   onPressed: () {},),
