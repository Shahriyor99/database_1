import 'package:hive/hive.dart';
import '../model/user_model.dart';

class HiveDB{
  var box=Hive.box("pdp online");

  void storeUser(User user){
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user_2=new User.fromJson(box.get('user'));
    return user_2;
  }

  void removeUser(User user){
    box.delete('user');
  }
}