import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providers/cubit/states.dart';
import 'package:providers/network/local/shared_preference.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void getAppThemeModeFromShared(){
    bool? appIsDark = CacheHelper.getBoolData('isDark');
    isDark = appIsDark ?? false;
  }
  void changeAppThemeMode(){
    print("ChangeAppThemeMode");
    isDark = !isDark;
    CacheHelper.putBoolData('isDark', isDark).then((value){
      emit(AppThemeMode());
    });

  }
}