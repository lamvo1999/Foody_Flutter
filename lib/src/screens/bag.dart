import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/models/product.dart';
import 'package:food_odering/src/widgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: black,),
          onPressed: (){},),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Giỏ Hàng", size: 22,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset("images/shoppbag.png", width: 30, height: 30,),
                ),
                Positioned(
                  right: 5,
                  bottom: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: grey,
                              offset: Offset(2,1),
                              blurRadius: 3
                          ),
                        ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: CustomText(text: "2", color: red, size: 16,weight:  FontWeight.bold,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     height: 140,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: white,
          //       boxShadow: [
          //         BoxShadow(
          //          color: grey,
          //          offset: Offset(3,5),
          //          blurRadius: 20
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: <Widget>[
          //         ClipRRect(
          //           borderRadius: BorderRadius.circular(10),
          //           child: Image.asset(
          //             "images/${product.image}",
          //             height: 120,
          //             width: 120,
          //           ),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             RichText(
          //               text: TextSpan(
          //                   children: [
          //                     TextSpan(text: product.name+ "\n", style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.bold)),
          //                     TextSpan(text: "\$"+product.price.toString()+ "\n", style: TextStyle(color: black, fontSize: 18)),
          //                   ]
          //               ),),
          //
          //             SizedBox(width: 80,),
          //             IconButton(icon: Icon(Icons.delete), onPressed: (){}),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
