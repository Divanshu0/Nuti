import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
 import 'package:food_delivery/home/track_order.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: Center(child: Text("Checkout"
        ,style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context);
          },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.textfield,shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),),elevation: 0
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
          Text("Make Payment",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: Colors.black),),
          Text("Enter Debit / Credit Details",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: AppColor.p),),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Card Holder Name",border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none,)),),
                const SizedBox(height: 10,),
                TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Card Number",border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none,)),keyboardType: TextInputType.number,),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Exp. Date",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none,),),keyboardType: TextInputType.number,),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"CVV",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none,),),keyboardType: TextInputType.number,),
                      ),
                    ),
                  ],),
              ],),
            ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text("Your Order(2 items)",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total items",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black)),
                          Text("2 items",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black)),
                        ],),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total MRP",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black)),
                          Text("Rs. 504",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: Colors.black),),
                        ],),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discount MRP",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black)),
                          RichText(text: TextSpan(text: "Rs. 200",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w500,color: AppColor.buttoncolor))),
                        ],),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: Colors.black),),
                          RichText(text: TextSpan(text: "Rs. 304",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: AppColor.buttoncolor))),

                        ],
                      )
                    ],),
                ),),
            ),
            const SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TrackOrder()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),)
                  ,),
                child: SizedBox(height:60,width:340,child: Center(child: Text("Make Payment",style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.white),))),
              ),
            ),
        ],),
      ),
    ),
    );
  }
}
