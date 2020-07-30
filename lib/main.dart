import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowcorona/sneeze.dart';
import 'package:knowcorona/social-dist.dart';
import 'package:knowcorona/survivor.dart';
import 'package:knowcorona/tissue-handling.dart';
import 'package:knowcorona/translation.dart';
import 'package:knowcorona/washing-hands.dart';
import 'hydration.dart';
import 'start.dart';
import 'package:knowcorona/loading.dart';
import 'Blog.dart';
import 'result.dart';
import 'package:ez_localization/ez_localization.dart';

//void main() => runApp(
//
//  DevicePreview(
//    builder: (context) => MyApp(),
//  ),
//);
//
// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyApp(),
//     ));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     initialRoute: '/',
  //     routes: {
  //       '/': (context) => LoadingPage(),
  //       '/home': (context) => MyHomePage(),
  //       '/start': (context) => StartPage(),
  //       '/blog': (context) => BlogPage(),
  //       '/survey': (context) => SocialDistance(),
  //       '/hydration': (context) => Hydration(),
  //       '/sneeze': (context) => Sneeze(),
  //       '/tissue': (context) => TissueHandling(),
  //       '/washing': (context) => WashingHands(),
  //       '/survivor': (context) => SurvivorOverview(),
  //       '/result': (context) => ResultPage(),
  //       '/translate': (context) => Translate(),
  //     },
  //     debugShowCheckedModeBanner: false,
  //     title: 'Welcome to KnowCorona',
  //   );
  // }

// new method for doing localization
  @override
  Widget build(BuildContext context) => EzLocalizationBuilder(
        delegate: EzLocalizationDelegate(
          supportedLocales: [
            Locale('en'),
            Locale('ur'),
            Locale('fr'),
            Locale('es')
          ],
        ),
        builder: (context, localizationDelegate) => MaterialApp(
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            // '/': (context) => _EzLocalizationDemoApp(),
            '/': (context) => LoadingPage(),
            '/home': (context) => MyHomePage(),
            '/start': (context) => StartPage(),
            '/blog': (context) => BlogPage(),
            '/survey': (context) => SocialDistance(),
            '/hydration': (context) => Hydration(),
            '/sneeze': (context) => Sneeze(),
            '/tissue': (context) => TissueHandling(),
            '/washing': (context) => WashingHands(),
            '/survivor': (context) => SurvivorOverview(),
            '/result': (context) => ResultPage(),
            '/translate': (context) => Translate(),
          },
          title: 'Welcome to knowcorona',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationDelegate.localizationDelegates,
          supportedLocales: localizationDelegate.supportedLocales,
          localeResolutionCallback:
              localizationDelegate.localeResolutionCallback,
        ),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(
        'If your language is set to French or Spanish, here\'s the word "Hello !" in your language :');
    print(context.getString('hello'));
    print('(Otherwise it should display a simple "Hello !".)');

    Locale nextLocale = _getNextLocale(context);

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // This is the first child column
                Column(children: [
                  Image(
                    image: AssetImage('Images/virus.png'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    context.getString('OneTitle'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Seg',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),

                Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        GestureDetector(
                          onVerticalDragStart: (DragStartDetails details) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => StartPage()),
                            );
                          },
                          // onTap: (){
                          //   Navigator.push(
                          //         context,
                          //         CupertinoPageRoute(
                          //           builder: (context) => StartPage()),
                          //       );
                          // },

                          child: Image(
                            image: AssetImage('Images/flagtwo.png'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            EzLocalizationBuilder.of(context)
                                .changeLocale(nextLocale);
                          },
                          child: Image(
                            image: AssetImage('Images/language.png'),
                          ),
                        ),
                        Positioned(
                            bottom: 8,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => StartPage()),
                                );
                              },
                              child: Image(
                                image: AssetImage('Images/arrow.png'),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 0),
                  ],
                ),

                // This is the second child stack
              ]),
        )),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  /// Returns the next locale to switch on.
  Locale _getNextLocale(BuildContext context) {
    String lang = EzLocalization.of(context).locale.languageCode;
    switch (lang) {
      case 'en':
        return Locale('ur');
      case 'ur':
        return Locale('en');
      // case 'es':
      //   return Locale('fr');
    }
    return null;
  }
}
