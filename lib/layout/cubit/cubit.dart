import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providers/layout/cubit/states.dart';
import 'package:providers/network/remote/dio_helper.dart';
import 'package:providers/ui/business/business_screen.dart';
import 'package:providers/ui/science/science_screen.dart';
import 'package:providers/ui/settings/settings_screen.dart';
import 'package:providers/ui/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business_outlined), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label : "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science) , label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings) , label: "Settings"),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> business = [];

  void getBusinessData(){
    emit(NewsLoadingBusiness());
    DioHelper.getData(
      path: "v2/top-headlines",
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccess());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailed(error.toString()));
    });
  }
  void changeBottomNavigationIndex(int index){
    currentIndex = index;
    emit(NewsBottomState());
  }


}