import 'package:flutter/material.dart';
import 'package:shope_all/cubit/cubit.dart';
import 'package:shope_all/cubit/states.dart';
import '../shared/shared_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerList extends StatelessWidget {
  String selec;
  SellerList({Key? key, required this.selec}) : super(key: key);

  //SellerList({super.key, required this.selec});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeCubit()..createDatabase(),
      child: BlocConsumer<ChangeCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = ChangeCubit.get(context).sellerItem;
          var selected = 'Here you can add new ${selec} items for selling.';
          return sellerItemsBuilder(tasks: tasks, choose: selected);
        },
      ),
    );
  }
}
