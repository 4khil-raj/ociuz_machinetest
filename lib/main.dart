import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/controller/bottom_nav/bottom_nav_bloc.dart';
import 'package:machine_test/controller/home_bloc/product_fetch_bloc.dart';
import 'package:machine_test/view/bottom_nav/bottom_nav.dart';
import 'package:machine_test/view/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => ProductFetchBloc(),
        ),
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
