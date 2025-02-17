import 'package:ecommerce_app/pages/bottomnav.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();

}
class _SignUpState extends State<SignUp> {
String? name, email, password;
TextEditingController namecontroller = new TextEditingController();
TextEditingController mailcontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();

final _formkey= GlobalKey<FormState>();

registration()async{
  if(password!=null && name!=null && email!=null){
    try{
      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Registered Successfully", style: TextStyle(fontSize: 20,),)));
      String Id= randomAlphaNumeric(10);
      await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
      await SharedPreferenceHelper().saveUserId(Id);
      await SharedPreferenceHelper().saveUserName(namecontroller.text);
     // await SharedPreferenceHelper().saveUserImage("https://www.flaticon.com/free-icon/manager_18775901?related_id=18775901&origin=pack");
      Map<String, dynamic> userInfoMap={
        "Name": namecontroller.text,
        "Email": mailcontroller.text,
        "Id": Id,
          "Image":
              "https://www.flaticon.com/free-icon/manager_18775901?related_id=18775901&origin=pack"
      };
      await DatabaseMethod().addUserDetails(userInfoMap, Id);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
    } on FirebaseException catch(e){
      if(e.code=='weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Password provided is too weak", style: TextStyle(fontSize: 20,),)));
      }
      else if(e.code=='email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Account Already exsists", style: TextStyle(fontSize: 20,),)));
      }
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
                  child: Text("Sign Up", style:
                  AppWidget.semiboldTextFeildStyle(),),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text("Please enter the details below ", style:
                  AppWidget.lightTextFeildStyle(),),
                ),
                SizedBox(height:20,),

                Text("Name", style:
                AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please Enter your Name';
                        }

                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Name"),
                    )
                ),
                SizedBox(height:10,),
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
                SizedBox(height:10,),
                Text("Password", style:
                AppWidget.semiboldTextFeildStyle(),),
                SizedBox(height: 5,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      obscureText: true,
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

                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        name= namecontroller.text;
                        email= mailcontroller.text;
                        password= passwordcontroller.text;

                      });
                    }
                    registration();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                      child: Center(child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: AppWidget.lightTextFeildStyle(),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
                        },
                        child: Text("Sign In", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),)),
                  ],)
              ],),
          ),
        ),
      ),
    );
  }
}