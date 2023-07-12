import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Auth/cubit/mainfoodpage_cubit/mainfoodpage_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../Appcolor/Appcolor.dart';
import '../Auth/cubit/categories_cubit/cat_Nuti_cubit.dart';
import '../home/categories.dart';
import '../home/main_food_page.dart';
import '../home/my_order.dart';
import '../home/profile.dart';

class BottomBar extends StatefulWidget {
  final String redirectPageName;

  const BottomBar({Key? key, required this.redirectPageName});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

int index = 0;

class _BottomBarState extends State<BottomBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainFoodPageCubit>(context).mainScreen();
    BlocProvider.of<NutiCategoryCubit>(context).nutiScreen();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
    if (widget.redirectPageName == "MainFoodPage") {
      _controller = PersistentTabController(initialIndex: 0);
    } else if (widget.redirectPageName == "Categories") {
      _controller = PersistentTabController(initialIndex: 1);
    } else if (widget.redirectPageName == "MyOrder") {
      _controller = PersistentTabController(initialIndex: 2);
    } else if (widget.redirectPageName == "Profile") {
      _controller = PersistentTabController(initialIndex: 3);
    }
  }

  List<Widget> _buildScreens() {
    return [
      const MainFoodPage(),
      const Categories(),
      const MyOrder(),
      const Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/home.png",
              height: 21.51,
              width: 20.5,
            ),
            Text(
              "Home",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            // Container(height: 8,width: 49,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black),),
          ],
        ),
        activeColorPrimary: Colors.black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/MainFoodPage': (context) => const MainFoodPage(),
            '/Categories': (context) => const Categories(),
            '/MyOrder ': (context) => const MyOrder(),
            'Profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/cat.png",
              height: 21.51,
              width: 20.5,
            ),
            Text(
              "Categories",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        activeColorPrimary: Colors.black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/MainFoodPage': (context) => const MainFoodPage(),
            '/Categories': (context) => const Categories(),
            '/MyOrder ': (context) => const MyOrder(),
            'Profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/boxes.png",
              height: 21.51,
              width: 20.5,
            ),
            Text(
              "My Order",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        activeColorPrimary: Colors.black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/MainFoodPage': (context) => const MainFoodPage(),
            '/Categories': (context) => const Categories(),
            '/MyOrder ': (context) => const MyOrder(),
            'Profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/prof.png",
              height: 21.51,
              width: 20.5,
            ),
            Text(
              "Profile",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        activeColorPrimary: Colors.black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/MainFoodPage': (context) => const MainFoodPage(),
            '/Categories': (context) => const Categories(),
            '/MyOrder ': (context) => const MyOrder(),
            'Profile': (context) => const Profile(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColor.buttoncolor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin:
            const EdgeInsets.only(left: 25.0, right: 25, bottom: 15, top: 10),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: kBottomNavigationBarHeight,
        onWillPop: (context) async {
          showAlertDialog(context!);
          return false;
        },
        onItemSelected: (index) {
          log("$index+===========>");

          if(index==0){
            BlocProvider.of<MainFoodPageCubit>(context).mainScreen();

          }
          //BlocProvider.of<DashboardCubit>(context).getBanner(widget.latitude,widget.longitude);
        },
        selectedTabScreenContext: (context) {},
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style14,
        // Choose the nav bar style with this property
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Exit",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        SystemNavigator.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Nuti",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      content: const Text("Do you want to exit?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
