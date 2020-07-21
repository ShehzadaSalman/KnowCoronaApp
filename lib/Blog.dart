import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}



class _BlogPageState extends State<BlogPage> {

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
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

                  ],
                ),
              )
          ),
          Expanded(
            child: WebView(
              initialUrl: 'https://shahzada.website/SocialFeedCorona/',
              javascriptMode: JavascriptMode.unrestricted,  
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
            ),
          ),
        ],
      ),
    );
  }
}

