import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/verification_otp.dart';
import 'package:food_delivery/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Auth/cubit/signup_cubit/signup_cubit.dart';
import '../Auth/cubit/signup_cubit/signup_cubit_state.dart';
import '../Utils/showSnackBar.dart';
import '../messages/messages.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

Future<bool> isInternetConnected() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}

class _RegisterState extends State<Register> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgound,
        body: BlocConsumer<SignUpCubit, SignUpCubitStates>(
            listener: (context, state) async {
              if (state is SignUpSuccess) {
                Loader.hide();
                showSnackBar(context, state.message ?? "");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Verify_OTP(email:emailController.text.toString())));
              }
              if (state is SignUpError) {
                Loader.hide();
                showSnackBar(context, state.message);
              }
              if (state is SignUpLoading) {
                loader(context);
              }
            },
            builder: (context, state) {
          return SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: SingleChildScrollView(
              child: Wrap(
                // crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/first.png',
                        height: 130,
                        width: 150,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Please enter the details for register.",
                      style: GoogleFonts.inter(
                          color: AppColor.p,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                      shadowColor: Colors.black,
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign up",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Fill the details.",
                                style: GoogleFonts.inter(
                                    color: AppColor.p,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "First Name",
                                        style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                          controller: firstNameController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-z]")),
                                          ],
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              fillColor: AppColor.textfield,
                                              filled: true,
                                              hintStyle: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.p),
                                              hintText: "First Name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                borderSide: BorderSide.none,
                                              )),
                                          style: GoogleFonts.poppins(
                                              color: AppColor.p,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last Name",
                                        style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                          controller: lastNameController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                13),
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-z]")),
                                          ],
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              fillColor: AppColor.textfield,
                                              filled: true,
                                              hintStyle: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.p),
                                              hintText: "Last Name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                borderSide: BorderSide.none,
                                              )),
                                          style: GoogleFonts.poppins(
                                              color: AppColor.p,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Email Address",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    fillColor: AppColor.textfield,
                                    filled: true,
                                    hintStyle: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.p),
                                    hintText: "Enter email address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    )),
                                style: GoogleFonts.poppins(
                                    color: AppColor.p,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "Mobile No.",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: mobileNoController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]+$')),
                                ],
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    fillColor: AppColor.textfield,
                                    filled: true,
                                    hintStyle: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.p),
                                    hintText: "Mobile No.",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    )),
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.poppins(
                                    color: AppColor.p,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: passwordController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(50),
                                ],
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                decoration: InputDecoration(
                                    fillColor: AppColor.textfield,
                                    filled: true,
                                    hintStyle: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.p),
                                    hintText: "Enter your password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    )),
                                style: GoogleFonts.poppins(
                                    color: AppColor.p,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "Confirm Password",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: confirmPasswordController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(50),
                                ],
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                decoration: InputDecoration(
                                    fillColor: AppColor.textfield,
                                    filled: true,
                                    hintStyle: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.p),
                                    hintText: "Confirm password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    )),
                                style: GoogleFonts.poppins(
                                    color: AppColor.p,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (firstNameController.text.isEmpty) {
                        showSnackBar(context, "Please enter Firstname");
                        return;
                      } else if (lastNameController.text.isEmpty) {
                        showSnackBar(context, "Please enter Lastname");
                        return;
                      } else if (emailController.text.isEmpty) {
                        showSnackBar(context, "Please enter Email");
                        return;
                      } else if (mobileNoController.text.isEmpty) {
                        showSnackBar(context, "Please enter Mobile no.");
                        return;
                      } else if (passwordController.text.isEmpty) {
                        showSnackBar(context, "Please enter Password");
                        return;
                      } else if (confirmPasswordController.text.isEmpty) {
                        showSnackBar(context, "Please enter Confirm Password");
                        return;
                      }
                      else {
                        if (validationName.hasMatch(firstNameController.text) ==
                            false) {
                          showSnackBar(
                              context,fonlycharvalidation);
                        }
                          else if (validationName.hasMatch(lastNameController.text) ==
                            false) {
                          showSnackBar(
                              context,lonlycharvalidation);
                        }
                          else if (validateEmail
                              .hasMatch(emailController.text) ==
                          false) {
                          showSnackBar(
                          context,EmailMessage);}
                        else if (mobileNoController.text.length < 6 ||
                            mobileNoController.text.length >= 15) {
                          showSnackBar(
                              context, phoneMessage);
                        } else if (validatePassword
                                .hasMatch(passwordController.text) ==
                            false) {
                          showSnackBar(
                              context,passwordMessage);
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                  title: Text(mainconfirmpasswordValidation)));
                        }
                        BlocProvider.of<SignUpCubit>(context).register(
                            firstNameController.text.toString(),
                            lastNameController.text.toString(),
                            int.parse(mobileNoController.text.toString()),
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            confirmPasswordController.text.toString());

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.buttoncolor),
                              child: Center(
                                  child: (state is SignUpLoading)
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Register",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ))),
                        ),
                      );
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Already have an account?",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: "Sign in",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignInPage()));
                                          },
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColor.buttoncolor)),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    }}
                  ),
                ],
              )));
        }));
  }
}