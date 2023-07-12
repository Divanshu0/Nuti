import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:food_delivery/home/reviewTitle.dart';
import 'package:food_delivery/home/saved_address.dart';
import 'package:food_delivery/home/seeallreview.dart';
import 'package:food_delivery/home/view_cart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Auth/cubit/Best_Selling_Products/products1_cubit/products1_cubit.dart';
import '../Auth/cubit/Best_Selling_Products/products1_cubit/products1_state.dart';
import '../Utils/showSnackBar.dart';

class ImmuneNuti extends StatefulWidget {
  final String id;
  const ImmuneNuti({Key? key, required this.id}) : super(key: key);


  @override
  State<ImmuneNuti> createState() => _ImmuneNutiState();

}

bool isAdmin=true;
int index= 0;


class _ImmuneNutiState extends State<ImmuneNuti> {

  TextEditingController product_idController = TextEditingController();

@override
  void initState() {
  log(widget.id+"   <======= 287187391");
    BlocProvider.of<Product1Cubit>(context).products1(widget.id);
    super.initState();
  }
  int count = 1;
  void incrementCount(){setState(() {
    count ++;
  });}
  void decrementCount(){
    if(count <= 1){
      return;
    };
    setState(() {
       count --;
    });
  }
  int value = 0;
  int currentIndex = 0;
  List imageList = [
    {"id" : 1, "image_path" : "assets/a3.png"},
    {"id" : 2, "image_path" : "assets/a3.png"},
    {"id" : 3, "image_path" : "assets/a3.png"},
    {"id" : 4, "image_path" : "assets/a3.png"},
    {"id" : 5, "image_path" : "assets/a3.png"},
    {"id" : 6, "image_path" : "assets/a3.png"},
  ];
  final CarouselController carouselController = CarouselController();
  int selected  = 0;
  
