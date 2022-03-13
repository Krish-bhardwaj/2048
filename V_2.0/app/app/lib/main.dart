
import 'package:app/main2.dart';
import 'package:app/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:app/login.dart';
import 'package:app/logind.dart';
import 'package:app/signup.dart';
import 'package:app/signupd.dart';
import 'package:app/constd.dart';
import 'package:app/constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<Color> bgc = [
    Colors.amber,Colors.black87
  ];
  static const List<Color> bgc1 = [
    Colors.black87,Colors.amber
  ];
  Color quote1 = bgc.last;
  Color quote = bgc1.last;
  ShakeDetector detector;


  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        final newc = (List.of(bgc)
              ..remove(quote)
              ..shuffle())
            .first;
        final newc1 = (List.of(bgc1)
              ..remove(quote1)
              ..shuffle())
            .first;
        setState(() {
          this.quote = newc;
        });
        setState(() {
          this.quote1 = newc1;
        });
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: quote,
        body: SingleChildScrollView(
        
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          color: quote,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,

                  ),)
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp2()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png")
                      
                    )
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if(quote == Colors.amber) 
                      {
                        AppColors.primary1 = quote;
                        AppColors.primary2 = quote1;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      }
                      else{
                        
                        AppColors.primary1 = quote;
                        AppColors.primary2 = quote1;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPaged()));
                      }

                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: quote1
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: quote1,
                        fontWeight: FontWeight.w900,
                        fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      if(quote == Colors.amber) 
                      {
                        AppColors.primary1 = quote;
                        AppColors.primary2 = quote1;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                      }
                      else{
                        AppColors.primary1 = quote;
                        AppColors.primary2 = quote1;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPaged()));
                      }
                    },
                    color: quote1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: quote,
                        fontWeight: FontWeight.w900,
                        fontSize: 18
                      ),
                    ),
                  ),
                SizedBox(height:20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    children: [
                      IconButton(
                      icon: const Icon(Icons.person ),
                      color: quote1,
                      iconSize: 40,
                      onPressed: () {
                        AppColors.primary1 = quote;
                        AppColors.primary2 = quote1;
                        AppColors.primary4 = 1;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                      }
                      ),
                      GestureDetector(
                        onTap: (){
                          AppColors.primary1 = quote;
                          AppColors.primary2 = quote1;
                          AppColors.primary4 = 1;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                        },
                        child: Text(
                          'GUEST',
                          style: TextStyle(
                          color: quote1,
                          fontWeight: FontWeight.w900,
                          fontSize: 18
                          
                        ),
                                          ),
                      ),
                    ],
                  )




                ],

              ),
              
              

            ],
          
          ),
          
        ),
      ),
      );
}