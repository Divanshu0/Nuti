import 'package:flutter/material.dart';
import 'package:food_delivery/home/track_order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../Appcolor/Appcolor.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 135,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
            child: Row(
              children: [ 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 103,
                    decoration: BoxDecoration(color: AppColor.textfield,borderRadius: BorderRadius.circular(20)),
                    child: Image.asset("assets/a3.png"),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ImmuneNuti",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                    const SizedBox(height: 5,),
                    Text("Green Chili Pickle",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.p),),
                    const SizedBox(height: 10,),
                    Text("Weight: 500gm",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.p),),
                    const SizedBox(height: 24,),
                    Text("Delivered On",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.buttoncolor),),
                    const SizedBox(height: 5,),
                    Text("Mon, 10 Jan 2023",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.p),)
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackOrder()));
                      },
                      child: Image.asset("assets/b.png",))
                ),
              ],
            ),
          ),
        );
      })
    );
  }
  // Shimmer getShimmerLoading(){
  //   return Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(height: 60,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
