import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Appcolor/Appcolor.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose(){
    _scrollController.dispose();
  }


  int count = 1;
  void incrementCount(){setState(() {
    count ++;
  });}
  void decrementCount(){
    if(count <= 1){
      return;
    }
    setState(() {
      count --;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.buttoncolor,title: Center(child: Text("Nuti Products",
        style: GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.white),)),elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/pop.png")),
        ),
      ),

    );
  }
}
