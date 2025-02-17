import 'package:ecommerce_app/pages/bottomnav.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});


  @override
  State<LogIn> createState() => _LogInState();

}
class _LogInState extends State<LogIn> {

  String email="",password="";


  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey= GlobalKey<FormState>();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
    } on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("No user found for that Email", style: TextStyle(fontSize: 20,),)));
      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Wrong Password provided by user", style: TextStyle(fontSize: 20,),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(child: Image.asset("images/login.png",height: 250,)),
              Center(
                child: Text("Sign In", style:
                  AppWidget.semiboldTextFeildStyle(),),
              ),
              SizedBox(height: 10,),
              Text("Please enter the details below to\n                      continue", style:
              AppWidget.lightTextFeildStyle(),),
                SizedBox(height:20,),
              Text("Email", style:
              AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return 'Please Enter your Email';
                                }

                                return null;
                              },
                              controller: mailcontroller,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Email"),
                    )
                ),
                    
                Text("Password", style:
                AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please Enter your Password';
                        }

                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Password"),
                    )
                ),
                    SizedBox(height: 10,),
                    Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot Password?", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),),
            ],
                    ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email= mailcontroller.text;
                        password= passwordcontroller.text;
                      });
                    }
                    userLogin();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                      child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Don't have an account?", style: AppWidget.lightTextFeildStyle(),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),)),
                ],)
            ],),
          ),
        ),
      ),
    );
  }
}