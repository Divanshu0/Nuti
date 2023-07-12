import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Appcolor/Appcolor.dart';

class ImmunitiFilter extends StatefulWidget {
  const ImmunitiFilter({Key? key}) : super(key: key);

  @override
  State<ImmunitiFilter> createState() => _ImmunitiFilterState();
}

class _ImmunitiFilterState extends State<ImmunitiFilter> {

  int current = 0;
  int current1 = 0;
  int current2 = 0;
  int current3 = 0;

  RangeValues values = const RangeValues(0, 1500);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.backgound,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Products", style: GoogleFonts.inter(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: AppColor.bar),
                                      color: current == index
                                          ? AppColor.buttoncolor
                                          : Colors.white,),
                                    duration: const Duration(seconds: 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Center(child: Text("Permium Pickles",
                                        style: GoogleFonts.poppins(fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: current == index
                                                ? Colors.white
                                                : AppColor.onemin),)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gifting Range", style: GoogleFonts.inter(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                setState(() {
                                  current1 = index;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: AppColor.bar),
                                      color: current1 == index
                                          ? AppColor.buttoncolor
                                          : Colors.white,),
                                    duration: const Duration(seconds: 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Center(child: Text("Combo Pack of 2",
                                        style: GoogleFonts.poppins(fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: current1 == index
                                                ? Colors.white
                                                : AppColor.onemin),)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fill By Price", style: GoogleFonts.inter(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                      const SizedBox(height: 14,),
                      // Row(children: [
                      //   Text("From: Rs. 0", style: GoogleFonts.inter(fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //       color: Colors.black)),
                      //   Spacer(),
                      //   Text("From: Rs. 1500", style: GoogleFonts.inter(fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //       color: Colors.black)),
                      // ],),
                      SliderTheme(data: SliderThemeData(
                          valueIndicatorColor: AppColor.buttoncolor
                      ),
                          child: RangeSlider(values: values,
                              max: 1500,
                              min: 0,
                              divisions: 1500,
                              activeColor: AppColor.buttoncolor,
                              inactiveColor: AppColor.line,
                              labels: RangeLabels(values.start.round().toString(),
                                  values.end.round().toString()),
                              onChanged: (values){
                                setState(() {
                                  this.values = values;
                                });
                              }))
                    ],),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Products", style: GoogleFonts.inter(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                setState(() {
                                  current2 = index;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: AppColor.bar),
                                      color: current2 == index
                                          ? AppColor.buttoncolor
                                          : Colors.white,),
                                    duration: const Duration(seconds: 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Center(child: Text("500 gm",
                                        style: GoogleFonts.poppins(fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: current2 == index
                                                ? Colors.white
                                                : AppColor.onemin),)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Short By", style: GoogleFonts.inter(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                setState(() {
                                  current3 = index;
                                });
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: AppColor.bar),
                                      color: current3 == index
                                          ? AppColor.buttoncolor
                                          : Colors.white,),
                                    duration: const Duration(seconds: 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Center(child: Text("Popularity",
                                        style: GoogleFonts.poppins(fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: current3 == index
                                                ? Colors.white
                                                : AppColor.onemin),)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
