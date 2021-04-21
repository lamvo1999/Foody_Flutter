import 'package:flutter/material.dart';
import 'package:food_odering/src/widgets/custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({@required this.image,@required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: GestureDetector(
          onTap: onTap ?? null,
          child: Column(
            children: <Widget>[
              Image.asset("images/$image", width: 26, height: 26,),
              SizedBox(height: 2,),
              CustomText(text: name,)
            ],
          ),
        )
    );
  }
}
