import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/screen_navigation.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/providers/product.dart';
import 'package:food_odering/src/screens/details.dart';
import 'package:food_odering/src/widgets/custom_text.dart';
import 'package:food_odering/src/widgets/product.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: CustomText(text: "Món Ăn", size: 20,),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){},
          ),
        ],
      ),
      body: productProvider.productsSearched.length < 1  ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search, color: grey, size: 30,),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: "Không tìm thấy món ăn",
                    color: grey,
                    weight: FontWeight.w300,
                    size: 22,
                  ),
                ],
              ),
            ],
          )
          :ListView.builder(
        itemCount: productProvider.productsSearched.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () async {
              changeScreen(context, Details(product: productProvider.productsSearched[index]));
            },
            child: ProductWidget(
              product: productProvider.productsSearched[index],
            ),
          );
        },
      ),
    );
  }
}
