import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Discover products",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(Icons.store_mall_directory_outlined),
            SizedBox(
              width: 15,
            )
          ],
        ),
        SizedBox(
            height: 50,
            child: TabBar(
                indicatorColor: Color.fromARGB(255, 0, 0, 0),
                labelColor: Color.fromARGB(255, 0, 0, 0),
                isScrollable: true,
                tabs: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child:
                          Text('Mens', style: GoogleFonts.inter(fontSize: 18))),
                  Text('Womens', style: GoogleFonts.inter(fontSize: 18)),
                  Text('Kids', style: GoogleFonts.inter(fontSize: 18)),
                ])),
      ],
    );
  }
}
