import 'package:awesome_icons/awesome_icons.dart';
import 'package:database_1/pages/sign_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../model/user_model.dart';
import '../servis/hive_servis.dart';

class HomePage extends StatefulWidget {
  static final String id="HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var userController=TextEditingController();
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
                    SizedBox(height: MediaQuery.of(context).size.height/5,),
                    //#images
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: AssetImage("assets/images/ic_portrait.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    //#text
                    Text("Welcome BAck!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),

                    SizedBox(height: 15,),

                    Text("Sign in to continuo", style: TextStyle(color: Colors.white),),
                  ],
                ),

                SizedBox(height: 60,),

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

                    SizedBox(height: 20,),

                    //#forgot
                    GestureDetector(
                      onTap: (){
                        print("Dasturda muommo yuq!");
                      },
                      child: Text("Forgot password", style: TextStyle(color: Colors.grey),),
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
                    Text("Don't have an account?", style: TextStyle(color: Colors.grey[600]),),

                    SizedBox(width: 5,),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SignPage.id);
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
