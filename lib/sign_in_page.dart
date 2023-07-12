// ignore_for_file: use_build_context_synchronously
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/confirmation_email.dart';
import 'package:food_delivery/home/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/cubit/login_cubit/login_cubit.dart';
import 'Auth/cubit/login_cubit/login_cubit_state.dart';
import 'Utils/showSnackBar.dart';
import 'bootomNavigationBar/bottombar.dart';
import 'messages/messages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
  bool _isObscure2 = true;
  bool isLoading = false;
setToken(String token,String message)async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(
      'token',token);

}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: GestureDetector(onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: AppColor.backgound,
            body: BlocConsumer<LoginCubit, LoginCubitState>(
                listener: (context, state) async {
              if (state is LoginSuccess) {
                setToken(state.loginResponse.accessToken??"",state.loginResponse.message??"");
                showSnackBar(context, state.loginResponse.message??"");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomBar(
                          redirectPageName: 'MainFoodPage',
                        )));
                Loader.hide();
              }
              if (state is LoginError) {
                Loader.hide();
                showSnackBar(context, state.message);
              }
              if (state is LoginLoading) {
                loader(context);
              }
            }, builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/first.png',
                        height: 170,
                        width: 150,
                      ),
                      Text(
                        "Welcome Back",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Login to your existing Nuti Account",
                        style: GoogleFonts.inter(
                            color: AppColor.o,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sign In",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text("Enter your email and password",
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black26)),
                                    const SizedBox(
                                      height: 29,
                                    ),
                                    Text(
                                      "Username",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextField(
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      controller: emailController,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        fillColor: AppColor.textfield,
                                        filled: true,
                                        hintText: "Email id",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Password",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextField(
                                      obscureText: _isObscure2,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      controller: passwordController,
                                      textInputAction: TextInputAction.done,
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
                                          ),
                                          fillColor: AppColor.textfield,
                                          filled: true,
                                          hintText: "Enter your password",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(" "),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ConfirmationEmail()));
                                          },
                                          child: Text("Forgot Password?",
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.black,
                          child: InkWell(
                            onTap: () {
                              if(emailController.text.isEmpty){
                                showSnackBar(context, "Please enter email ID");
                                return;
                              }else if(passwordController.text.isEmpty){
                                showSnackBar(context, "Please enter password");
                                return;
                              } else{
                                if (validateEmail
                                    .hasMatch(emailController.text) ==
                                    false) {
                                    showSnackBar(
                                    context,EmailMessage);
                                } else if (validatePassword
                                    .hasMatch(emailController.text));
                              }
                              BlocProvider.of<LoginCubit>(context).login(
                                  emailController.text.toString(),
                                  passwordController.text.toString());

                              setState(() {
                                isLoading = true;
                              });

                            },
                            child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: AppColor.buttoncolor),
                                child: Center(
                                  child: (state is LoginLoading)?const CircularProgressIndicator(color: Colors.white,): Text(
                                    "Sign In",
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Don't have an account?",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: "Register",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Register()));
                                        },
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColor.buttoncolor)),
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}