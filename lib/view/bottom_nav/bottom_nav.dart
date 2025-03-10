// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/controller/bottom_nav/bottom_nav_bloc.dart';
import 'package:machine_test/view/home/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  List screens = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];
  String? image;
  String? name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: SalomonBottomBar(
              unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              margin: EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
              curve: Curves.decelerate,
              currentIndex: state.emittingIndex,
              onTap: (index) {
                BlocProvider.of<BottomNavBloc>(context)
                    .add(BottomNavCallEvent(currentIndex: index));
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home_rounded),
                  title: Text("Home"),
                  selectedColor: const Color.fromARGB(255, 218, 5, 255),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.explore_outlined),
                  title: Text("Explore"),
                  selectedColor: Colors.pink,
                ),
                SalomonBottomBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'Profile',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  selectedColor: Colors.teal,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.flash_on_rounded),
                  title: Text("Alert"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
              ],
            ),
            body: screens.elementAt(state.emittingIndex));
      },
    );
  }
}
