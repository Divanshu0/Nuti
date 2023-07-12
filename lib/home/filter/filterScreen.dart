import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/home/filter/imminitiFilter.dart';
import 'package:food_delivery/home/filter/nutiFilter.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late PageController _pageController;
  int activePageIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }
  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.7,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .requestFocus(
              FocusNode());
        },
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width:
              MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.only(
                      topLeft: Radius
                          .circular(
                          20),
                      topRight: Radius
                          .circular(
                          20)),
                  color: Colors.white),
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
                        BorderRadius
                            .circular(
                            20),
                        color: AppColor
                            .bar),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Filter",
                    style: GoogleFonts
                        .inter(
                        fontSize: 22,
                        fontWeight:
                        FontWeight
                            .w500,
                        color: Colors
                            .black),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets
                  .only(
                  top: 5.0),
              child: _menuBar(
                  context),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.475,
              child: PageView(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (int i) {
                  FocusScope.of(context)
                      .requestFocus(FocusNode());
                  setState(() {
                    activePageIndex = i;
                  });
                },
                children: const <Widget>[
                  NutiFilter(),
                  ImmunitiFilter(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
