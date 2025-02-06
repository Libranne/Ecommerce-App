import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();

}
class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none, hintText: "Email"),
                )
            ),

            Text("Password", style:
            AppWidget.semiboldTextFeildStyle(),),
            SizedBox(height: 5,),
            Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                child: TextField(
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
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: AppWidget.lightTextFeildStyle(),),
                Text("Sign Up", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),),
              ],)
          ],),
      ),
    );
  }
}