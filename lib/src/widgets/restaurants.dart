import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/models/restaurant.dart';
import 'package:food_odering/src/widgets/loading.dart';
import 'package:food_odering/src/widgets/small_floating_button.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 4),
      child: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 120,
                          child: Loading(),
                        ),
                      ),
                    ),
                    Center(
                        child: Image.network(restaurant.image,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmallButton(Icons.favorite),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.star, color:  Colors.yellowAccent, size: 20,),
                        ),
                        Text(restaurant.rating.toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,

                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.25),
                        Colors.black.withOpacity(0.025),
                      ]
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(text: "${restaurant.name}\n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: white)),
                            TextSpan(text: "Gía trung bình ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: white)),
                            TextSpan(text: "\$${restaurant.avgPrice}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white)),
                          ], style: TextStyle(color: black)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
