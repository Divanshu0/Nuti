import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/Auth/cubit/ViewAll/viewAll_cubit.dart';
import 'package:food_delivery/Auth/cubit/ViewAll/viewAll_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Appcolor/Appcolor.dart';
import '../repository/repo2.dart';
import 'immuneNuti.dart';
import 'main_food_page.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  int value = 0;
  List<int> selectedItem = [];
  final ScrollController _scrollController = ScrollController();
  bool backToTop = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        backToTop = _scrollController.offset>400?true:false;
      });
    });
    super.initState();
    hello();

    BlocProvider.of<ViewAllCubit>(context).viewAllScreen();
    isInternetConnected().then((value) {
      if (value == true) {

      } else {
        showNetworkAlert(context);
      }
    });
  }

  int activePageIndex = 0;
  hello()async{
    log("hello");
    Repository repo =Repository();
    final response =await repo.nutiCategoryrequest();
    log(jsonEncode(response));

  }
  Future<bool> isInternetConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,title: Center(child: Text("Nuti Products",
        style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.black),)),elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
      body:BlocConsumer<ViewAllCubit, ViewAllState>(listener: (context, state){
        if (state is ViewAllSuccess) {
          Loader.hide();
          print("tyagi");
          log(jsonEncode(state.viewAll_response));
        }
      },builder: (context, state){
        if(state is ViewAllSuccess){
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Delicious Indian Sauces",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount: state.viewAll_response.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 0,
                                  child: Container(
                                      height: 232,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: AppColor.textfield,border: Border.all(color: AppColor.z)),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 134,
                                              width: MediaQuery.of(context).size.width,
                                            decoration:  BoxDecoration(
                                                borderRadius: const BorderRadius.only(
                                                    topRight: Radius
                                                        .circular(
                                                        20),
                                                    topLeft: Radius
                                                        .circular(
                                                        20)),
                                                image: DecorationImage(
                                                    image: NetworkImage(state.viewAll_response.data?[index].image?? ""),
                                                    fit: BoxFit.fill),
                                                color: Colors
                                                    .white),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.viewAll_response.data?[index].name?? "",
                                                  style: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  state.viewAll_response.data?[index].concern?? "",
                                                  style: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 10,
                                                      color: AppColor.o),
                                                ),

                                                Row(
                                                  children: [
                                                     Text(
                                                      state.viewAll_response.data?[index].price.toString()?? "",
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                    Text(
                                                      state.viewAll_response.data?[index].oldPrice.toString()?? "",
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w500,
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          color: AppColor.cuttext),
                                                    ),
                                                    const Spacer(),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                ImmuneNuti(id: state.viewAll_response.data?[index].id.toString()??"",)));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: AppColor.buttoncolor,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(25),
                                                        ),elevation: 0,
                                                      ),
                                                      child: const SizedBox(
                                                          height: 22,
                                                          width: 46,
                                                          child: Center(
                                                              child: Text(
                                                                "Buy now",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    fontSize: 11),
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
                      }),
                ]),
              ));
        }
        if (state is ViewAllError) {
          return Text(state.message);
        }
        return Container();
      },)
    );
  }
}
