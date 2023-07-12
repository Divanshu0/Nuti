import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/TnC.dart';
import 'package:food_delivery/home/change_password.dart';
import 'package:food_delivery/home/edit_profile.dart';
import 'package:food_delivery/home/immuneNuti.dart';
import 'package:food_delivery/home/notification_bell.dart';
import 'package:food_delivery/home/policy.dart';
import 'package:food_delivery/home/profile.dart';
 import 'package:food_delivery/home/search.dart';
import 'package:food_delivery/home/track_order.dart';
import 'package:food_delivery/home/view_cart.dart';
import 'package:food_delivery/home/viewall.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery/home/wish_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../Auth/cubit/mainfoodpage_cubit/mainfoodpage_cubit.dart';
import '../Auth/cubit/mainfoodpage_cubit/mainfoodpage_state.dart';
import '../repository/repo2.dart';
import '../sign_in_page.dart';
import 'filter/imminitiFilter.dart';
import 'filter/nutiFilter.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

int index = 0;
 class _MainFoodPageState extends State<MainFoodPage>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  int value = 0;
  int current = 0;
  List imageList = [
    {"id": 1, "image_path": "assets/listview.png"},
    {"id": 2, "image_path": "assets/listview.png"},
    {"id": 3, "image_path": "assets/listview.png"},
    {"id": 4, "image_path": "assets/listview.png"},
    {"id": 5, "image_path": "assets/listview.png"},
    {"id": 6, "image_path": "assets/listview.png"},
  ];
  final CarouselController carouselController = CarouselController();
  int selected = 0;

  Widget customRadio(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 7, right: 8, bottom: 8),
        child: Container(
            height: 60,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    (selected == index) ? AppColor.buttoncolor : Colors.white,
                border: Border.all(color: Colors.grey)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: (selected == index) ? Colors.white : Colors.grey,
              ),
            ))),
      ),
    );
  }

   late PageController _pageController;
  int activePageIndex = 0;
