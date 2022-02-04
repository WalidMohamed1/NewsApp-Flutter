import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../shared/stateMangement/cubit.dart';
import '../shared/stateMangement/states.dart';
import 'BusinessScreeen.dart';
import 'ScienceScreen.dart';
import 'SportsScreeen.dart';

class NewsScreen extends StatelessWidget {

  List screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,States>(
        listener: (BuildContext context,state){},
        builder:(BuildContext context,state) => Scaffold(
          body: screen[AppCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white12,
            currentIndex: AppCubit.get(context).index,
            onTap: AppCubit.get(context).changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

