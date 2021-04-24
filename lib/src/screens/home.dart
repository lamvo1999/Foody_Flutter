import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/screen_navigation.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/providers/auth.dart';
import 'package:food_odering/src/screens/bag.dart';
import 'package:food_odering/src/widgets/bottom_navigation_icon.dart';
import 'package:food_odering/src/widgets/categories.dart';
import 'package:food_odering/src/widgets/custom_text.dart';
import 'package:food_odering/src/widgets/featured_product.dart';
import 'package:food_odering/src/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(color: white),
        backgroundColor: black,
        elevation: 0.5,
        title: CustomText(text: "FoodApp", color: white,),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){
                  changeScreen(context, ShoppingBag());
                },
              ),
              // Positioned(
              //   top: 10,
              //   right: 12,
              //   child: Container(
              //     height: 10,
              //     width: 10,
              //     decoration: BoxDecoration(
              //       color: red,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
            ],
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: (){},
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: black
                ),
                  accountName: CustomText(text: authProvider.userModel.name, color: white,),
                  accountEmail: CustomText(text: authProvider.userModel.email, color: grey,)
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.home),
                title: CustomText(text: "Trang Chủ"),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.person),
                title: CustomText(text: "Tài Khoản"),
              ),
              ListTile(
                onTap: (){
                  changeScreen(context, ShoppingBag());
                },
                leading: Icon(Icons.shopping_cart),
                title: CustomText(text: "Giỏ Hàng"),
              ),
            ],
          ),
        ),
        backgroundColor: white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: red,),
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: "Tìm kiếm món ăn và nhà hàng",
                            border: InputBorder.none
                        ),
                      ),
                      trailing: Icon(Icons.filter_list, color: red,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Categories(),
              SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: "Đặc Sắc", size: 20, color: grey,),
              ),

              Featured(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomText(
                      text: "Nhà hàng phổ biến",
                      size: 20,
                      color: grey,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(2),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/cake.png"),
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
                                  Text("4.5")
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
                          height: 100,
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
                                    TextSpan(text: "Bánh Nướng \n", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: white)),
                                    TextSpan(text: "By ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: white)),
                                    TextSpan(text: "Ba Hưng \n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: white)),
                                  ], style: TextStyle(color: black)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(text: "\$12.99 \n", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: white))
                                ], style: TextStyle(color: black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
