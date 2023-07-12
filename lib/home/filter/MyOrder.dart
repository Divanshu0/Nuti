import 'package:flutter/material.dart';
import 'package:food_delivery/Order/delivered_order.dart';
import 'package:food_delivery/Order/my_order_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Appcolor/Appcolor.dart';

class MyOrderList extends StatefulWidget {
  const MyOrderList({Key? key}) : super(key: key);

  @override
  State<MyOrderList> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrderList> with TickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
              "My Order",
              style: GoogleFonts.inter(
                  fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
            )),
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
        physics: const ClampingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _menuBar(context),
                ),
                Expanded(
                  flex: 2,
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
                      MyOrderPage(),
                      Delivered_Order(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _menuBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                borderRadius:
                const BorderRadius.all(Radius.circular(22)),
                onTap: _onPlaceBidButtonPress,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 3, top: 3, bottom: 3, right: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: (activePageIndex == 0)
                        ?  BoxDecoration(
                      color: AppColor.buttoncolor,
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                    )
                        :  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                    child: Text(
                        "My Order",
                        style: (activePageIndex == 0)
                            ?  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.white)
                            :  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius:
                const BorderRadius.all(Radius.circular(22)),
                onTap: _onBuyNowButtonPress,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 3, top: 3, bottom: 3, left: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: (activePageIndex == 1)
                        ?  BoxDecoration(
                      color: AppColor.buttoncolor,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(22)),
                    )
                        :  const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(22)),
                    ),
                    child: Text(
                        "Delivered Order",
                        style: (activePageIndex == 1)
                            ? GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.white)
                            :  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
          ],
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
}
