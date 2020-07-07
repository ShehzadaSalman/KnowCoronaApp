import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  SharedPreferences sharedPreferences;
  double totalMarks = 0.0;

 void fbTrooper() async{
  const url = 'https://www.facebook.com/profilepicframes/?selected_overlay_id=685715425609850';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
 }
 
 void fbLeuitenant() async{
  const url = 'https://www.facebook.com/profilepicframes/?selected_overlay_id=1108876776166062';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
 }
 
 void fbGeneral() async{
  const url = 'https://www.facebook.com/profilepicframes/?selected_overlay_id=580650669260525';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
 }
 
  @override
  void initState() {
    initializeSharedPreferences();
    super.initState();
  }

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    if(totalMarks < 6){
      return Scaffold(
        key: globalKey,
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
                    Text('CONGRATULATIONS! \n You are now a',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('COVID-TROOPER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF219653),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),

                    Text('${totalMarks.round()}/10', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF219653),
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Correct guesses', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF27AE60),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 21 ),
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
                                image: AssetImage('Images/one.png')
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Download this badge to your phone')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){   
                                 final snackBar = SnackBar(content: Text('The badge has been saved'));
                                 globalKey.currentState.showSnackBar(snackBar);       
                                downloadImageToLocalStorage('Images/one.png');
                                
                              },
                              child: Image(
                                  image: AssetImage('Images/green-badge.png')
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Add this Official Badge to your Facebook profile picture')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                             fbTrooper();
                              },
                              child: Image(
                                image: AssetImage('Images/facebook-badge.png')
                            ),
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

    }else if (totalMarks < 10){
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
                    Text('CONGRATULATIONS! \n You are now a',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('COVID-Lieutenant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF2F80ED),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),

                    Text('${totalMarks.round()}/10', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF219653),
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Correct guesses', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF27AE60),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 21 ),
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
                                image: AssetImage('Images/two.png')
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Download this badge to your phone')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                downloadImageToLocalStorage('Images/two.png');
                        

                              },
                              child: Image(
                                image: AssetImage('Images/green-badge.png')
                            ),
                            )
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Add this Official Badge to your Facebook profile picture')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                fbLeuitenant();
                              },
                              child: Image(
                                image: AssetImage('Images/facebook-badge.png')
                            ),
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
    else if(totalMarks == 10){
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
                    Text('CONGRATULATIONS! \n You are now a',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('COVID-General',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Seg',
                          color: Color(0xFF9B51E0),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),

                    Text('${totalMarks.round()}/10', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF219653),
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Correct guesses', style: TextStyle(
                      fontFamily: 'Seg',
                      color: Color(0xFF27AE60),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 21 ),
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
                                image: AssetImage('Images/three.png')
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF9B51E0), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Download this badge to your phone')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                downloadImageToLocalStorage('Images/three.png');
                              },
                              child: Image(
                                image: AssetImage('Images/green-badge.png')
                            ),
                            )
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                    children: [
                                      TextSpan(text: '', style: TextStyle(
                                        color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                      )),
                                      TextSpan(text: 'Add this Official Badge to your Facebook profile picture')
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                fbGeneral();
                              },
                              child: Image(
                                image: AssetImage('Images/facebook-badge.png')
                            ),
                            )
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



  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    totalMarks = sharedPreferences.getDouble('totalMarks');
    print('totalMarks - from SharedPreferences : ' + totalMarks.round().toString());

    setState(() {

    });
  }

  void downloadImageToLocalStorage(String path) async {
    File file = await getImageFileFromAssets(path);
//    print('path of image file to be downloaded to local' + file.path);
    GallerySaver.saveImage(file.path).then((path) {
      print('image saved to gallery');
    });
//    var newDirectoryPath = await getExternalStorageDirectory();
//    new Directory('$newDirectoryPath/knowCorona').create(recursive: true)
//        .then((value) {
//      print(value.path);
//    });
  }

  Future<File> getImageFileFromAssets(String path) async {
//    print('path given : ' + path);
    final byteData = await rootBundle.load(path);
//    print('size of image file in bytes : ' + byteData.lengthInBytes.toString());

//    await getTemporaryDirectory().then((value) {
//      print('what is this? : ' + value.path + '/$path');
//    });

//    final file = File('${(await getTemporaryDirectory()).path}/$path');
    final directory = await getApplicationDocumentsDirectory();

//    var newDirectoryPath = await getExternalStorageDirectory();
//    print('new directory path : ' + newDirectoryPath.toString());

    final file = File('${directory.path}/myimage1.png');
    print('new file path : ' + file.path);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//

 

    return file;
    



  }
}
