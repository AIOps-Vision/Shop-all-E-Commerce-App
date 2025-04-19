import 'package:flutter/material.dart';
import '../cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../shared/shared_components.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<ChangeCubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) => defaultItem(
                  ChangeCubit.get(context).DoneItem[index], context),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.blueAccent,
              ),
              shrinkWrap: true,
              itemCount: ChangeCubit.get(context).sellerItem.length,
            );
          },
        );
      },
    );
  }
}
