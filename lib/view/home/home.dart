import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/view/home/widgets/grid_view.dart';
import 'package:machine_test/view/home/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          )
        ],
        leading: Icon(Icons.menu),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 15),
          child: Column(
            children: [TopScreen(), GridViewBuilder()],
          ),
        ),
      ),
    );
  }
}
