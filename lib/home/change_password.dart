import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/profile.dart';
 import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0,title: Center(child: Text("Change Password"
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
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Old Password",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                Container(height: 60,width: 370,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                  child: TextField(
                    obscureText: _isObscure2,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(color: Colors.grey,
                          icon: Icon(
                            _isObscure2
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              if (kDebugMode) {
                                print(_isObscure2);
                              }
                              _isObscure2 = !_isObscure2;
                            });
                          },
                        ),filled: true,fillColor:AppColor.textfield,hintText:"Old Password",border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,))),),
                    const SizedBox(
                      height: 28,
                    ),
                    Text("New Password",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                Container(height: 60,width: 370,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                  child: TextField(
                    obscureText: _isObscure3,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(color: Colors.grey,
                          icon: Icon(
                            _isObscure3
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              print(_isObscure3);
                              _isObscure3 = !_isObscure3;
                            });
                          },
                        ),filled: true,fillColor:AppColor.textfield,hintText:"New Password",border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,))),),
                    const SizedBox(
                      height: 28,
                    ),
                    Text("Confirm Password",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                    Container(height: 60,width: 370,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                    child: TextField(
                      obscureText: _isObscure1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(color: Colors.grey,
                      icon: Icon(
                        _isObscure1
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          print(_isObscure1);
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),fillColor:AppColor.textfield,hintText: "Confirm Password",filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 29,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 0,shadowColor: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),)
                  ,),
                child: SizedBox(height:60,width:MediaQuery.of(context).size.width,child: Center(child: Text("Change Password",style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.white),))),
              ),
            ),
          ),
        ],
      )
    ),
    );
  }
}