hello()async{
  log("hello");
  Repository repo =Repository();
  final response =await repo.nutiCategoryrequest();
  log(jsonEncode(response));

}


  @override
  void initState() {
    super.initState();
    hello();
    _pageController = PageController();
  }

  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  List<int> selectedItem = [];

  bool isLoaded = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusScope.of(context).unfocus(),
      child: GestureDetector(
        onTap:()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: Colors.white,
            drawer: SafeArea(
              child: Drawer(
                shadowColor: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColor.profile),
                              child: Image.asset(
                                "assets/profile.png",
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Divanshu Tyagi",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const EditProfile()));
                                    },
                                    child: RichText(
                                        text: TextSpan(
                                            text: "Edit profile",
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.editpro)))),
                                const SizedBox(
                                  width: 10,
                                ),
                                // IconButton(onPressed: (){
                                //   setState(() {
                                //     _iconBool = !_iconBool;
                                //   });
                                // }, icon: Icon(_iconBool? _iconDark : _iconLight))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: AppColor.buttoncolor,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "User Profile",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(name: "/MainFoodPage"),
                            screen: const WishList(),
                            withNavBar: false,
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "WishList",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Change Password",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TrackOrder()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Track Order",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(name: "/MainFoodPage"),
                            screen: const Policy(),
                            withNavBar: false,
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Privacy Policy",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(name: "/MainFoodPage"),
                            screen: const TermsandCondition(),
                            withNavBar: false,
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Terms and Conditions",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.p),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 225,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: GestureDetector(
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Profile()));
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
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color: Colors.black))),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context,
                                                  rootNavigator: true)
                                                  .push(MaterialPageRoute(
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
                                                    child: Text("Logout",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color: Colors.black))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text("Logout",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.p)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: AppColor.buttoncolor,
              elevation: 0,
              actions: [
                GestureDetector(
                    onTap: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: "/MainFoodPage"),
                        screen: const WishList(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Image.asset(
                      "assets/heart.png",
                      height: 34,
                      width: 34,
                    )),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                    onTap: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: "/MainFoodPage"),
                        screen: const ViewCart(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Image.asset(
                      "assets/bag.png",
                      height: 34,
                      width: 34,
                    )),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                    onTap: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: "/MainFoodPage"),
                        screen: const NotificationBell(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Image.asset(
                      "assets/bell.png",
                      height: 34,
                      width: 34,
                    )),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            body: BlocConsumer<MainFoodPageCubit, MainFoodPageState>(listener: (context, state) {
              if (state is MainSuccess) {
                Loader.hide();
                print("tyagi");
                log(jsonEncode(state.mainfoodpageResponse));
              }
            }, builder: (context, state) {
              if (state is MainSuccess) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  print(currentIndex);
                                },
                                child: Center(
                                  child: CarouselSlider(
                                    items: state.mainfoodpageResponse.bannerImg!
                                        .map((item) => Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28)),
                                              child: Container(
                                                height: 400,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                    image: DecorationImage(
                                                        image: NetworkImage(item.image??"",),
                                                        fit: BoxFit.fill),
                                                    color: Colors.white),
                                              ),
                                            ))
                                        .toList(),
                                    carouselController: carouselController,
                                    options: CarouselOptions(
                                        scrollPhysics:
                                            const BouncingScrollPhysics(),
                                        autoPlay: true,
                                        aspectRatio: 2,
                                        viewportFraction: 2,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var i = 0; i < 2; i++)
                                    buildIndicator(currentIndex == i)
                                ],
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColor.border),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Search()));
                                        },
                                        child: Image.asset(
                                          "assets/search.png",
                                          height: 21,
                                          width: 21,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.72,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: TextField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-z]")),
                                          ],
                                          focusNode: FocusNode(
                                              skipTraversal: false,
                                              descendantsAreTraversable: false),
                                          style:
                                              GoogleFonts.inter(fontSize: 20),
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: "Search",
                                              hintStyle: GoogleFonts.inter(
                                                  color: Colors.grey,
                                                  fontSize: 20)),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          25))),
                                              builder: (context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20)),
                                                      color:
                                                          AppColor.backgound),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              height: 60,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration: const BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20)),
                                                                  color: Colors
                                                                      .white),
                                                              child: Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Container(
                                                                    height: 6,
                                                                    width: 60,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color: AppColor
                                                                            .bar),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Filter",
                                                                    style: GoogleFonts.inter(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2.35,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            5.0),
                                                                    child: _menuBar(
                                                                        context),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        PageView(
                                                                      controller:
                                                                          _pageController,
                                                                      physics:
                                                                          const ClampingScrollPhysics(),
                                                                      onPageChanged:
                                                                          (int
                                                                              i) {
                                                                        FocusScope.of(context)
                                                                            .requestFocus(FocusNode());
                                                                        setState(
                                                                            () {
                                                                          activePageIndex =
                                                                              i;
                                                                        });
                                                                      },
                                                                      children: const <
                                                                          Widget>[
                                                                        NutiFilter(),
                                                                        ImmunitiFilter(),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Image.asset(
                                          "assets/filter.png",
                                          height: 39,
                                          width: 61,
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                "Immune Nuti",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      // outer ListView
                                      itemCount: state.mainfoodpageResponse
                                          .shopByConcern!.length,
                                      itemBuilder: (_, index) {
                                        return Column(
                                          children: [
                                            Column(
                                              children: [
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                                  elevation: 0,
                                                  child: Container(
                                                      height: 200,
                                                      width: 185,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(20),
                                                          color:
                                                          AppColor.btncolor,),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 134,
                                                            width: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .width,
                                                            decoration:  BoxDecoration(
                                                                borderRadius: const BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                        20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        20)),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(state.mainfoodpageResponse.shopByIng?[index].image?? ""),
                                                                    fit: BoxFit.fill),
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
                                                                        state
                                                                            .mainfoodpageResponse
                                                                            .shopByConcern?[
                                                                        index]
                                                                            .name ??
                                                                            "",
                                                                        style: GoogleFonts.inter(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                            fontSize: 12),
                                                                        maxLines: 2,
                                                                        overflow:
                                                                        TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .all(8.0),
                                                                      child: Container(
                                                                          height: 30,
                                                                          width: 65,
                                                                          decoration: BoxDecoration(
                                                                              color: AppColor
                                                                                  .buttoncolor,
                                                                              borderRadius:
                                                                              BorderRadius
                                                                                  .circular(
                                                                                  10)),
                                                                          child:
                                                                          const Center(
                                                                              child:
                                                                              Text(
                                                                                "Shop now",
                                                                                style: TextStyle(
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .w600,
                                                                                    fontSize:
                                                                                    11,
                                                                                    color: Colors
                                                                                        .white),
                                                                              ))),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Best Selling Products",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewAll()));
                                      },
                                      child: Text("View all",
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )))
                                ],
                              ),
                              MasonryGridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  itemCount: state
                                      .mainfoodpageResponse.products!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                pushNewScreenWithRouteSettings(
                                                  context,
                                                  settings: const RouteSettings(
                                                      name: "/MainFoodPage"),
                                                  screen:  ImmuneNuti(id:state
                                                      .mainfoodpageResponse.products?[index].id.toString()??"" ,),
                                                  withNavBar: false,
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                elevation: 0,
                                                child: Container(
                                                    height: 228,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            AppColor.textfield,
                                                        border: Border.all(
                                                            color: AppColor
                                                                .textfield)),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            height: 134,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.3,
                                                            decoration:  BoxDecoration(
                                                                borderRadius: const BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20)),
                                                                image: DecorationImage(
                                                                        image: NetworkImage(state.mainfoodpageResponse.products?[index].image?? ""),
                                                                        fit: BoxFit.fill),
                                                                color: Colors
                                                                    .white),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                state
                                                                        .mainfoodpageResponse
                                                                        .products?[
                                                                            index]
                                                                        .name ??
                                                                    "",
                                                                style: GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Text(
                                                                state.mainfoodpageResponse.products?[index].concern?? "",
                                                                style: GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        AppColor
                                                                            .o),
                                                              ),
                                                              const SizedBox(
                                                                height: 13,
                                                              ),
                                                              Row(
                                                                children: [
                                                                   Text(
                                                                     state.mainfoodpageResponse.products?[index].price.toString()?? "",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    state.mainfoodpageResponse.products?[index].oldPrice.toString()?? "",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            9,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .lineThrough,
                                                                        color: AppColor
                                                                            .cuttext),
                                                                  ),
                                                                  const Spacer(),
                                                                  Container(
                                                                      height:
                                                                          32,
                                                                      width: 76,
                                                                      decoration: BoxDecoration(
                                                                          color: AppColor
                                                                              .buttoncolor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child: const Center(
                                                                          child: Text(
                                                                        "Buy now",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.white),
                                                                      ))),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                              const SizedBox(height: 20,),
                              Text("Shop by Concern",
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  // outer ListView
                                  itemCount: state.mainfoodpageResponse
                                      .shopByConcern!.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          elevation: 0,
                                          child: Container(
                                            height: 200,
                                            width: 315,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    25),
                                                image:  DecorationImage(
                                                    image: NetworkImage(state.mainfoodpageResponse.shopByConcern?[index].images?? ""),
                                                    fit: BoxFit.fill)),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Shop by Ingredient",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const Spacer(),
                                  Text("View All",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              Container(
                                height: 330,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColor.d,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MasonryGridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    itemCount: state
                                        .mainfoodpageResponse.shopByIng!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                elevation: 0,
                                                child: Container(
                                                  height: 140,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.3,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: AppColor.border,
                                                      image:  DecorationImage(
                                                          image: NetworkImage(state.mainfoodpageResponse.shopByIng?[index].image?? ""),
                                                          fit: BoxFit.fill)),
                                                  // child: Image.asset("assets/a5.png",fit: BoxFit.fill,)
                                                )),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              const SizedBox(height: 20,),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 5,
                                child: Container(
                                  height: 140,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage("assets/listview.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text("Shop by Ingrident",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text("View all",
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ))),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColor.d,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 250,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Image.asset(
                                          "assets/a10.png",
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "We use high quality and ",
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Certified Nuti Aachar",
                                            style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.buttoncolor),
                                          ),
                                          Text(
                                            "Welcome to Nuti! Our Nuti is one of the most renowned shops in.",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, It has survived not only five centuries, but also the leap into electronic typesetting,",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 8,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.d),
                                child: MasonryGridView.count(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              elevation: 0,
                                              child: Container(
                                                height: 104,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 11,
                                                    ),
                                                    Image.asset(
                                                      "assets/a15.png",
                                                      height: 35,
                                                      width: 35,
                                                    ),
                                                    Text(
                                                      "Best Prices & offers",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColor
                                                              .buttoncolor),
                                                    ),
                                                    Text(
                                                      "Orders Rs 50 or more",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor.o),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      );
                                    }),
                              ),
                            ]),
                      ),
                    );
                  }
                  if (state is MainError) {
                    return Text(state.message);
                  }
                  if (state is MainLoading) {
                    return Center(child: CircularProgressIndicator(color: AppColor.buttoncolor,));
                  }
                  return Container();
    },
            )
      ),
              )
    );
  }


  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? 6 : 6,
        width: isSelected ? 20 : 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
            color: isSelected ? AppColor.buttoncolor : Colors.black12),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 112.0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: _onPlaceBidButtonPress,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 3, top: 3, bottom: 3, right: 3),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: (activePageIndex == 0)
                              ? BoxDecoration(
                                  color: AppColor.buttoncolor,border: Border.all(color: AppColor.border),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                )
                              :  BoxDecoration(
                                  color: Colors.white,border: Border.all(color: AppColor.border),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                          child: Text("Nuti Products",
                              style: (activePageIndex == 0)
                                  ? GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)
                                  : GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.onemin)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: _onBuyNowButtonPress,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 3, top: 3, bottom: 3, left: 3),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: (activePageIndex == 1)
                              ? BoxDecoration(
                                  color: AppColor.buttoncolor,border: Border.all(color: AppColor.border),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                )
                              :  BoxDecoration(
                                  color: Colors.white,border: Border.all(color: AppColor.border),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                          child: Text("Immuniti",
                              style: (activePageIndex == 1)
                                  ? GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)
                                  : GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.onemin)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void showNetworkAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context1) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: SizedBox(
              height: 130,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                        child: Text(
                      'Oops!',
                      style: TextStyle(color: AppColor.textfield),
                    )),
                  ),

                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Text(
                      'You are Offline. Please check your internet connection',
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(20),
                  //   child: InkResponse(
                  //       onTap: () {
                  //       },
                  //       child: CustomButton(text: 'OK')
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }
}

void showNetworkAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context1) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: SizedBox(
            height: 130,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text('Oops!',
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Text(
                    'You are Offline. Please check your internet connection',
                    textAlign: TextAlign.center,
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(20),
                //   child: InkResponse(
                //       onTap: () {
                //       },
                //       child: CustomButton(text: 'OK')
                //   ),
                // ),
              ],
            ),
          ),
        );
      });
}
