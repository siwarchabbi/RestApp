import 'package:flutter/material.dart';
import 'package:restouapp/RouteGenerators.dart';
class LoginScreen extends StatefulWidget {
  @override
  _Login createState() => _Login();
}
final unameController = TextEditingController();
final passController = TextEditingController();
String uname = "siwarchabbi@gmail.com";
String pass = "siwar 123";

class _Login extends State<LoginScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body:SingleChildScrollView(
        child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 40),
                child: Text("Welcome To The \n  Recette Page",style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w400),),
              )

              ,         Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign In",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w400),),

                    SizedBox(height: 15,),
                    TextField(
                      controller: unameController,
                      decoration: InputDecoration(
                        hintText: "E-mail",

                      ),
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      controller: passController,
                      obscureText: hide,
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon:IconButton(onPressed: (){
                            setState(() {
                              hide = !hide;
                            });
                          },icon:hide?Icon(Icons.visibility_off):Icon(Icons.visibility),)
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){},child: Text("Forget?"),),
                    ),
                    Center(
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 60)
                          ),
                          onPressed: (){
                            if (uname == unameController.text &&
                                pass == passController.text)
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>  salut()));
                          }, child: Text("Sign In")),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}