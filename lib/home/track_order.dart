 import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';
import 'package:dotted_line/dotted_line.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Track order",
            style: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "(1-Item)",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]),
                                child: Image.asset(
                                  "assets/a3.png",
                                  height: 100,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ImmuneNuti",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text("Green Chili Pickle",
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.p)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Weight: 500gm",
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.p)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Delivered On",
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.buttoncolor)),
                                  Text("Mon, 10 Jan 2023",
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.p)),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height: 30,
                            indent: 10,
                            thickness: 2,
                            endIndent: 10,
                            color: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Track Order",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.buttoncolor),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Image.asset("assets/track.png",height: 24,width: 24,),
                              const SizedBox(width: 5,),
                              Text("Order Placed",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              children: [
                                DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: AppColor.buttoncolor,
                                  dashLength: 7,
                                  lineThickness: 2,
                                  dashGapLength: 5,
                                  lineLength: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: Text("Your order has been placed Order ID #24584",
                                          style: GoogleFonts.inter(
                                              color: AppColor.onemin,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width/5.1,
                                    child: Text("22 Jan 2022 11:00",
                                      style: GoogleFonts.inter(
                                          color: AppColor.onemin,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/track.png",height: 24,width: 24,),
                              const SizedBox(width: 5,),
                              Text("Order Accepted",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              children: [
                                DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: AppColor.buttoncolor,
                                  dashLength: 7,
                                  lineThickness: 2,
                                  dashGapLength: 5,
                                  lineLength: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: Text("Order #24584 from the Nuti",
                                          style: GoogleFonts.inter(
                                              color: AppColor.onemin,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width/5.1,
                                    child: Text("22 Jan 2022 11:00",
                                      style: GoogleFonts.inter(
                                          color: AppColor.onemin,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/track.png",height: 24,width: 24,),
                              const SizedBox(width: 5,),
                              Text("Order Packed",
                                  style: GoogleFonts.inter(
                                      color: Colors.black.withOpacity(0.3),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              children: [
                                DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: AppColor.buttoncolor.withOpacity(0.5),
                                  dashLength: 7,
                                  lineThickness: 2,
                                  dashGapLength: 7,
                                  lineLength: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: Text("Driver has waiting for the payment amount",
                                          style: GoogleFonts.inter(
                                              color: AppColor.onemin.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width/5.1,
                                    child: Text("22 Jan 2022 11:00",
                                      style: GoogleFonts.inter(
                                          color: AppColor.onemin.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/track.png",height: 24,width: 24,),
                              const SizedBox(width: 5,),
                              Text("Order Intransit",
                                  style: GoogleFonts.inter(
                                      color: Colors.black.withOpacity(0.3),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              children: [
                                DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: AppColor.buttoncolor.withOpacity(0.5),
                                  dashLength: 7,
                                  lineThickness: 2,
                                  dashGapLength: 5,
                                  lineLength: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: Text("Driver is ready to pick the customer products",
                                          style: GoogleFonts.inter(
                                              color: AppColor.onemin.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width/5.1,
                                    child: Text("23 Jan 2022 09:00",
                                      style: GoogleFonts.inter(
                                          color: AppColor.onemin.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)),

                              ],
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Image.asset("assets/track.png",height: 24,width: 24,),
                          //     SizedBox(width: 5,),
                          //     Text("Order Intransit",
                          //         style: GoogleFonts.inter(
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 14)),
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 10,top: 8),
                          //       child: Row(
                          //         children: [
                          //           DottedLine(
                          //             direction: Axis.vertical,
                          //             dashColor: AppColor.buttoncolor,
                          //             dashLength: 7,
                          //             lineThickness: 2,
                          //             dashGapLength: 5,
                          //             lineLength: 100,
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.all(8.0),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.start,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 SizedBox(width: MediaQuery.of(context).size.width/2,
                          //                   child: Text("Driver is ready to pick the customer products",
                          //                     style: GoogleFonts.inter(
                          //                         color: AppColor.onemin,
                          //                         fontWeight: FontWeight.w500,
                          //                         fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           Spacer(),
                          //           SizedBox(
                          //               width: MediaQuery.of(context).size.width/5.1,
                          //               child: Text("23 Jan 2022 09:00",
                          //                 style: GoogleFonts.inter(
                          //                     color: AppColor.onemin,
                          //                     fontWeight: FontWeight.w500,
                          //                     fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                          //
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Image.asset("assets/track.png",height: 24,width: 24,),
                              const SizedBox(width: 5,),
                              Text("Order Delivered",
                                  style: GoogleFonts.inter(
                                      color: Colors.black.withOpacity(0.3),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Row(
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width/2,
                                  child: Text("Driver is ready to pick the customer products",style: GoogleFonts.inter(
                                  color: AppColor.onemin.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/5.1,
                                  child: Text("23 Jan 2022 09:00",
                                    style: GoogleFonts.inter(
                                        color: AppColor.onemin.withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the previous button

  /// Returns the header wrapping the header text.

}

