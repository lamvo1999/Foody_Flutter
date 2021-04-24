import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_odering/src/helpers/screen_navigation.dart';
import 'package:food_odering/src/helpers/style.dart';
import 'package:food_odering/src/providers/auth.dart';
import 'package:food_odering/src/screens/home.dart';
import 'package:food_odering/src/screens/login.dart';
import 'package:food_odering/src/widgets/custom_text.dart';
import 'package:food_odering/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating ?
      Loading() :SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[

              Image.asset("images/lo.png"),

              SizedBox(height: 10,),
              CustomText(text: "Đăng Ký", size: 25, weight: FontWeight.w700,),

              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: authProvider.name,
                      decoration: InputDecoration(
                          hintText: "Tên Người Dùng",
                          border: InputBorder.none,
                          icon: Icon(Icons.person)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: authProvider.email,
                      decoration: InputDecoration(
                          hintText: "Emails",
                          border: InputBorder.none,
                          icon: Icon(Icons.email)
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: authProvider.password,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock)
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () async{
                    if(!await authProvider.signUp()){
                      _key.currentState.showSnackBar(
                        SnackBar(content: Text("Đăng Ký Thất Bại"),)
                      );
                      return;
                    }
                    authProvider.cleanControllers();
                    changeScreenReplacement(context, Home());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: red,
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomText(text: "Đăng Ký", size: 22,color: white,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  changeScreen(context, LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(text: "Đả có tài khoản? Đăng Nhập.", size: 20,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
