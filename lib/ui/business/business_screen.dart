import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:providers/layout/cubit/cubit.dart';
import 'package:providers/layout/cubit/states.dart';
import 'package:providers/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (con, state) => {},
        builder: (context, state) {
          var listItems = NewsCubit.get(context).business;
          return buildArticle(listItems, context);

        });
  }
}
