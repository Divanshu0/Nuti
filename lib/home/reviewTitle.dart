import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/home/reviewFeatures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../Appcolor/Appcolor.dart';
import 'immuneNuti.dart';

class ReviewTitle extends StatefulWidget {
  const ReviewTitle({Key? key}) : super(key: key);

  @override
  State<ReviewTitle> createState() => _ReviewTitleState();
}

class _ReviewTitleState extends State<ReviewTitle> {

  File? imgFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
              "ImmuneNuti",
              style: GoogleFonts.inter(
                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            )),
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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("How would you rate it?",style: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
              SizedBox(height: 10,),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                glow: false,
                direction: Axis.horizontal,
                unratedColor: AppColor.m,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColor.buttoncolor,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 20,),
              Text("Share a photo",style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
              SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return showAlertDialog(context);
                },
              );
            },


            child: imgFile == null
                ? Padding(
              padding: const EdgeInsets.only(
                  right: 15),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: AppColor.onemin,
                borderPadding: EdgeInsets.all(1),
                radius: Radius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: AppColor.textfield
                  ),
                  child: Icon(Icons.camera_alt,color: AppColor.onemin,size: 50,),
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.only(
                  right: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipOval(
                      child: Image.file(
                        File(imgFile!.path),
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(onTap: (){
                   setState(() {
                    imgFile=null;
                    });
                  }
                    ,
                    child: Text("Clear",style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.address),),
                  )
                ],
              ),
            ),
          ),
              SizedBox(height: 20,),
              GestureDetector(onTap: (){},
                child: Container(height: 50,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.buttoncolor),
                child: Center(
                  child: Text("Submit",style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),),
                ),),
              ),
              SizedBox(height: 20,),
              Text("Title your review",style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    fillColor: AppColor.textfield,
                    filled: true,hintText: "What's most important to know?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 20,),
              Text("Write your review",style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    fillColor: AppColor.textfield,
                    filled: true,hintText: "What did you like or dislike?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 50,),
              Divider(
                thickness: 2,
                color: AppColor.m,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ImmuneNuti(id: '',)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 3,color: Colors.black,
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: Colors.white,border: Border.all(color: AppColor.onemin)),
                        child: Center(
                          child: Text("Submit",style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    return SizedBox(

      width: double.infinity,
      child: AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          elevation: 0.0,
          // title: Center(child: Text("Evaluation our APP")),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //   width:650,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    color: Color(0xffE7E7E7),
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        width: 650,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Center(
                              child: Text(
                                "Take Picture",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff333333)),
                              )),
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () async {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                      child: const SizedBox(

                        width: 650,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Center(
                              child: Text(
                                "Select Picture",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff333333)),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(

                height: 10,
              ),
              InkWell(
                onTap: () => {Navigator.pop(context)},
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Color(0xffE7E7E7),
                      borderRadius: BorderRadius.all(Radius.circular(65.0))),
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                        ),
                      )),
                ),
              )
            ],
          )),
    );
  }

  _getFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }
}
