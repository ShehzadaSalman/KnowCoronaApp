import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ez_localization/ez_localization.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
// initializing the states as the page gets loaded
  @override
  void initState() {
    fetchCoronaStat();
    super.initState();
  }

  bool isSatLoading = true;
  int infectedNumber;
  int testedNumber;
  int recoveredNumber;
  int deceasedNumber;
  double percentageDeaths;
  double percentageRecovered;

  fetchCoronaStat() async {
    String coronaURL =
        "https://api.apify.com/v2/key-value-stores/QhfG8Kj6tVYMgud6R/records/LATEST?disableRedirect=true";
    var response = await http.get(coronaURL);
    var body = response.body;

    var result = json.decode(body);

    setState(() {
      infectedNumber = result['infected'];
      testedNumber = result['tested'];
      deceasedNumber = result['deceased'];
      recoveredNumber = result['recovered'];

// percentages of deaths
      percentageDeaths = (deceasedNumber / infectedNumber) * 100;
// percentages of recovered
      percentageRecovered = (recoveredNumber / infectedNumber) * 100;

      if (percentageRecovered != null) {
        isSatLoading = false;
      } else {
        // do nothing
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            // *? This is the Column A
            child: Column(children: [
              //*? This is the Child A-1 */
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        EzLocalizationBuilder.of(context)
                            .changeLocale(nextLocale);
                      },
                      child: Image(
                        height: 50,
                        image: AssetImage('Images/language.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                  ]),

              // *? This is child  Column A-2

              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // *? This is the child column A-2.1
                      Container(
                        child: Column(children: [
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
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),

                      // *? This is the child column A-2.2
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Color(0xFF6FCF97),
                                padding: EdgeInsets.symmetric(vertical: 25),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/survey');
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  context.getString('Purify'),
                                  style: TextStyle(
                                    fontFamily: "Seg",
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    inherit: false,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Color(0xFFFFFFFF),
                                padding: EdgeInsets.symmetric(vertical: 25),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/blog');
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  context.getString('Inspire'),
                                  style: TextStyle(
                                    fontFamily: "Seg",
                                    fontSize: 30.0,
                                    color: Color(0xFF6FCF97),
                                    fontWeight: FontWeight.bold,
                                    inherit: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // *? This is the child column of A-2.3
                      Container(
                          child: InkWell(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.fromLTRB(40, 5, 40, 0),
                          padding: EdgeInsets.fromLTRB(10, 20, 5, 20),
                          child: isSatLoading
                              ? Center(child: CircularProgressIndicator())
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: context.getString(
                                                            'Active') +
                                                        ': ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                TextSpan(
                                                    text: infectedNumber
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFF2994A),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                    text: '/' +
                                                        testedNumber.toString(),
                                                    style:
                                                        TextStyle(fontSize: 10))
                                              ])),
                                          SizedBox(height: 10),
                                          RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                  text: context
                                                          .getString('Deaths') +
                                                      ': ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: deceasedNumber
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFEB5757),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                    text: '/(' +
                                                        percentageDeaths
                                                            .toStringAsFixed(
                                                                2) +
                                                        '%)',
                                                    style:
                                                        TextStyle(fontSize: 10))
                                              ])),
                                          SizedBox(height: 10),
                                          RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                  text: context.getString(
                                                          'Recovered') +
                                                      ': ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: recoveredNumber
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFEB5757),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                    text: '/(' +
                                                        percentageRecovered
                                                            .toStringAsFixed(
                                                                2) +
                                                        '%)',
                                                    style:
                                                        TextStyle(fontSize: 10))
                                              ])),
                                        ],
                                      ),

                                      Expanded(
                                        child: Image(
                                          image: AssetImage(
                                            'Images/Vector-2.png',
                                          ),
                                        ),
                                      )
                                      // *? This is the Pakistan flag
//                        Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              child:  Image(
//                                image: AssetImage('Images/Vector-2.png',
//                                ),
//                              )
//                            )
//                          ]
//
//                        ),
                                    ]),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(17.0),
                            ),
                          ),
                        ),
                      ))
                    ]),
              ),
              // *? The child column A-2 ends here
            ]),
            // *? First PArent Column A-1 ends here
          )),
    );
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
// flutter pub run change_app_package_name:main com.ovexsol.knowcorona
