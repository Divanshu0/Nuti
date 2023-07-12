import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home/categories.dart';
import 'package:food_delivery/home/profile.dart';
import 'main_food_page.dart';

class NutiCategories extends StatefulWidget {
  const NutiCategories({Key? key}) : super(key: key);

  @override
  State<NutiCategories> createState() => _NutiCategoriesState();
}

class _NutiCategoriesState extends State<NutiCategories> {
  int selected  = 0;
  Widget customRadio(String text, int index){
    return GestureDetector(onTap: (){
      setState(() {
        selected = index;
      });
    },
      child: Padding(
        padding: const EdgeInsets.only(top: 15,left: 8,right: 8,bottom: 8),
        child: Container(height: 60,width: 180,
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(30),color: (selected == index) ? Colors.orange[800] : Colors.white,border: Border.all(color: Colors.grey)),
            child: Center(child: Text(text,style: TextStyle(fontSize:20, color: (selected == index) ? Colors.white : Colors.grey,),))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[350],
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: const Center(child: Text("Categories",
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.black),)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Categories()));
          },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[350],shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),)
              ),
              child: const Icon(CupertinoIcons.back,size: 18,color: Colors.black,)),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height :60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.orange[800],),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(icon: const Icon(Icons.home, color: Colors.white,), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainFoodPage()));

              },),
            ),
            IconButton(icon: const Icon(Icons.shopping_bag, color: Colors.white,), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Categories()));
            },),
            IconButton(icon: const Icon(Icons.store_mall_directory, color: Colors.white,), onPressed: () {},),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(icon: const Icon(Icons.person, color: Colors.white,), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile()));
              },),
            ),
          ],
        ),
      ),
      body: Column(children: [
        Row(children: [GestureDetector(onTap: (){

        },
          child: customRadio("Nuti", 1),),
          GestureDetector(onTap: (){

          },
            child: customRadio("Immuniti", 2),),
        ],),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: Container(height: 200,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/a3.png",height: 100,width: 100,),
                      const Text("Delicious \nIndian Sauces",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey),)
                    ],),),
              ),
              Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: Container(height: 200,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/a3.png",height: 100,width: 100,),
                      const Text("Govt. Sauces Nuti",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey),)
                    ],),),
              ),
            ],
          ),
        ),
        Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 2,
          child: Container(height: 200,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/a3.png",height: 100,width: 100,),
                const Text("Govt. Sauces Nuti",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey),)
              ],),),
        ),
      ],),);
  }
}




// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//     Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       elevation: 1,
//       child: Container(height: 60,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
//       child: Center(child: Text("Nuti",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),),
//     ),
//     Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       elevation: 1,
//       child: Container(height: 60,width: 180,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
//       child: Center(child: Text("Immuniti",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),),
//     )
//
//   ],),
// ),

