 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:food_delivery/home/get_otp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Appcolor/Appcolor.dart';
import '../Auth/cubit/conf_email_cubit/conf_email_cubit.dart';
import '../Auth/cubit/conf_email_cubit/conf_email_state.dart';
import '../Utils/showSnackBar.dart';
 import 'main_food_page.dart';

class ConfirmationEmail extends StatefulWidget {
  const ConfirmationEmail({Key? key}) : super(key: key);

  @override
  State<ConfirmationEmail> createState() => _ConfirmationEmailState();
}

class _ConfirmationEmailState extends State<ConfirmationEmail> {

  final emailController = TextEditingController();

  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: AppColor.backgound,elevation:0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
      body: BlocConsumer<ForgetPasswordCubits, ForgotPassword_Cubit_State>(
          listener: (context, state) async {
        if (state is ForgotSuccessState) {
          Loader.hide();
          showSnackBar(context, state.forgetResponse.message ?? '');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Get_OTP(email: emailController.text,)));
        }
        if (state is ForgotError) {
          Loader.hide();
          showSnackBar(context, state.message);
        }
        if (state is ForgotLoadingState) {
          loader(context);
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                "Confirmation Email",
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                "Enter your register mail ID ",
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.o),
              ),
              const SizedBox(
                height: 22,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text(
                          "Enter your Email ID",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              fillColor: AppColor.textfield,
                              filled: true,
                              hintText: "Email id",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 5,
                shadowColor: Colors.black,
                child: ElevatedButton(
                  onPressed: () {
                    isInternetConnected().then((value) {
                      if (value == true) {
                        if (emailController.text.isEmpty) {
                          showSnackBar(context, "Please enter Email ID");
                          return;
                        } else if(!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController.text.toString())) {
                          showSnackBar(context, "Please enter valid Email ID");
                          return;
                        } else {}
                        BlocProvider.of<ForgetPasswordCubits>(context)
                            .forgetPassword(emailController.text.toString());
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
                      width: 380,
                      child: Center(
                          child: (state is ForgotLoadingState)?const CircularProgressIndicator(color: Colors.white,): const Text(
                        "Get OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ))),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

