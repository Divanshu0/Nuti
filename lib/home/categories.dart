import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:food_delivery/tabbar/Immuniticlass.dart';
import 'package:food_delivery/tabbar/NutiClass.dart';
import 'package:google_fonts/google_fonts.dart';


class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin{

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
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: Center(child: Text("Categories"
        ,style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),)),
      ),
       body:  SingleChildScrollView(
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
                       NutiClass(),
                       ImmunitiClass(),
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
                      "Nuti",
                      style: (activePageIndex == 0)
                          ?  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.white)
                          :  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: AppColor.onemin)
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
                      "Immuniti",
                      style: (activePageIndex == 1)
                          ? GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.white)
                          :  GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: AppColor.onemin)
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
