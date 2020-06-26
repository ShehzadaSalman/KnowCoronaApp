import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class SurvivorOverview extends StatefulWidget {
  const SurvivorOverview({Key key}) : super(key: key);

  @override
  _SurvivorOverviewState createState() => _SurvivorOverviewState();
}

class _SurvivorOverviewState extends State<SurvivorOverview> {
  SharedPreferences sharedPreferences;
  int sectionsCompleted = 0;
  bool varHydratedCheck;
  bool testVariable;
  bool testVariabletwo;
  bool testVariablethree;
  bool testVariablefour;
  bool testVariablefive;
//  bool hydratedValue = false;
//  bool sneezeValue = false;
//  bool socialValue = false;
//  bool tissueValue = false;
//  bool washingValue = false;

  @override
  void initState() {
    initializeSharedPreferences();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SizedBox(height: 20),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runSpacing: 20.0,
                    children: <Widget>[
                      coronaBadges('Images/Group-2.png', testVariable, '/survey',context),
                      coronaBadges('Images/Group-91.png', testVariablefive,'/washing', context),
                      coronaBadges('Images/Group-93.png', testVariablefour,  '/tissue', context),
                      coronaBadges('Images/Group-90.png', testVariabletwo,'/hydration', context),
                      coronaBadges('Images/Group-1.png', testVariablethree, '/sneeze',context),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text('$sectionsCompleted/5', style: TextStyle(
                    fontFamily: 'Seg',
                    color: Color(0xFF4F4F4F),
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
                                  children: [
                                    TextSpan(text: 'Trooper\n', style: TextStyle(
                                      color: Color(0xFF219653), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'You know the basics about the virus and can protect yourself from getting it')
                                  ]
                              ),

                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              height: 100,
                              image: AssetImage('Images/ArmyBadge1.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
                                  children: [
                                    TextSpan(text: 'Lieutenant\n', style: TextStyle(
                                      color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Your advanced knowledge allows you to protect yourself and others')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              height: 100,
                              image: AssetImage('Images/ArmyBadge2.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
                                  children: [
                                    TextSpan(text: 'General\n', style: TextStyle(
                                      color: Color(0xFF9B51E0), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Your perfect scores make you the best living weapon against COVID-19')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              height: 100,
                              image: AssetImage('Images/ArmyBadge3.png')
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                ]

            ),
          ),
        ),
      ),
    );


  }

//   checkHydrated() async{
//     sharedPreferences = await SharedPreferences.getInstance();
//
//      hydratedValue = sharedPreferences.getBool('stayHydratedCompleted');
//      sneezeValue = sharedPreferences.getBool('sneezeSectionCompleted');
//      socialValue = sharedPreferences.getBool('socialDistanceCompleted');
//      tissueValue = sharedPreferences.getBool('tissueHandlingCompleted');
//      washingValue = sharedPreferences.getBool('washingHandsCompleted');
//  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<bool> allSectionsCompleted = new List();
    allSectionsCompleted.add(sharedPreferences.getBool('stayHydratedCompleted'));
    allSectionsCompleted.add(sharedPreferences.getBool('sneezeSectionCompleted'));
    allSectionsCompleted.add(sharedPreferences.getBool('socialDistanceCompleted'));
    allSectionsCompleted.add(sharedPreferences.getBool('tissueHandlingCompleted'));
    allSectionsCompleted.add(sharedPreferences.getBool('washingHandsCompleted'));

    if(sharedPreferences.getBool('stayHydratedCompleted') != null){
      testVariabletwo = true;
    }else{
      testVariabletwo = false;
    }


  if(sharedPreferences.getBool('sneezeSectionCompleted') != null){
    testVariablethree = true;
  } else{
    testVariablethree = false;
  }


if(sharedPreferences.getBool('socialDistanceCompleted')  != null){
  testVariable = true;
    }else{ testVariable = false; }


       if(sharedPreferences.getBool('tissueHandlingCompleted') != null){
         testVariablefour = true;
       }else{
         testVariablefour = false;
       }



    if(sharedPreferences.getBool('washingHandsCompleted') != null){
      testVariablefive = true;
    }else{testVariablefive = false; }





    allSectionsCompleted.forEach((isSectionCompleted) {

         if(isSectionCompleted != null){
           if(isSectionCompleted == true){
             sectionsCompleted++;
           }
         }

//      if(isSectionCompleted != null){
//        if(isSectionCompleted){
//          // do nothing, move to next
//        } else{
//          allSectionsCompleted = false;
//        }
//      } else{
//        allSectionsCompleted = false;
//      }
      print('Is the Section completed: ' + isSectionCompleted.toString());

    });

    setState(() {
    });

  }
}

Widget coronaBadges(String imgAddress, bool borderColor, String routeName, BuildContext  context){

    bool _decidecolor = false;
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        height: 55,
        width: 85,
        child:
        Image(image: AssetImage(imgAddress),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFE3E6EC),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: borderColor
                    ? Color(0xFF6FCF97)
                    : Color(0xFFE3E6EC),

                spreadRadius: 3),
          ],

        ),
      ),
    );

}

