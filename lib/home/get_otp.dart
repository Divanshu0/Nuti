import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:food_delivery/home/create_password.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Appcolor/Appcolor.dart';
import '../Auth/cubit/forgot_verify__otp/forgotVerifyOtp_cubit.dart';
import '../Auth/cubit/forgot_verify__otp/forgotVerifyOtp_cubit_state.dart';
import '../Utils/showSnackBar.dart';
import 'main_food_page.dart';

class Get_OTP extends StatefulWidget {
  String email = "";

  Get_OTP({Key? key, required this.email}) : super(key: key);

  @override
  State<Get_OTP> createState() => _Get_OTPState();
}

class _Get_OTPState extends State<Get_OTP> {
  final otpController = TextEditingController();

  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgound,
        appBar: AppBar(
          backgroundColor: AppColor.backgound,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/pop.png")),
          ),
        ),
        body: BlocConsumer<ForgotOtpCubit, ForgotOtpState>(
          listener: (context, state) async {
            if(state is ResendOtpSuccess){
              log(state.resendOtpResponse);
            }
            if (state is ForgotOtpSuccess) {
              showSnackBar(context, state.forgotOtpResponse);
              // Loader.hide();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreatePassword()));
            }
            if (state is ForgotOtpError) {
              showSnackBar(context, state.message);
              // Loader.hide();
            }
            if (state is ForgotOtpLoading) {
              // loader(context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(left: 18,right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify OTP",
                    style: GoogleFonts.inter(
                        fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "In your registered email ID we will send OTP ",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        Text(
                          "Enter your received OTP",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PinCodeFields(
                          controller: otpController,
                          onComplete: (output) {
                            print('output');
                          },
                          length: 4,
                          fieldHeight: 55.0,
                          fieldWidth: 30.0,
                          fieldBorderStyle: FieldBorderStyle.square,
                          borderRadius: BorderRadius.circular(25),
                          borderColor: AppColor.textfield,
                          activeBackgroundColor: AppColor.textfield,
                          keyboardType: TextInputType.number,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                          fieldBackgroundColor: AppColor.textfield,
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't received Code?",style: TextStyle(fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 13),),
                            GestureDetector(
                                onTap:(){  BlocProvider.of<ForgotOtpCubit>(
                                    context)
                                    .resendOtp(
                                  widget.email,
                                );},
                                child: Text("Resend",style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: AppColor.buttoncolor
                                ),)),
                                 ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5,
                      child: ElevatedButton(
                        onPressed: () {
                          isInternetConnected().then((value) {
                            if (value == true) {
                              if (otpController.text.isEmpty) {
                                showSnackBar(context, "Please enter an OTP.");
                                return;
                              } else if (otpController.text.length < 4) {
                                showSnackBar(context, " OTP must be 4 digits");
                                return;
                              }
                              print("Validation Done");
                              BlocProvider.of<ForgotOtpCubit>(context).forgotOtp(
                                widget.email,
                                int.parse(otpController.text.toString()),
                              );
                            } else {
                              showNetworkAlert(context);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttoncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: SizedBox(
                            height: 60,
                            width: 350,
                            child: Center(
                                child: Text(
                              "Submit",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
// void StartTimer(){
//   const onsec = Duration(seconds: 1);
//   Timer _timer = Timer.periodic(onsec, (timer) {
//     if(start==0){
//       setState(() {
//         timer.cancel();
//       });
//     }else{
//       setState(() {
//         start--;
//       });
//     }
//   });
// }
}
