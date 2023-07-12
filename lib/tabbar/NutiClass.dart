import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../Auth/cubit/categories_cubit/cat_Nuti_cubit.dart';
import '../Auth/cubit/categories_cubit/cat_Nuti_state.dart';
import '../home/immuneNuti.dart';
import '../home/main_food_page.dart';
import '../home/register.dart';

class NutiClass extends StatefulWidget {
  const NutiClass({Key? key}) : super(key: key);

  @override
  State<NutiClass> createState() => _NutiClassState();
}

class _NutiClassState extends State<NutiClass> {

  void initState() {


    BlocProvider.of<NutiCategoryCubit>(context).nutiScreen();
    isInternetConnected().then((value) {
      if (value == true) {

      } else {
        showNetworkAlert(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NutiCategoryCubit,NutiCategoryState>(listener: (context, state){
      if (state is NutiSuccess) {
        Loader.hide();
        print("asdf");
        log(jsonEncode(state.nutiCategoryResponse));
      }
    },builder: (context, state) {
      if(state is NutiSuccess){
        return MasonryGridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        itemCount: state.nutiCategoryResponse.data!.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Image.asset("assets/a3.png",height: 100,width: 100,),
                  SizedBox(height: 20,),
                  SizedBox(width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(state.nutiCategoryResponse.data?[index].name?? "",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: AppColor.p),
                        maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                    ),
                  ),
                ],),
            ),
          );
        },
      );
      }
      if (state is NutiError){
        return Text(state.message);
      }
      return Container();
    },);
  }
  // Shimmer getShimmerLoading(){
  //   return Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 10,),
  //           Row(children: [
  //             Container(
  //               height: 200,
  //               width: 185,
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius:
  //                   BorderRadius.circular(25)),
  //             ),
  //             SizedBox(width: 10,),
  //             Container(
  //               height: 200,
  //               width: 185,
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius:
  //                   BorderRadius.circular(25)),
  //             ),
  //           ],),
  //           SizedBox(height: 10,),
  //           Row(children: [
  //             Container(
  //               height: 200,
  //               width: 185,
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius:
  //                   BorderRadius.circular(25)),
  //             ),
  //             SizedBox(width: 10,),
  //           ],),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
