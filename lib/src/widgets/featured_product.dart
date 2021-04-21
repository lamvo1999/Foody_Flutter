import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/screen_navigation.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/models/product.dart';
import 'package:food_odering/src/screens/details.dart';
import 'package:food_odering/src/widgets/custom_text.dart';

List<Product> productList = [
  Product(name: "Cơm Chiên", price: 5.99, rating: 4.2, vendor: "GoodFoos", wishList: true, image: "com.png"),
  Product(name: "Bò Xông Khói", price: 10.9, rating: 4.7, vendor: "GoodFoos", wishList: false, image: "bo.png"),
  Product(name: "Mì Quảng", price: 1.9, rating: 4.8, vendor: "GoodFoos", wishList: true, image: "mi.png"),
  Product(name: "Pizza", price: 7.0, rating: 3.2, vendor: "GoodFoos", wishList: true, image: "piza.png"),
  Product(name: "Salad Cá", price: 9.0, rating: 4.0, vendor: "GoodFoos", wishList: false, image: "sala.png"),
  Product(name: "Tôm Nướng", price: 4.3, rating: 4.9, vendor: "GoodFoos", wishList: false, image: "tom.png"),

];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: EdgeInsets.fromLTRB(12,14,16,12),
            child: GestureDetector(
              onTap: (){
                changeScreen(_, Details(product: productList[index]));
              },
              child: Container(
                height: 260,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: grey,
                          offset: Offset(10,5),
                          blurRadius: 4
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productList[index].image}",
                        height: 160,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: CustomText(text: productList[index].name,),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey,
                                        offset: Offset(1,1),
                                        blurRadius: 4
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: productList[index].wishList ? Icon(
                                  Icons.favorite,
                                  color: red,
                                  size: 18,
                                ) : Icon(
                                  Icons.favorite_border,
                                  color: red,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomText(
                                  text: productList[index].rating.toString(),
                                  color: grey,
                                  size: 14,
                                ),
                              ),
                              SizedBox(width: 2,),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomText(text: "\$${productList[index].price}", weight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
