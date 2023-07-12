 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';

class Coupons extends StatefulWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Center(child: Text("Apply Coupons",
        style: GoogleFonts.inter(fontSize: 22,fontWeight:FontWeight.w500,color: Colors.black),)),elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
    );
  }
}
