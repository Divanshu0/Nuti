 import 'package:flutter/material.dart';
import 'package:food_delivery/home/edit.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../Appcolor/Appcolor.dart';
import 'add_new_address.dart';

class Saved_Address extends StatefulWidget {
  const Saved_Address({Key? key}) : super(key: key);

  @override
  State<Saved_Address> createState() => _Saved_AddressState();
}
bool isAdmin = true;
int value = 0;

class _Saved_AddressState extends State<Saved_Address> {

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0,title: Center(child: Text("My Address"
          ,style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Add Address",style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),),
        ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,// outer ListView
              itemCount: 4,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      value=index;
                                      setState(() {
                                        print(isAdmin);
                                        isAdmin = false;
                                      });
                                    },
                                    icon: Icon(
                                      value==index?Icons.radio_button_on:Icons.radio_button_off,
                                      color:AppColor.buttoncolor,
                                    )),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rohit Kumar",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)),
                                    const SizedBox(height: 15,),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width/1.9,
                                        child: Text("Address: G-18 Noida Sector 63 Gautam Buddha Nagar Uttar Pradesh 201301",
                                          style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.black),maxLines: 3,overflow: TextOverflow.ellipsis,)),
                                    const SizedBox(height: 10,),
                                    Text("Mobile No. +91-123456789",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.black)),
                                  ],
                                ),
                                Column(children: [
                                  Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    elevation: 0,
                                    child: GestureDetector(onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Edit()));
                                    },
                                      child: Container(height: 50,width: 90,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                                        child: Center(child: Text("Edit",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.onemin),)),),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    elevation: 0,
                                    child: Container(height: 50,width: 90,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                                      child: Center(child: Text("Delete",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.onemin),)),),
                                  ),

                                ],)
                              ],
                            ),
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
        const SizedBox(height: 28,),
        Center(child: GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewAddress()));
        },
            child: Text("Add New Address",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: AppColor.address),))),
          const SizedBox(height: 20,),
      ],)
    ),
    );
  }
  Shimmer getShimmerLoading(){
    return Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
            const SizedBox(height: 10,),
            Container(height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
