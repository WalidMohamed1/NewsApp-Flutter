import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/component/News.dart';
import '../shared/database/DioHelper.dart';
import '../shared/stateMangement/cubit.dart';
import '../shared/stateMangement/states.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DioHelper.init();

    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit,States>(
        listener: (BuildContext context,state){},
        builder: (BuildContext context,state) {
          var list =AppCubit.get(context).business;
          return Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return buildNews(list[index],context);
                },
                itemCount: list.length,
                padding: EdgeInsets.all(0.0),
              )
          );
        }
      ),
    );
  }
}
