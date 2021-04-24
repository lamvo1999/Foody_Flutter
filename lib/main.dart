import 'package:flutter/material.dart';
import 'package:food_odering/src/providers/auth.dart';
import 'package:food_odering/src/screens/home.dart';
import 'package:food_odering/src/screens/login.dart';
import 'package:food_odering/src/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider.initialize())
    ],
    child: MaterialApp(
      title: 'Food Delevery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreenController(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final auth = Provider.of<AuthProvider>(context);
   switch(auth.status){
     case Status.Unauthenticated:
       return Loading();
     case Status.Authenticating:
       return LoginScreen();
     case Status.Authenticated:
       return Home();
     default: return LoginScreen();
   }
  }
}



