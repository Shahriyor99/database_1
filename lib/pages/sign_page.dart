import 'package:database_1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../model/user_model.dart';
import '../servis/hive_servis.dart';

class SignPage extends StatefulWidget {
  static final String id="SignPage";

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  var userController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();

  void _doLogIn(){
    String user=userController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    User user_1= User.from(name: user, password: password);

    HiveDB().storeUser(user_1);

    var user_2=HiveDB().loadUser();

    print(user_2.name);
    print(user_2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF1A237E),
          child: SingleChildScrollView(
            child: Container(
              padding:  EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //#header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:  MainAxisAlignment.end,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/6,),

                      //#text
                      Text("Create", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),

                      SizedBox(height: 15,),

                      Text("Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                    ],
                  ),

                  SizedBox(height: 55,),

                  //#body
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //#user name
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: userController,
                        decoration: InputDecoration(
                          icon: Icon(LineAwesomeIcons.user,color: Colors.grey,),
                          hintText: "user name",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 20,),

                      //#email
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(LineAwesomeIcons.envelope,color: Colors.grey,),
                          hintText: "email",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 20,),

                      //#phone
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: phoneController,
                        decoration: InputDecoration(
                          icon: Icon(LineAwesomeIcons.phone,color: Colors.grey,),
                          hintText: "phone",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 20,),

                      //#password
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        decoration: InputDecoration(
                          icon: Icon(LineAwesomeIcons.key,color: Colors.grey,),
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 40,),

                      //#icon
                      FlatButton(
                        onPressed: (){
                          _doLogIn();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_forward_outlined, color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 100,),

                  //#sign
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(color: Colors.grey[600]),),

                      SizedBox(width: 5,),

                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context, HomePage.id);
                        },
                        child: Text("SIGN UP", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
