import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {

  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Name"),
            SizedBox(height: 4,),
            Text("Spider-man", style: _style(),),
            SizedBox(height: 16,),

            Text("Email", style: _style(),),
            SizedBox(height: 4,),
            Text("spidey@avengers.com"),
            SizedBox(height: 16,),

            Text("Location", style: _style(),),
            SizedBox(height: 4,),
            Text("New York, USA"),
            SizedBox(height: 16,),

            Text("Language", style: _style(),),
            SizedBox(height: 4,),
            Text("English, Spanish"),
            SizedBox(height: 16,),

            Text("Occupation", style: _style(),),
            SizedBox(height: 4,),
            Text("Friendly Neighbourhood Superhero"),
            SizedBox(height: 16,),

            Divider(color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget
  with PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 320);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 20,
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              SizedBox(height: 225,),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: new ExactAssetImage('assets/images/userImage.png'),
                          )
                      ),
                    ),
                  ],
                ),
              Column(
                children: <Widget>[
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Name: \t", 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        ),
                      ),
                      Text("Spider-Men", 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Age: \t", 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        ),
                      ),
                      Text("24", 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                    ],
                  ),
                ],
              ),

              ],
            ),

            Align(
              alignment: Alignment(0.99,-0.99),
              child: GestureDetector(
                onTap: (){
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: Transform.rotate(
                    angle: (math.pi * 0.05),
                    child: Container(
                      width: 110,
                      height: 32,
                      child: Center(child: Text("Edit Profile"),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-90);
    p.lineTo(size.width, size.height-30);
    p.lineTo(size.width, 50);
    p.lineTo(0, 50);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}