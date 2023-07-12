import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Appcolor/Appcolor.dart';
import 'main_food_page.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.backgound,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const MainFoodPage()));
          },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[350],shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),)
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,childAspectRatio: (155.0 / 220.0)),
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          elevation: 5,
                          child: Container(height: 235,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[300]),
                              child: Column(
                                children: [
                                  Container(height: 130,width: 220,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Image.asset("assets/a3.png",),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 45,bottom: 60),
                                            child: Icon(Icons.favorite_border,color: Colors.grey[300],),
                                          ),
                                        ],
                                      )),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20,right: 80),
                                    child: Text("Amla-Chutney"),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 80,top: 5,left: 5),
                                    child: Text("Vedic food suppliment",style: TextStyle(fontSize: 9),),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 2.0),
                                        child: Text("Rs.250",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15,top: 5),
                                        child: Text("Rs.320",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.lineThrough,color: Colors.orange[800]),),
                                      ),
                                      const SizedBox(height:20,width:40,child: Center(child: Text("Shop now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9),))),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        );
          }),
    );
  }
}
