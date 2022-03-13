
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:app/logind.dart';
import 'package:app/main.dart';
import 'package:app/screens/game_screen.dart';
import 'package:app/signupd.dart';

var data1 = [1.1,6.0,4.5,12.8,6.5,4.8,5.3,3.4,11.1,1.6,7.5,12.5,14.7,9.5,13.6,8.5,7.2,11.4,7.2,9.5,5.9,11.7,2.6,9.4,9.1,10.9,13.2,7.2,13.3,5.9];
Material mychart2Items(String title) {
    return Material(
      color: Colors.white30,
      elevation: 5.0,
      borderRadius: BorderRadius.circular(24.0),
      // shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold
                    ),),
                  ),

                  

                  Padding(
                    // padding: EdgeInsets.all(5.0),
                    padding: EdgeInsets.fromLTRB(1, 1, 1, 15),
                    child: new Sparkline(
                      lineColor: Colors.amber,
                      data: data1,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber[800], Colors.amber[200]],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



class Dashboardd extends StatelessWidget {
  @override
  // String name = " KRISH";
  String name = " KRISH";
  String level = " 0";
  Widget build(BuildContext context) {
    return Scaffold(
     

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            // to main screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: Icon(Icons.logout,
          size: 20,
          color: Colors.amber,),


        ),
      ),
      body: Container(
        color: Colors.black87,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:  Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white24,),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                              backgroundColor: Colors.amber ,
                              radius: 100,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 90,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/user.jpg"),
                                  // backgroundImage: NetworkImage(
                                  //     "https://www.donkey.bike/wp-content/uploads/2020/12/user-member-avatar-face-profile-icon-vector-22965342-e1608640557889.jpg"), //NetworkImage
                                  radius: 90,
                                ), //CircleAvatar
                              ), //CircleAvatar
                            ),
                      ),
                      Center(
                          child:
                            Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                                child: Container(
                                  padding: const EdgeInsets.all(0.0),
                                  width: 500.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.amber),
                                  child: Text(
                                    
                                    "  NAME  :"+name,
                                    style: TextStyle(
                                      color:Colors.black87 ,
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal, 
                                      fontWeight: FontWeight.bold
                                      ),
                                      ),
                                ),
                                ),
                                ),
                          Center(
                          child:
                            Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                                child: Container(
                                  padding: const EdgeInsets.all(0.0),
                                  width: 500.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.amber.shade300,),
                                  child: Text(
                                    
                                    "  LEVEL  : "+level,
                                    style: TextStyle(
                                      color:Colors.black87 ,
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal, 
                                      fontWeight: FontWeight.bold
                                      ),
                                      ),
                                ),
                                ),
                                ),
                      Center(
                          child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: mychart2Items("PERFORMANCE"),
                      ),),
                      MaterialButton(
                        minWidth: double.minPositive,
                        height: 50,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                        },
                        color: Colors.amberAccent.shade100,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Text(
                          "         Play         ",
                           style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Colors.black87,
                          

                        ),
                        ),

                      ),
                      ],),
                ), //Container

              ),
        )
      
    );
  }

}

