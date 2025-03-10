import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/controller/bottom_nav/bottom_nav_bloc.dart';
import 'package:machine_test/controller/home_bloc/product_fetch_bloc.dart';
import 'package:machine_test/view/bottom_nav/bottom_nav.dart';
import 'package:machine_test/view/widgets/custom_navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductFetchBloc>(context).add(FetchDataFromServer());
    BlocProvider.of<BottomNavBloc>(context)
        .add(BottomNavCallEvent(currentIndex: 0));
    Future.delayed(Duration(seconds: 2), () {
      customNavReplacement(context, BottomNavigation());
    });

    return Container(
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
