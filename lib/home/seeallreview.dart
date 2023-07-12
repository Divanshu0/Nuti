import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';

class SeeAllReview extends StatefulWidget {
  const SeeAllReview({Key? key}) : super(key: key);

  @override
  State<SeeAllReview> createState() => _SeeAllReviewState();
}

class _SeeAllReviewState extends State<SeeAllReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textfield,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0,title: Center(child: Text("All Reviews",
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
      body:SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,color: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rating Reviews",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 0,color: Colors.black,
                          child: Container(height: 70,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                            child: Column(
                              children: [
                                const SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/Vector.png",height: 22,fit: BoxFit.fill,),
                                    const SizedBox(width: 8,),
                                    Text("4+",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.p),)
                                  ],),
                                Text("262 reviews",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: AppColor.p),)
                              ],
                            ),
                          ),
                        ),
                      ],),
                    Divider(
                      thickness: 2,
                      color: AppColor.m,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      child: ListView.builder(
                          itemCount : 10,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Awesome Taste",style: GoogleFonts.inter(fontSize: 15,fontWeight:FontWeight.w500,color: Colors.black)),
                                const SizedBox(height: 8,),
                                Text("Spicy blend, adds depth to tea. Aromatic and warming. A must-try for tea lovers seeking a flavor kick.",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black),
                                  maxLines: 4,overflow: TextOverflow.ellipsis,),
                                const SizedBox(height: 8,),
                                Row(children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColor.textfield),
                                    child: Image.asset("assets/a3.png",height: 50,width: 35,),),
                                  const SizedBox(width: 10,),
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColor.textfield),
                                    child: Image.asset("assets/a3.png",height: 50,width: 35,),),
                                ],),
                                const SizedBox(height: 8,),
                                Text("Pallavi Kumari, Delhi Oct, 2022",style: GoogleFonts.inter(fontSize: 10,fontWeight:FontWeight.w500,color: AppColor.p)),
                                Divider(
                                  thickness: 2,
                                  color: AppColor.m,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                const SizedBox(height: 8,),
                              ],);
                          }),
                    ),
                  ],),
                ),
              ),
            ),
          ),
        ],),
      )


    );
  }
}
