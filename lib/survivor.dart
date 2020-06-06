import 'package:flutter/material.dart';


class SurvivorOverview extends StatelessWidget {
  const SurvivorOverview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: 
      SafeArea(
        left: true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image(image: AssetImage('Images/Group.png'),),
              ),
              ]
              ),
          SizedBox(height: 20),
          Text('Guess all the Tips to fight COVID-19 and discover what type of survivor you are',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 23,
            fontFamily: 'Seg',
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold
          ),
          ),
          Row(
            children: <Widget>[
         
            ],
          ) 
            ]
          
        ))
      )     
    );


  }
}