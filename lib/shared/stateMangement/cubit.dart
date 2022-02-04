import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/./shared/database/DioHelper.dart';
import 'states.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(AppInitStates());

  static AppCubit get(context) => BlocProvider.of(context);

  var index = 0;
  bool light = true;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void changeIndex(int currentIndex) {
    index = currentIndex;
    emit(ChangeNavState());
  }

  void changeTheme(bool currentTheme) {
    light = currentTheme;
    emit(ChangeThemeState());
  }

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: const Color(0xFF212121),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
  );

  getBusiness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]["title"]);
      emit(GetBusinessState());
    }).catchError((error) {
      print('Error ${error.toString()}');
      emit(ErrorBusinessState());
    });
  }

  getSports() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6',
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]["title"]);
      sports.add(value);
      emit(GetSportsState());
    }).catchError((error) {
      print('Error ${error.toString()}');
      emit(ErrorSportsState());
    });
  }

  getScience() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6',
    }).then((value) {
      science = value.data['articles'];
      print(science[0]["title"]);
      science.add(value);
      emit(GetScienceState());
    }).catchError((error) {
      print('Error ${error.toString()}');
      emit(ErrorScienceState());
    });
  }
}
