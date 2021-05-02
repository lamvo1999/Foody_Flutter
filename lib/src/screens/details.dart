import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/models/product.dart';
import 'package:food_odering/src/widgets/custom_text.dart';
import 'package:food_odering/src/widgets/small_floating_button.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      Image.network(widget.product.image),
                      Image.network(widget.product.image),
                      Image.network(widget.product.image)
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                    autoplay: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: white,),
                        onPressed: (){Navigator.pop(context);},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  Image.asset("images/giohang.png", width: 30, height: 30,),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 0,
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
                  Positioned(
                    right: 20,
                    bottom: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: grey,
                            offset: Offset(2,3),
                            blurRadius: 3
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.favorite,
                          size: 16,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomText(text: widget.product.name, size: 24, weight: FontWeight.bold,),
            CustomText(text: "\$" +widget.product.price.toString(), size: 20, weight: FontWeight.w600,),

            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove, size: 28,), onPressed: () {}),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(text: "Thêm Vào Giỏ", color: white, size: 24,weight:  FontWeight.w600,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add,color: red, size: 28,), onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
