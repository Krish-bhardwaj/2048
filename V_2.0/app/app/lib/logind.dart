import 'package:flutter/material.dart';
import 'package:app/dashboardd.dart';
import 'package:app/main.dart';
class LoginPaged extends StatelessWidget {
  
  @override
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size: 20,
          color: Colors.amber,),


        ),
      ),
      body: Container(
        color: Colors.black87,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("LOGIN",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.amber),),
                    SizedBox(height: 20,),
                    Text("",
                    style: TextStyle(
                      fontSize: 15,
                    color:Colors.amber),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email"),
                      inputFile(label: "Password", obscureText: true)
                    ],
                  ),
                ),
                  Padding(padding:
                  EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.amber),
                            top: BorderSide(color: Colors.amber),
                            left: BorderSide(color: Colors.amber),
                            right: BorderSide(color: Colors.amber),

                          )



                        ),
                      child: MaterialButton(

                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboardd()));
                        },
                        color: Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN     ", 
                              style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.amber,

                            ),
                            ),
                            Icon(Icons.login,color: Colors.amber,)
                          ],
                          
                        ),

                      ),
                    ),
                  ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(""),
                    Text(" ", 
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,

                    ),
                    )
                  ],
                ),

                // Container(
                //   padding: EdgeInsets.only(top: 100),
                //   height: 200,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/background.png"),
                //       fit: BoxFit.fitHeight
                //     ),

                //   ),
                // )

              ],
            ))
          ],
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.amber
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber
            ),

          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            
          )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
