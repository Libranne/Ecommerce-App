import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
List categories=[
  "images/headphone_icon.png",
  "images/laptop.png",
  "images/watch.png",
  "images/TV.png",
];




  @override
  Widget build (BuildContext context) {
    return Scaffold (
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Hey, Libra",
                style: AppWidget.boldTextFeildStyle(),
            ),
            Text(
              "Good morning",
              style: AppWidget.lightTextFeildStyle(),
            ),
          ],
        ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset("images/login.png", height: 70, width: 70,fit: BoxFit.cover,))
                ]
        ),
SizedBox(height: 30.0,),
Container(

  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
    width: MediaQuery.of(context).size.width, child: TextField(
  decoration: InputDecoration(border: InputBorder.none, hintText: "Search Products",
      hintStyle: AppWidget.lightTextFeildStyle(), prefixIcon: Icon(Icons.search,color: Colors.black,)),
)),
SizedBox(height: 20.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("Categories",
      style: AppWidget.semiboldTextFeildStyle(),
    ),
    Text("See all",
      style: TextStyle(color: Color(0xff14a7dd), fontSize: 18.0, fontWeight: FontWeight.bold),
    )
  ],
),
              SizedBox(height: 20.0,),
              Row(
                children: [
              Container(
                  height: 130,
              padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            color: Color(0xFF14A7DD), borderRadius: BorderRadius.circular(10)
        ),

        child: Center(
            child: Text(
              "All", style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),))
      ),

                  Expanded(
                    child: Container(

                      height: 130,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return CategoryTile(image: categories[index]);
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products",
                    style: AppWidget.semiboldTextFeildStyle(),
                  ),
                  Text("See all",
                    style: TextStyle(color: Color(0xff14a7dd), fontSize: 18.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),

              SizedBox(height: 20.0,),
              Container(
                height: 240,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                       margin: EdgeInsets.only(right: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Image.asset("images/headphone2.png", height: 150,width: 150,fit: BoxFit.cover,),
                        Text("Headphone", style: AppWidget.semiboldTextFeildStyle(),),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$100",style: TextStyle(color: Color(
                                0xff14a7dd),fontSize: 20.0, fontWeight: FontWeight.bold),),
                            SizedBox(width: 50,),
                            Container(
                              padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Color(
                                    0xff14a7dd), borderRadius: BorderRadius.circular(7)),
                                child: Icon(Icons.add, color: Colors.white,))
                          ],
                        )
                      ],),
                    ),

                    Container(
                      height: 240,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Image.asset("images/watch2.png", height: 150,width: 150,fit: BoxFit.cover,),
                              Text("Apple Watch", style: AppWidget.semiboldTextFeildStyle(),),
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$200",style: TextStyle(color: Color(
                                      0xff14a7dd),fontSize: 20.0, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 50,),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(color: Color(
                                          0xff14a7dd), borderRadius: BorderRadius.circular(7)),
                                      child: Icon(Icons.add, color: Colors.white,))
                                ],
                              )
                            ],),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 240,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Image.asset("images/laptop2.png", height: 150,width: 150,fit: BoxFit.cover,),
                              Text("Laptop", style: AppWidget.semiboldTextFeildStyle(),),
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$1000",style: TextStyle(color: Color(
                                      0xff14a7dd),fontSize: 20.0, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 50,),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(color: Color(
                                          0xff14a7dd), borderRadius: BorderRadius.circular(7)),
                                      child: Icon(Icons.add, color: Colors.white,))
                                ],
                              )
                            ],),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )
      ],
        ),
      ), // Column // Container
    );
  }

}
class CategoryTile extends StatelessWidget {
  String image;
  CategoryTile({required this.image});


  @override
 Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              image,
          height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),

          Icon(Icons.arrow_forward)
        ],
      )
    );
  }
}