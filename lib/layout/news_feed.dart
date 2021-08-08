import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providers/cubit/cubit.dart';
import 'package:providers/layout/cubit/cubit.dart';
import 'package:providers/layout/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {
          print(state.runtimeType);
        },
        builder: (BuildContext context, Object? state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search),),
                IconButton(onPressed: () {
                  AppCubit.get(context).changeAppThemeMode();
                }, icon: Icon(Icons.brightness_4),),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {

              },
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavigationIndex(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
