import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/home/immuneNuti.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Appcolor/Appcolor.dart';

class ReviewFeature extends StatefulWidget {
  const ReviewFeature({Key? key}) : super(key: key);

  @override
  State<ReviewFeature> createState() => _ReviewFeatureState();
}

class _ReviewFeatureState extends State<ReviewFeature> {
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("How would you rate this features?",style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
            const SizedBox(height: 20,),
          Text("Flavor",style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
          const SizedBox(height: 10,),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            glow: false,
            direction: Axis.horizontal,
            unratedColor: AppColor.m,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColor.buttoncolor,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
            Divider(
              thickness: 1,
              color: AppColor.onemin,

            ),
          Text("Value for money",style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
          const SizedBox(height: 10,),
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
            Divider(
              thickness: 1,
              color: AppColor.onemin,

            ),
          Text("Freshness",style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
          const SizedBox(height: 10,),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            glow: false,
            direction: Axis.horizontal,
            unratedColor: AppColor.m,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColor.buttoncolor,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
            const SizedBox(height: 50,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ImmuneNuti(id: '',)));
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,color: AppColor.textfield,
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.buttoncolor,
              ),
              child: Center(
                child: Text("Submit",style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
              ),
            ),
          ),
        ),
        ],),
      ),
    );
  }
}