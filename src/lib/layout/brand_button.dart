import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  final String label;
  final String links;

  BrandButton(
    this.label,
    this.links,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.grey[200],
      ),
      width: 150.0,
      height: 180,
      padding: const EdgeInsets.only(
        bottom: 2,
        right: 5,
        left: 5,
      ),
      margin: const EdgeInsets.all(
        7.0,
      ),
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        fit: StackFit.expand,
        //   alignment: AlignmentDirectional.topCenter,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey.withOpacity(.7),
            onPressed: () {},
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            mini: false, //default size
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              foregroundImage: NetworkImage(
                links,
              ),
              radius: 60.0,
            ),
            //heroTag: 'this tag if you have more than one floatin... ',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 105.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                label,
                // maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'times'),
                //  textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
