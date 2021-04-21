import 'package:flutter/material.dart';
import 'file:///E:/Flutter%20Project/food_odering/lib/src/helpers/style.dart';
import 'package:food_odering/src/models/category.dart';
import 'package:food_odering/src/widgets/custom_text.dart';

List<Category> categoriesList = [
  Category(name: "Salad", image: "salad.png"),
  Category(name: "Fast Food", image: "fast-food.png"),
  Category(name: "Desert", image: "desert.png"),
  Category(name: "Sea Food", image: "seafood.png"),
  Category(name: "Steak", image: "steak.png"),
  Category(name: "Toast", image: "toast.png"),
];

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color:red,
                          offset: Offset(1,1),
                          blurRadius: 4
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset("images/${categoriesList[index].image}", width: 50,),
                  ),

                ),
                SizedBox(height: 5,),
                CustomText(text: categoriesList[index].name, size:14, color: black,)
              ],
            ),
          );
        },
      ),
    );
  }
}
