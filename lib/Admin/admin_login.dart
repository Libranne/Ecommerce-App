import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Admin/home_admin.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});


  @override
  State<AdminLogin> createState() => _AdminLoginState();

}
class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller= new TextEditingController();
  TextEditingController userpasswordcontroller= new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("images/login.png",height: 250,)),
                Center(
                  child: Text("Admin Panel", style:
                  AppWidget.semiboldTextFeildStyle(),),
                ),
                SizedBox(height: 10,),



                Text("Username", style:
                AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(

                      controller: usernamecontroller,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Name"),
                    )
                ),
                SizedBox(height:10,),


                Text("Password", style:
                AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      obscureText: true,

                      controller: userpasswordcontroller,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Password"),
                    )
                ),

                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){

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

              ],),
          ),
        ),

    );
  }

  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach( (result){
        if(result.data()['username']!=usernamecontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Your id is not correct", style: TextStyle(fontSize: 20,),)));
        }
        else  if(result.data()['password']!=userpasswordcontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Your password is not correct", style: TextStyle(fontSize: 20,),)));

        }
        else
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeAdmin()));
          }
      });
    });
  }
}