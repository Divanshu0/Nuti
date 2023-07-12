 import 'package:flutter/material.dart';
 import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/change_password.dart';
import 'package:food_delivery/home/edit_profile.dart';
import 'package:food_delivery/home/filter/MyOrder.dart';
import 'package:food_delivery/home/saved_address.dart';
import 'package:food_delivery/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
 import 'dart:io';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? imgFile;
  final ImagePicker _picker = ImagePicker();

  bool isLoaded = false;

  // void initState() {
  //   Future.delayed(Duration(milliseconds: 2000),(){
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0, title: const Center(child: Text("My Profile",
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal,color: Colors.black),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Stack(
                          alignment: Alignment.center,
                          children:[
                            Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 0,
                            color: Colors.black,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey[300]),
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Image.asset(
                                  "assets/pro.png",
                                  height: 75,
                                  width: 75,
                                ),
                              ),
                            ),
                          ),
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
                                    padding: const EdgeInsets.only(left: 100,top: 120),
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 5),
                                          color:
                                              AppColor.buttoncolor.withOpacity(0.5),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                  )
                                : Stack(
                                alignment: Alignment.topRight,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: ClipOval(
                                          child: Image.file(
                                            File(imgFile!.path),
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 150,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 120,top: 15),
                                      child: GestureDetector(onTap: (){
                                        setState(() {
                                          imgFile=null;
                                        });
                                      }
                                          ,
                                          child: Container(height: 35,width: 35,
                                              decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(80),color: Colors.white),
                                              child: Icon(Icons.cancel,size: 30,color: AppColor.onemin,))
                                      ),
                                    ),
                                  ]
                                ),
                            ),

                            // Positioned(
                            //     bottom: 0,
                            //     right: 20,
                            //     child: Container(
                            //     height: 40,
                            //     width: 40,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //         border: Border.all(color: Colors.white,width: 5),color: AppColor.buttoncolor.withOpacity(0.5),),
                            //       child: Icon(Icons.camera_alt,color: Colors.white,size: 16,),
                            //   )),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Divanshu Tyagi",
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EditProfile()));
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: "Edit profile",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.editpro)))),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: "/MainFoodPage"),
                      screen: const ChangePassword(),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.textfield),
                      height: 60,
                      width: 365,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Change Password",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: "/MainFoodPage"),
                      screen: const MyOrderList(),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.textfield),
                      height: 60,
                      width: 365,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("My Order",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: "/MainFoodPage"),
                      screen: const Saved_Address(),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.textfield),
                      height: 60,
                      width: 365,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Saved Address",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 6,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.bar),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text("Delete Account",
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Are you sure you want to delete your account?",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.onemin),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Profile()));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 2,
                                      child: Container(
                                        height: 60,
                                        width: 135,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColor.textfield),
                                        child: Center(
                                            child: Text("No",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context,rootNavigator: true).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInPage()));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 2,
                                      child: Container(
                                        height: 60,
                                        width: 135,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColor.textfield),
                                        child: Center(
                                            child: Text("Delete",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,)
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.textfield),
                      height: 60,
                      width: 365,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Delete Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18),
                            ),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 6,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.bar),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Logout",
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Are you sure you want to Logout your account?",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.onemin),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Profile()));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 2,
                                      child: Container(
                                        height: 60,
                                        width: 135,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColor.textfield),
                                        child: Center(
                                            child: Text("No",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context,rootNavigator: true).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const SignInPage()));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 2,
                                      child: Container(
                                        height: 60,
                                        width: 135,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColor.textfield),
                                        child: Center(
                                            child: Text("Logout",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,)
                            ],
                          );
                        });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.black,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.textfield),
                      height: 60,
                      width: 130,
                      child: Center(
                        child: Text("Logout",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  // Shimmer getShimmerLoading(){
  //   return Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 30,),
  //           Center(
  //             child: CircleAvatar(
  //               maxRadius: 80,
  //               foregroundColor: Colors.white,
  //             ),
  //           ),
  //           SizedBox(height: 10,),
  //           Center(
  //             child: Container(height: 50,
  //               width: 150,
  //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
  //             ),
  //           ),
  //           SizedBox(height: 6,),
  //           Center(
  //             child: Container(height: 35,
  //               width: 100,
  //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
  //             ),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 60,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 60,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(
  //             height: 60,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 10,),
  //           Container(height: 60,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           SizedBox(height: 30,),
  //           Center(
  //             child: Container(height: 60,
  //               width: 100,
  //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
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