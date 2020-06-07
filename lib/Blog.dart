import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
               child:  Align(
              alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image(image: AssetImage('Images/Vector.png'),),
                      ),
                      SizedBox(height: 10, width: 10,)
                    ],
                  ),
               )
              ),

            SizedBox(height: 30),
               Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('#CovidDoctors',
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Seg',
                                fontSize: 21,
                              )),
                          Image(image: AssetImage('Images/doctor.png'),)
                        ],
                      ),
                    ),
               SizedBox(height: 30),
               Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Image(image: AssetImage('Images/secondblog.png'),)
                        ],
                      ),
                    ),


              ],
            ),
          ),
        )

      )
    );
  }
}