  Widget customRadio(String text, int index){
    return GestureDetector(onTap: (){
      setState(() {
        selected = index;
      });
    },
      child: Container(height: 40,width: 80,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(30),
              color: (selected == index) ? AppColor.buttoncolor : Colors.white,
              border: Border.all(color: AppColor.border)),
          child: Center(child: Text(text,style: GoogleFonts.inter(fontSize:16,fontWeight:FontWeight.w500,
            color: (selected == index) ? Colors.white : AppColor.onemin,),))),
    );
  }
  int current = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation:0,title: Center(child: Text("ImmuneNuti",
        style: GoogleFonts.inter(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25,),
                Text("Total price",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.p),),
                Row(
                  children: [
                    Text("Rs. 152",style: GoogleFonts.inter(fontSize: 24,fontWeight:FontWeight.w600,color: AppColor.buttoncolor),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 5),
                      child: RichText(text: TextSpan(text: "Rs.252",style: TextStyle(decoration:TextDecoration.lineThrough,color: AppColor.buttoncolor,fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ],),
                                  Row(
                                     children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewCart()));
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttoncolor,shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),)
                                          ,),
                                        child: SizedBox(height:50,width:100,child: Center(child:
                                        Text("Buy Now",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.white),))),
                                      ),
                                    ],
                                  ),
          ],),),
      body: BlocConsumer<Product1Cubit, Product1State>(
          listener: (context, state) async {
            if (state is Product1Success) {
              Loader.hide();

            }
            if (state is Product1Error) {
              Loader.hide();
              showSnackBar(context, state.message);
            }
            if (state is Product1Loading) {
              loader(context);
            }
          },
          builder: (context, state) {
            if (state is Product1Success){
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),color: Colors.white),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              print(currentIndex);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: CarouselSlider(
                                      items: imageList.map((item) => Image.asset(item["image_path"],
                                          fit: BoxFit.fitHeight,width: double.infinity)).toList(),
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                          scrollPhysics: const BouncingScrollPhysics(),
                                          autoPlay: true,
                                          aspectRatio: 2,
                                          viewportFraction: 2,
                                          onPageChanged: (index,reason){
                                            setState(() {
                                              currentIndex = index;
                                            });
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var i=0 ; i<6 ; i++) buildIndicator(currentIndex == i )
                                  ],),
                              ],
                            ),
                          ),

                        ],),
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.product1Response.data?[index].name?? "",style: GoogleFonts.inter(fontSize: 18,fontWeight:FontWeight.w500,color: Colors.black),),
                              Text(state.product1Response.data?[index].concern?? "",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: AppColor.p),),
                              Row(
                                children: [
                                  RichText(text: TextSpan(text: state.product1Response.data?[index].price.toString()??"",style: GoogleFonts.inter(fontSize: 24,fontWeight:FontWeight.w600,color: AppColor.buttoncolor))),
                                  RichText(text: TextSpan(text: "Rs.252",style: TextStyle(decoration:TextDecoration.lineThrough,color: AppColor.buttoncolor,fontWeight: FontWeight.w400,fontSize: 12))),
                                  const Spacer(),
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    elevation:0,
                                    child: Container(height: 70,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: AppColor.textfield),
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30,top: 15),
                                          child: Row(children: [
                                            Image.asset("assets/Vector.png",height: 22,fit: BoxFit.fill,),
                                            const SizedBox(width: 8,),
                                            Text("4+",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.p),)
                                          ],),
                                        ),
                                        Text("262 reviews",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: AppColor.p),)
                                      ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Weight",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                              const SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  customRadio("500 gm", 1),
                                  customRadio("1 Kg", 2),
                                  customRadio("2 Kg", 3),
                                  customRadio("5 kg", 4),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                                color: AppColor.m,
                                height: 50,
                                indent: 15,
                                endIndent: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Select Quantity",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            child: GestureDetector(onTap: decrementCount,
                                              child: Container(height: 34,width: 34,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10,),color: AppColor.m),
                                                child: const Icon(Icons.remove),),
                                            )
                                        ),
                                        const SizedBox(width: 11.4,),
                                        Text("$count",style: const TextStyle(fontSize: 20),),
                                        const SizedBox(width: 11.4,),
                                        SizedBox(
                                            child: GestureDetector(onTap: incrementCount,
                                              child: Container(height: 34,width: 34,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10,),color: AppColor.m),
                                                child: const Icon(Icons.add),),
                                            )
                                        ),
                                      ],
                                    ),
                                  )
                                ],)
                            ],),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery To: Noida-201301",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                                  SizedBox(
                                      child: GestureDetector(onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Saved_Address()));
                                      },
                                        child: Container(height: 40,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20,),color: Colors.white,border: Border.all(color: AppColor.border)),
                                            child: Center(child: Text("Change",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: AppColor.address)))),
                                      )
                                  ),
                                ],),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/tick.png",height: 15,width: 15,),
                                      const SizedBox(width: 10,),
                                      Text("Free Shipping",style: GoogleFonts.inter(fontSize: 13,fontWeight:FontWeight.w400,color: Colors.black),),
                                    ],
                                  ),
                                  const SizedBox(height: 4,),
                                  Row(
                                    children: [
                                      Image.asset("assets/tick.png",height: 15,width: 15,),
                                      const SizedBox(width: 10,),
                                      Text("Deliverd 2-5 Bussiness Days",style: GoogleFonts.inter(fontSize: 13,fontWeight:FontWeight.w400,color: Colors.black),),
                                    ],
                                  ),
                                  const SizedBox(height: 4,),
                                  Row(
                                    children: [
                                      Image.asset("assets/tick.png",height: 15,width: 15,),
                                      const SizedBox(width: 10,),
                                      Text("100% Original products",style: GoogleFonts.inter(fontSize: 13,fontWeight:FontWeight.w400,color: Colors.black),),
                                    ],
                                  ),
                                  const SizedBox(height: 4,),
                                  Row(
                                    children: [
                                      Image.asset("assets/tick.png",height: 15,width: 15,),
                                      const SizedBox(width: 10,),
                                      Text("Easy 30 days returns and exchanges",style: GoogleFonts.inter(fontSize: 13,fontWeight:FontWeight.w400,color: Colors.black),),
                                    ],
                                  ),
                                ],
                              ),
                            ],),
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Best Offers",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.circle,color: Colors.black,size: 10,),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Text(state.product1Response.data?[index].discription?? "",style: GoogleFonts.inter(fontSize: 13,fontWeight:FontWeight.w400,color: Colors.black),
                                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              ),
                            ],),
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Rating Reviews",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)),
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  elevation: 0,color: Colors.black,
                                  child: Container(height: 70,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColor.textfield),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/Vector.png",height: 22,fit: BoxFit.fill,),
                                            const SizedBox(width: 8,),
                                            Text("4+",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: AppColor.p),)
                                          ],),
                                        Text("262 reviews",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w400,color: AppColor.p),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],),
                            Divider(
                              thickness: 2,
                              color: AppColor.m,
                              indent: 5,
                              endIndent: 5,
                            ),
                            const SizedBox(height: 8,),
                            SizedBox(
                              child: ListView.builder(
                                  itemCount : 6,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Awesome Taste",style: GoogleFonts.inter(fontSize: 15,fontWeight:FontWeight.w500,color: Colors.black)),
                                        const SizedBox(height: 8,),
                                        Text("Spicy blend, adds depth to tea. Aromatic and warming. A must-try for tea lovers seeking a flavor kick.",style: GoogleFonts.inter(fontSize: 12,fontWeight:FontWeight.w400,color: Colors.black),
                                          maxLines: 4,overflow: TextOverflow.ellipsis,),
                                        const SizedBox(height: 8,),
                                        Row(children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColor.textfield),
                                            child: Image.asset("assets/a3.png",height: 50,width: 35,),),
                                          const SizedBox(width: 10,),
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColor.textfield),
                                            child: Image.asset("assets/a3.png",height: 50,width: 35,),),
                                        ],),
                                        const SizedBox(height: 8,),
                                        Text("Pallavi Kumari, Delhi Oct, 2022",style: GoogleFonts.inter(fontSize: 10,fontWeight:FontWeight.w500,color: AppColor.p)),
                                        Divider(
                                          thickness: 2,
                                          color: AppColor.m,
                                          indent: 5,
                                          endIndent: 5,
                                        ),
                                        const SizedBox(height: 8,),
                                      ],);
                                  }),
                            ),
                            SizedBox(
                                child: GestureDetector(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SeeAllReview()));

                                },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(height: 40,width: 120,decoration: BoxDecoration(color: AppColor.textfield,),
                                        child: Center(child: Text("See all Reviews",style: GoogleFonts.inter(fontSize: 14,fontWeight:FontWeight.w500,color: Colors.black)))),
                                  ),
                                )
                            ),
                            GestureDetector(onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReviewTitle()));
                            },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: AppColor.bar),
                                      color: AppColor.textfield),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("Write a review",style: GoogleFonts.inter(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black)),
                                      ),
                                      const Icon(Icons.chevron_right)
                                    ],),),
                              ),
                            ),
                          ],),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            }
            if (state is Product1Loading) {
              return Center(child: CircularProgressIndicator(color: AppColor.buttoncolor,));
            }
            return Container();
          })
    );
  }
  Widget buildIndicator(bool isSelected){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,left: 2,right: 2,top: 2),
      child: Container(
        height: isSelected ? 6 : 6,
        width: isSelected ? 20 : 15,
        decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(16),color: isSelected ? AppColor.buttoncolor : AppColor.border),
      ),
    );
  }
  // Shimmer getShimmerLoading(){
  //   return Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           Container(height: 250,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           const SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           const SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           const SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           const SizedBox(height: 10,),
  //           Container(
  //             height: 150,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //           const SizedBox(height: 10,),
  //           Container(height: 500,
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}





// Positioned(
//     bottom: 10,left: 0,right: 0,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: imageList.asMap().entries.map((entry) {
//         print(entry);
//         print(entry.key);
//         return GestureDetector(
//             onTap:(){
//               carouselController.animateToPage(entry.key);
//               child: Container(width: currentIndex == entry.key ? 17:7,
//               height: 7,
//               margin: EdgeInsets.symmetric(horizontal: 6),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
//               color: currentIndex == entry.key
//                   ? Colors.orange[800]
//                   : Colors.grey
//               ),
//               );
//             }
//         );
//       }
//       ).toList(),))
