import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';

class TermsandCondition extends StatefulWidget {
  const TermsandCondition({Key? key}) : super(key: key);

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: Center(child: Text("Terms and Conditions",
        style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text("Lorem Ipsum is simply dmmy text of the printing and typesetting industry. Lorem Ipsum has been the induSstry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, It has survived not only five centuries, but also the leap into electronic typesetting,",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500)),
              SizedBox(height: 5,),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, It has survived not only five centuries, but also the leap into electronic typesetting,",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500)),
              SizedBox(height: 5,),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, It has survived not only five centuries, but also the leap into electronic typesetting,",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500)),
            ],),),),
      ),
    );
  }
}
