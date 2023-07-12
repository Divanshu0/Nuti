import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Auth/cubit/ViewAll/viewAll_cubit.dart';
import 'package:food_delivery/Auth/cubit/forgot_verify__otp/forgotVerifyOtp_cubit.dart';
import 'package:food_delivery/Auth/cubit/mainfoodpage_cubit/mainfoodpage_cubit.dart';
import 'package:food_delivery/Auth/cubit/signup_cubit/signup_cubit.dart';
import 'package:food_delivery/home/add_new_address.dart';
import 'package:food_delivery/home/categories_address.dart';
import 'package:food_delivery/home/change_password.dart';
import 'package:food_delivery/home/checkout.dart';
import 'package:food_delivery/home/checkout_address.dart';
import 'package:food_delivery/home/coupons.dart';
import 'package:food_delivery/home/edit.dart';
import 'package:food_delivery/home/edit_profile.dart';
import 'package:food_delivery/home/filter.dart';
import 'package:food_delivery/home/filter/blog.dart';
import 'package:food_delivery/home/filter/imminitiFilter.dart';
import 'package:food_delivery/home/filter/nutiFilter.dart';
import 'package:food_delivery/home/first_page.dart';
import 'package:food_delivery/home/immuneNuti.dart';
import 'package:food_delivery/home/main_food_page.dart';
import 'package:food_delivery/home/confirmation_email.dart';
import 'package:food_delivery/home/notification_bell.dart';
import 'package:food_delivery/home/nuti_categories.dart';
import 'package:food_delivery/home/saved_address.dart';
import 'package:food_delivery/home/search.dart';
import 'package:food_delivery/home/track_order.dart';
import 'package:food_delivery/home/viewall.dart';
import 'package:food_delivery/home/view_cart.dart';
import 'package:food_delivery/repository/post_repo.dart';
import 'package:food_delivery/repository/repo2.dart';
import 'package:food_delivery/sign_in_page.dart';
import 'Auth/cubit/Best_Selling_Products/products1_cubit/products1_cubit.dart';
import 'Auth/cubit/categories_cubit/cat_Immuniti_cubit.dart';
import 'Auth/cubit/categories_cubit/cat_Nuti_cubit.dart';
import 'Auth/cubit/conf_email_cubit/conf_email_cubit.dart';
import 'Auth/cubit/login_cubit/login_cubit.dart';
 import 'Auth/cubit/verificationOtp/verificationOtp_cubit.dart';
import 'bootomNavigationBar/bottombar.dart';
import 'home/categories.dart';
import 'home/payment.dart';
import 'home/seeallreview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final repository = Post_Repo();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(repository),
        ),BlocProvider(
          create: (context) => ForgetPasswordCubits(repository),
        ),BlocProvider(
          create: (context) => SignUpCubit(repository),
        ),BlocProvider(
          create: (context) => VerifyOtpCubit(repository),
        ),
        BlocProvider(
          create: (context) => ForgotOtpCubit(repository),
        ),
        BlocProvider(
          create: (context) => Product1Cubit(repository),
        ),BlocProvider(
          create: (context) => MainFoodPageCubit(Repository()),
        ),
        BlocProvider(
          create: (context) => NutiCategoryCubit(Repository()),
        ),
        BlocProvider(
          create: (context) => ImmuntiCategoryCubit(Repository()),
        ),
        BlocProvider(
          create: (context) => ViewAllCubit(Repository()),
        ),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "first_page",
          routes: {
            "bottombar":(context) => const BottomBar(redirectPageName: '',),
             "sign_in_page": (context) => const SignInPage(),
            "confirmation_email":(context) => const ConfirmationEmail(),
            "main_food_page": (context) => const MainFoodPage(),
            "search":(context) =>  const Search(),
            "filter": (context) => const Filter(),
            "immuneNuti": (context) => const ImmuneNuti(id: '',),
            "viewall": (context) => const ViewAll(),
            "wishlist": (context) => const ViewCart(),
            "change_password": (context) => const ChangePassword(),
            "edit_profile": (context) => const EditProfile(),
            "saved_address": (context) => const Saved_Address(),
            "add_new_address": (context) => const AddNewAddress(),
            "edit": (context) => const Edit(),
            "coupons": (context) => const Coupons(),
            "notifications": (context) => const NotificationBell(),
            "categories": (context) => const Categories(),
            "checkout": (context) => const Checkout(),
            "checkout_address": (context) => const CheckoutAddress(),
            "payment": (context) => const Payment(),
            "categories_address": (context) => const CategoriesAddress(),
            "track_order": (context) => const TrackOrder(),
            "nuti_categories": (context) => const NutiCategories(),
            "nutiFilter" : (context) => const NutiFilter(),
            "immunitiFilter" : (context) => const ImmunitiFilter(),
            "seeallreview" : (context) => const SeeAllReview(),
            "blog" : (context) => const Blog(),
          },
          home: const Firstpage(
          ),
      ),
    );
  }
}


