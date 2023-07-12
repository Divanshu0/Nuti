import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/saved_address.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_food_page.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: Center(child: Text("Add New Address",
        style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Saved_Address()));
          },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.textfield,elevation:0,shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),)
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
    body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Text("Add Address",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: Colors.black),),
        ),
          const SizedBox(height: 11,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Full Name",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                  const SizedBox(height: 10,),
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Mobile No",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),keyboardType: TextInputType.number,),
                  const SizedBox(height: 10,),
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Address",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                  const SizedBox(height: 10,),
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Street No",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                  const SizedBox(height: 10,),
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Locality/ Town",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Expanded(
                      child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"City",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Expanded(
                      child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"State",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                      ),
                    ),
                  ],),
                  const SizedBox(height: 10,),
                  TextField(decoration: InputDecoration(fillColor: AppColor.textfield,filled: true,hintText:"Pin Code",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),keyboardType: TextInputType.number),
                ],
              ),
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainFoodPage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),)
                ,),
              child: SizedBox(height:60,width:350,child: Center(child: Text("Add Address",style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.white),))),
            ),
          ),
      ],),
    ),);
  }
}
