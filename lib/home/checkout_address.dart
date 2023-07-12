import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/saved_address.dart';
import 'package:food_delivery/home/view_cart.dart';

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({Key? key}) : super(key: key);

  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: const Center(child: Text("Checkout",
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Saved_Address()));
          },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[350],shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),)
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Text("Add Address",style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(height: 500,width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Full Name",border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                      ),
                      const SizedBox(height: 10,),
                      TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Mobile No",border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),keyboardType: TextInputType.number,),
                      const SizedBox(height: 10,),
                      TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Address",border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                      const SizedBox(height: 10,),
                      TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Street No",border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),),
                      const SizedBox(height: 10,),
                      TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Locality/ Town",border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              child: TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"City",border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Expanded(
                            child: Container(height: 50,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              child: TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"State",border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),)),
                            ),
                          ),
                        ],),
                      const SizedBox(height: 10,),
                      TextField(decoration: InputDecoration(fillColor: Colors.grey[200],filled: true,hintText:"Pin Code",border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,)),keyboardType: TextInputType.number),
                    ],
                  ),
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewCart()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[800],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),)
                  ,),
                child: const SizedBox(height:60,width:350,child: Center(child: Text("Save Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))),
              ),
            ),
          ],),
      ),);
  }
}
