import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home/profile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Appcolor/Appcolor.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0,title: Center(child: Text("Edit Profile",
        style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Profile()));
          },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.textfield,elevation:0,shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),)
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                    const SizedBox(height: 8,),
                    TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Name",border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                    const SizedBox(
                      height: 28,
                    ),
                    Text("Email id",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                    const SizedBox(height: 8,),
                    TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Email id",border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                    const SizedBox(
                      height: 28,
                    ),
                    Text("Phone no",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                    const SizedBox(height: 8,),
                    TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Phone no",border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),keyboardType: TextInputType.number,),],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 5,shadowColor: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),)
                  ,),
                child: SizedBox(height:60,width:400,child: Center(child: Text("Update Profile",style: GoogleFonts.inter(fontSize:20,fontWeight:FontWeight.w600,color: Colors.white),))),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
