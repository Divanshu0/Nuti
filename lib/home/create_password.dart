import 'package:flutter/material.dart';
import 'package:food_delivery/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Appcolor/Appcolor.dart';


class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
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
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 21,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Create new Password",style: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                SizedBox(width: MediaQuery.of(context).size.width,
                  child: Text("Your new password is different from previous used passwords.",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.p),
                    maxLines: 2,overflow: TextOverflow.ellipsis,),
                ),
              ],),),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("New Password",style: GoogleFonts.inter(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 8,),
                        TextField(obscureText:true,decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"New Password",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.p),),
                        const SizedBox(
                          height: 26,
                        ),
                        Text("Confirm Password",style: GoogleFonts.inter(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 8,),
                        TextField(obscureText: true,decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintStyle:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.p),hintText:"Confirm Password",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,))),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 5,top: 15,left: 5),
                child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,shadowColor: Colors.black,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),)
                      ,),
                    child: SizedBox(height:60,width:350,child: Center(child: Text("Reset Password",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 20),))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
