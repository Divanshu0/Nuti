import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
 import 'package:google_fonts/google_fonts.dart';

import '../Appcolor/Appcolor.dart';



class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
@override
  void initState() {
    setState(() {
      searchnode.requestFocus();
    });
    super.initState();
  }
  int current = 0;
  FocusNode searchnode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColor.backgound,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(
              child: Text("Search",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/pop.png")),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 18,left: 8,right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.border),
                      color: Colors.white),
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Image.asset("assets/search.png",height: 21,width: 21,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.72,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-z]")),
                          ],
                          textInputAction: TextInputAction.search,
                          focusNode: searchnode,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Search",

                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 20)),),
                      ),
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Recent Search",style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
                ),
                MasonryGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: 5,
                    // state.mainfoodpageResponse.shopByIng!.length,
                    itemBuilder: (context, index) {

                      return AnimatedContainer(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: Colors.white,),
                        duration: const Duration(seconds: 0),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Tea Masala",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,
                                  color: Colors.black),),
                              Image.asset("assets/1234.png",height: 15,width: 15,)
                            ],
                          ),
                        ),
                      );
                      // return Container(
                      //   margin: EdgeInsets.all(5),
                      //   height: 50,
                      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Text("Nuti",
                      //           style: GoogleFonts.inter(
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w500,
                      //               color: Colors.black)),
                      //       Image.asset("assets/1234.png",height: 15,width: 15,)
                      //     ],
                      //   ),);
                    }),
              ],
            ),
          )
      ),
    );
  }
}

/*
class Search extends StatelessWidget {


int current = 0;
FocusNode searchnode=FocusNode();
  @override
  Widget build(BuildContext context) {

    return
  }
}*/
