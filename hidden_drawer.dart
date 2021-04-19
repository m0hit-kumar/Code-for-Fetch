import 'package:flutter/material.dart';

void main() => runApp(MyApp());
const Color cool = Color(0xFF181A2F);
const Color avtar_backGround = Color(0xFF2FCB72);
const Color avtar_backGround1 = Color(0xFF0C3329);
const Color prof_Card = Color(0xFF196F3D);
const Color grade1 = Color(0xFF00b09b);
const Color grade2 = Color(0xFF96c93d);
const clickedColor = Color(0xFF0C3329);
const unclickedColor = Color(0xFF196F3D);
Color probtn = Color(0xFF0C3329);
Color leadbtn = Color(0xFF196F3D);
Color x = Color(0xff40878b);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,40.0,0.0,0.0),
          child: ListView(padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: avtar_backGround1,
                  ),
                  title: Text(
                    'Sundhar Pichai',
                    style: TextStyle(
                        color: cool, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(width: 70,height: 1,color: Colors.grey[300],),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),              Container(width: 70,height: 1,color: Colors.grey[300],),

                ListTile(
                  leading: Icon(Icons.leaderboard_rounded),
                  title: Text(
                    "Leaderboard",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),              Container(width: 70,height: 1,color: Colors.grey[300],),

                ListTile(
                  leading: Icon(Icons.comment),
                  title: Text(
                    "About",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),              Container(width: 70,height: 1,color: Colors.grey[300],),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    "Contact",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),              Container(width: 70,height: 1,color: Colors.grey[300],),
                SizedBox(
                  height: 100,
                ),

                ListTile(
                    leading:CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.logout,color: Colors.black,),
                    )
                ),


              ]
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(


        onTap: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            isDrawerOpen = false;
          });
        },
        onHorizontalDragStart:(DragStartDetails details){
          print("");
          print("horizontalxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          print(details);


        },
        onVerticalDragStart:(DragStartDetails details){
          print("");
          print("verticle");
          print(details);
        },
        onHorizontalDragUpdate:(DragUpdateDetails details){
          print("");
          print("update horizontal");
          print(details);
          print("//////////////////global");
          print(details.globalPosition);
          print(details.globalPosition.dx);
          print(details.globalPosition.dy);
          print(details.globalPosition.direction);
          print("//////////////////local");
          print(details.localPosition);
          print(details.localPosition.dx);
          print(details.localPosition.dy);
          print(details.localPosition.direction);

          print("//////////////////delta");
          print(details.delta);
          print(details.delta.dx);
          print(details.delta.dy);
          print(details.delta.direction);
          if(details.delta.dx >0)
          {
            setState(() {
              xOffset = 290;
              yOffset = 80;
              isDrawerOpen = true;
            });
          }
          else {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              isDrawerOpen = false;
            });
          }

        },
        onVerticalDragUpdate:(DragUpdateDetails details){
          print("");
          print("update verticle");
          print(details);

        },
        child: AnimatedContainer(

          decoration: BoxDecoration(borderRadius: isDrawerOpen
              ? BorderRadius.circular(28.0)
              : BorderRadius.circular(0.0),
            color:avtar_backGround1,
          ),
          duration: Duration(milliseconds: 200),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          child:
          isDrawerOpen
              ? GestureDetector(
            child:
            Icon(Icons.arrow_back_ios, color: Colors.grey[200]),
            onTap: () {
              setState(() {
                xOffset = 0;
                yOffset = 0;
                isDrawerOpen = false;
              });
            },
          )
              : GestureDetector(
            child: Icon(Icons.menu, color: Colors.grey[200]),
            onTap: () {
              setState(() {
                xOffset = 290;
                yOffset = 80;
                isDrawerOpen = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
