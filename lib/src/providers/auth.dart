
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_odering/src/helpers/user.dart';
import 'package:food_odering/src/models/user.dart';

enum Status{Uninitialized, Unauthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Firestore _firestore = Firestore.instance;
  Status _status = Status.Uninitialized;
  UserService _userService = UserService();
  UserModel _userModel;

  Status get status => _status;
  UserModel get userModel => _userModel;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }


  Future<bool> signIn() async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text,password : password.text);
      return true;
    }catch(e){
      return onError(e.toString());
    }
  }

  Future signOunt(){
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try{
      _status = Status.Authenticating;
      await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result) {
        _firestore.collection("users").document(result.user.uid).setData({
          "name": name.text,
          "email": email.text,
          "id": result.user.uid,
          "likedFood": [],
          "likedRestaurants": []
        });
      });
      return true;
    }catch(e) {
      return onError(e.toString());
    }
  }

  //     general method
  bool onError(String error){
    _status = Status.Unauthenticated;
    notifyListeners();
    print("Loi: $error");
    return false;
  }

  void cleanControllers(){
    email.text = "";
    password.text = "";
    name.text = "";
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async{
    if(firebaseUser == null){
      _status = Status.Uninitialized;
    }else{
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

}