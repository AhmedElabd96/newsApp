import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providers/cubit/cubit.dart';
import 'package:providers/cubit/states.dart';
import 'package:providers/network/local/shared_preference.dart';
import 'package:providers/network/remote/dio_helper.dart';

import 'layout/news_feed.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> AppCubit()..getAppThemeModeFromShared(),
        child: BlocConsumer<AppCubit , AppStates>(
          listener: (context , state){
            print(state.runtimeType);
          },
          builder: (context , state){
            var appCubit = AppCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primaryColor: Colors.deepOrange,
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 18,
                  ),
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      centerTitle: true,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                        size: 18,
                      ),
                      textTheme: TextTheme(
                          headline6: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          )
                      ),
                      titleTextStyle: TextStyle(
                          color: Colors.black
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      backgroundColor: Colors.white,
                      elevation: 20

                  )
              ),
              darkTheme: ThemeData(
                  primaryColor: Colors.deepOrange,
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.grey.withOpacity(0.8),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 18,
                  ),
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.grey.withOpacity(0.8),
                      elevation: 0.0,
                      centerTitle: true,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                        size: 18,
                      ),
                      textTheme: TextTheme(
                          headline6: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          )
                      ),
                      titleTextStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      backgroundColor: Colors.grey.withOpacity(0.8),
                      elevation: 20

                  )
              ),
              themeMode: appCubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: NewsLayout(),
            );
          },
        ),
    );
  }
}
