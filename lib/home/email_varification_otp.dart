 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_delivery/home/main_food_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../Appcolor/Appcolor.dart';

class Verfiy_OTP extends StatelessWidget {
  File? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: AppColor.backgound,elevation:0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Verify OTP",style: GoogleFonts.inter(fontSize: 26,fontWeight: FontWeight.w600),),
                SizedBox(width: MediaQuery.of(context).size.width,
                  child: Text("In your registered email ID we will send OTP ",style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black45),
                    maxLines: 2,overflow: TextOverflow.ellipsis,),
                ),
              ],),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 22,),
                  Text("Enter your received OTP",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                  const SizedBox(
                    height: 16,
                  ),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(10),
                    disabledBorderColor: AppColor.textfield,
                    enabledBorderColor: AppColor.textfield,
                    fillColor: AppColor.textfield,
                    focusedBorderColor: AppColor.textfield,
                    numberOfFields: 4,
                    borderColor: AppColor.textfield,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                    },
                    onSubmit: (String verificationCode){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Verification Code",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                              content: Text('Code entered is: $verificationCode',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                            );
                          }
                      );
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(text: TextSpan(text: "Don't received code?",style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12),children: [
                          TextSpan(text: "Resend",recognizer: TapGestureRecognizer()..onTap = () {
                          },style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: AppColor.buttoncolor)),
                        ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainFoodPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),)
                  ,),
                child: SizedBox(height:60,width:350,child: Center(child: Text("Submit",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 20),))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}