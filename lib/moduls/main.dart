import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/stateMangement/states.dart';
import '../shared/stateMangement/cubit.dart';
import 'NewsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, States>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) => MaterialApp(
            theme: AppCubit.get(context).light ? AppCubit.get(context).lightTheme : AppCubit.get(context).darkTheme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'News',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                actions: [
                  DayNightSwitcher(
                    isDarkModeEnabled: AppCubit.get(context).light,
                    onStateChanged: AppCubit.get(context).changeTheme,
                  ),
                ],
              ),
              body: NewsScreen(),
            ),
          ),
        ));
  }
}
