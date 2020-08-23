import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SurveyTitle.dart';
import 'QuizHelper.dart';
import 'package:http/http.dart' as http;
import 'package:ez_localization/ez_localization.dart';

class SocialDistance extends StatefulWidget {
  SocialDistance({Key key}) : super(key: key);

  @override
  _SocialDistanceState createState() => _SocialDistanceState();
}

class _SocialDistanceState extends State<SocialDistance> {
  String apiURL = "https://knowcorona19.com/api/urduquizsocial";
  // String apiURL = "http://shahzada.website/covid/public/api/newApi";

  List<String> answerSelected;
  List<int> sliderStatList;
  List<bool> submitEnabled;
  List<bool> submitPressed;
  List<bool> questionAttempted;

  bool socialDistanceCompleted = false;
  bool sliderSubmitStatus = false;
  int correctAttempted = 0;
  double socialDistanceMarks = 0.0;
  SharedPreferences sharedPreferences;
  QuizHelper quizHelper;
  String lang;
  int quizIndex = 0;
  @override
  void initState() {
    answerSelected = List();
    submitEnabled = List();
    submitPressed = List();
    questionAttempted = List();

    // do something here
    fetchQuiz();
    initializeSharedPreferences();
    super.initState();
  }

  storestat(
      int clicked, String postID, String optionTitle, bool isRight) async {
    String postURL = "https://knowcorona19.com/api/storestat";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"post" : "$postID" , "stat":  "$clicked",  "urdu": "$lang", "title": "$optionTitle", "isRight" : "$isRight"}';
    try {
      http.Response response =
          await http.post(postURL, headers: headers, body: json);
      print(response.body);
    } catch (err) {
      print('Error sending data to the api for option stats');
    }
  }

  fetchQuiz() async {
    // get the response from the api
    var response = await http.get(apiURL);
    // get the body part from the api request
    var body = response.body;

    // decode the json request
    var json = jsonDecode(body);
    // set State to create a QuizHelper class object from the json.
    lang = EzLocalization.of(context).locale.languageCode;
    if (lang == 'en') {
      setState(() {
        quizHelper = QuizHelper.fromJson(json);
        quizHelper.results.forEach((results) {
          results.incorrectAnswers.add(results.correctAnswer);
//
          results.incorrectStats.add(results.correctStat);
          for (int i = 0; i < results.incorrectAnswers.length; i++) {
            AnswersWithStats answersWithStats = AnswersWithStats();
            answersWithStats.answers = results.incorrectAnswers[i];
            answersWithStats.stats = results.incorrectStats[i];
            results.allAnswersWithStats.add(answersWithStats);
            results.totalStatsCount =
                results.totalStatsCount + int.parse(results.incorrectStats[i]);
          }
          results.allAnswersWithStats.shuffle();
          answerSelected.add('');
          submitEnabled.add(false);
          submitPressed.add(false);
          questionAttempted.add(false);
        });
//          quizHelper.results[0].incorrectAnswers.add(
//              quizHelper.results[0].correctAnswer
//      );
//      quizHelper.results[0].incorrectAnswers.shuffle();
      });
    } else {
      setState(() {
        quizHelper = QuizHelper.fromJson(json);
        quizHelper.results.forEach((results) {
          results.urduOptions.add(results.correctUrdu);
//            results.incorrectAnswers.shuffle();
          results.incorrectStats.add(results.correctStat);
          for (int i = 0; i < results.urduOptions.length; i++) {
            AnswersWithStats answersWithStats = AnswersWithStats();
            answersWithStats.answers = results.urduOptions[i];
            answersWithStats.stats = results.incorrectStats[i];
            results.allAnswersWithStats.add(answersWithStats);
            results.totalStatsCount =
                results.totalStatsCount + int.parse(results.incorrectStats[i]);
          }
          results.allAnswersWithStats.shuffle();
          answerSelected.add('');
          submitEnabled.add(false);
          submitPressed.add(false);
          questionAttempted.add(false);
        });
//          quizHelper.results[0].incorrectAnswers.add(
//              quizHelper.results[0].correctAnswer
//      );
//      quizHelper.results[0].incorrectAnswers.shuffle();
      });
    }
  }

  // The method to check the right answer of the quiz
  bool checkAnswer(answer, index) {
    String correctAnswer;
    bool isAnswerCorrect = false;
    if (lang == 'en') {
      correctAnswer = quizHelper.results[index].correctAnswer;
    } else {
      correctAnswer = quizHelper.results[index].correctUrdu;
    }

    setState(() {
      if (correctAnswer == answer) {
        print('Correct answer');
        isAnswerCorrect = true;
      } else {
        print('Wrong Answer');
      }
    });
    return isAnswerCorrect;
  }

  var optionColor = false;

  Color c = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    if (quizHelper != null) {
      return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage('Images/Vector.png'),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/survivor');
                        },
                        child: Image(
                          image: AssetImage('Images/rewardtab.png'),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              SurveyCarousel(),
              SizedBox(height: 30),
              SurveyInformation(),
              SurveyTitleQuestion(),
              SizedBox(height: 40),
              Center(
                  child: Container(
                width: 270,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                      (index) => Text("${index}m",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Seg',
                              color: Color(0xFF828282))),
                    )),
              )),

              CoronaSlider(),
              // Stats for the slider

              SizedBox(height: 50),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: quizHelper.results.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                lang.compareTo('en') == 0
                                    ? quizHelper.results[index].question
                                    : quizHelper.results[index].questionUrdu,
                                style:
                                    TextStyle(fontSize: 20, fontFamily: 'Seg'),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: quizHelper.results[index].incorrectAnswers.map((f){
                                  children: quizHelper
                                      .results[index].allAnswersWithStats
                                      .map((f) {
                                    Color color;
                                    Color percentageColor;
                                    Icon icon = Icon(
                                      Icons.do_not_disturb_on,
                                      color: Color(0xFFF58A97),
                                      size: 25.0,
                                    );
                                    if (submitPressed[index]) {
                                      if (lang == 'en') {
                                        if (f.answers.compareTo(quizHelper
                                                .results[index]
                                                .correctAnswer) ==
                                            0) {
                                          color = Color(0xFF6FCF97);
                                          percentageColor = Color(0xFF6FCF97);
                                          icon = Icon(
                                            Icons.check_circle,
                                            color: Color(0xFF6FCF97),
                                            size: 25.0,
                                          );
                                        } else if (f.answers.compareTo(
                                                answerSelected[index]) ==
                                            0) {
                                          color = Color(0xFFF58A97);
                                          percentageColor = Color(0xFFF58A97);
                                        } else {
                                          color = null;
                                          percentageColor = Color(0xFFF58A97);
                                        }
                                      } else {
                                        if (f.answers.compareTo(quizHelper
                                                .results[index].correctUrdu) ==
                                            0) {
                                          color = Color(0xFF6FCF97);
                                          percentageColor = Color(0xFF6FCF97);
                                          icon = Icon(
                                            Icons.check_circle,
                                            color: Color(0xFF6FCF97),
                                            size: 25.0,
                                          );
                                        } else if (f.answers.compareTo(
                                                answerSelected[index]) ==
                                            0) {
                                          color = Color(0xFFF58A97);
                                          percentageColor = Color(0xFFF58A97);
                                        } else {
                                          color = null;
                                          percentageColor = Color(0xFFF58A97);
                                        }
                                      }
                                    } else {
                                      f.answers.compareTo(
                                                  answerSelected[index]) ==
                                              0
                                          ? color = Color(0xFF56CCF2)
                                          : color = null;
                                    }
                                    return Row(children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 0.2),
                                        width: 250,
                                        child: RaisedButton(
                                          color: color,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 15),
                                          onPressed: () {
                                            setState(() {
                                              if (questionAttempted[index]) {
                                                // do nothing; question already attempted
                                              } else {
                                                answerSelected[index] =
                                                    f.answers;
                                                submitEnabled[index] = true;
                                              }
                                            });
                                          },
                                          elevation: 0,
                                          child: Text(
                                            f.answers,
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      submitPressed[index]
                                          ? icon
                                          : Container(
                                              height: 0,
                                              width: 0,
                                            ),
                                      SizedBox(width: 5),
                                      submitPressed[index]
                                          ? Text(
                                              ((int.parse(f.stats) /
                                                              quizHelper
                                                                  .results[
                                                                      index]
                                                                  .totalStatsCount) *
                                                          100)
                                                      .round()
                                                      .toString() +
                                                  '%',
                                              style: TextStyle(
                                                color: percentageColor,
                                              ),
                                            )
                                          : Container(
                                              height: 0,
                                              width: 0,
                                            ),
                                    ]);
                                  }).toList(),

                                  //  SizedBox(height: 20),
                                ),
                              ),
                              // The submit button comes here
                              SizedBox(height: 10),
                              Center(
                                child: submitEnabled[index]
                                    ? RaisedButton(
                                        color: Color(0xFF56CCF2),
                                        elevation: 0,
                                        padding:
                                            EdgeInsets.fromLTRB(50, 14, 50, 14),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          context.getString('Submit'),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          // the number of clicked

                                          //id for post request
                                          quizHelper.results[index].id;

                                          //text of selected option
                                          answerSelected[index];
                                          // this check can be used for post request

                                          if (checkAnswer(
                                              answerSelected[index], index)) {
                                            storestat(
                                                20,
                                                quizHelper.results[index].id,
                                                answerSelected[index],
                                                true);
                                          } else {
                                            storestat(
                                                20,
                                                quizHelper.results[index].id,
                                                answerSelected[index],
                                                false);
                                          }

                                          setState(() {
                                            if (checkAnswer(
                                                answerSelected[index], index)) {
                                              correctAttempted++;
                                              print(correctAttempted);
                                            }
                                            submitEnabled[index] = false;
                                            submitPressed[index] = true;
                                            questionAttempted[index] = true;
                                            if (checkAllQuestionsAttempted()) {
                                              print(
                                                  'All question attemped of current quiz.');
                                              print('Correct attempted: ' +
                                                  correctAttempted.toString());
                                              socialDistanceMarks =
                                                  ((correctAttempted /
                                                              quizHelper.results
                                                                  .length) *
                                                          (100)) *
                                                      (2 /
                                                          100); // "2" here being the total marks of section
                                              print(
                                                  'Marks from this section: ' +
                                                      socialDistanceMarks
                                                          .toString());
                                              print(
                                                  'Saving data socialDistanceMarks...');
                                              saveToSharedPreferences();
                                              print('Data saved!');
                                              final snackBar = SnackBar(
                                                  content: Text(
                                                      'Congratulations! You have Completed the Social Distancing Section'));

                                              // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          });
                                        })
                                    : RaisedButton(
                                        color: Color(0xFFBDBDBD),
                                        elevation: 0,
                                        padding:
                                            EdgeInsets.fromLTRB(50, 14, 50, 14),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          context.getString('Submit'),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          // do nothing; no answer selected
                                        }),
                              ),
                            ],
                          ));
                    },
                  )),
            ],
          ),
        ),
        // *? Padding ends here
      )
              // *? Safa Area ends gere
              ));
    } else {
      return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage('Images/Vector.png'),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/survivor');
                        },
                        child: Image(
                          image: AssetImage('Images/rewardtab.png'),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              SurveyCarousel(),
              SizedBox(height: 30),
              SurveyInformation(),
              SizedBox(height: 50),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
        // *? Padding ends here
      )
              // *? Safa Area ends gere
              ));
    }
  }

  checkSliderValue(double val) {
    if (val == 0.0) {
    } else if (val == 0.25) {
    } else if (val == 0.5) {
    } else if (val == 0.75) {
    } else if (val == 1.0) {}
  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    socialDistanceCompleted =
        sharedPreferences.getBool('socialDistanceCompleted');
    socialDistanceMarks = sharedPreferences.getDouble('socialDistanceMarks');
    print('socialDistanceCompleted - from SharedPreferences : ' +
        socialDistanceCompleted.toString());
    if (socialDistanceCompleted != null && socialDistanceCompleted) {
      print('Section already completed');
      print('Marks obtained in Social Distancing section: ' +
          socialDistanceMarks.toString());
    }
  }

  void saveToSharedPreferences() async {
    await sharedPreferences.setBool('socialDistanceCompleted', true);
    await sharedPreferences.setDouble(
        'socialDistanceMarks', socialDistanceMarks);
    if (checkAllSectionsCompleted()) {
      // this if body will run only when all 5 sections are completed.
      // this check tells whether all sections are completed or not
      print('All five sections completed.');
      calculateAndSaveTotal();
    }
  }

  bool checkAllQuestionsAttempted() {
    bool allAttempted = true;
    questionAttempted.forEach((isAttempted) {
      if (isAttempted) {
        // no nothing; move to next
      } else {
        allAttempted = false;
      }
    });
    return allAttempted;
  }

  bool checkAllSectionsCompleted() {
    bool allSectionsCompleted = true;
    List<bool> allSections = new List();
    allSections.add(sharedPreferences.getBool('stayHydratedCompleted'));
    allSections.add(sharedPreferences.getBool('sneezeSectionCompleted'));
    allSections.add(sharedPreferences.getBool('socialDistanceCompleted'));
    allSections.add(sharedPreferences.getBool('tissueHandlingCompleted'));
    allSections.add(sharedPreferences.getBool('washingHandsCompleted'));

    allSections.forEach((isSectionCompleted) {
      if (isSectionCompleted != null) {
        if (isSectionCompleted) {
          // no nothing; move to next
        } else {
          allSectionsCompleted = false;
        }
      } else {
        allSectionsCompleted = false;
      }
    });
    return allSectionsCompleted;
  }

  void calculateAndSaveTotal() async {
    double stayHydratedMarks = sharedPreferences.getDouble('stayHydratedMarks');
    double sneezeSectionMarks =
        sharedPreferences.getDouble('sneezeSectionMarks');
    double socialDistanceMarks =
        sharedPreferences.getDouble('socialDistanceMarks');
    double tissueHandlingMarks =
        sharedPreferences.getDouble('tissueHandlingMarks');
    double washingHandsMarks = sharedPreferences.getDouble('washingHandsMarks');

    double totalMarks = stayHydratedMarks +
        sneezeSectionMarks +
        socialDistanceMarks +
        tissueHandlingMarks +
        washingHandsMarks;
    await sharedPreferences.setDouble('totalMarks', totalMarks);
    print('Total of all 5 sections is calculated and saved!');

    Navigator.pushNamed(context, '/result');
  }
}

class SurveyCarousel extends StatefulWidget {
  @override
  _SurveyCarouselState createState() => _SurveyCarouselState();
}

class _SurveyCarouselState extends State<SurveyCarousel> {
  int _current = 0;

  List<String> surveys = [
    'Social Distancing',
    'Sneeze Cough',
    'Sneeze Cough',
    'Hydrated'
  ];
  @override
  Widget build(BuildContext context) {
    List<SurveyTitle> surveylist = [
      SurveyTitle(context.getString('menu.social'), 1, '/survey'),
      SurveyTitle(context.getString('menu.sneeze'), 0, '/sneeze'),
      SurveyTitle(context.getString('menu.hydration'), 0, '/hydration'),
      SurveyTitle(context.getString('menu.washing'), 0, '/washing'),
      SurveyTitle(context.getString('menu.tissue'), 0, '/tissue'),
    ];
    return Container(
        child: CarouselSlider(
      items: surveylist.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '${i.route}');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                alignment: Alignment(0.0, 0.0),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: _current == i.pagenumber
                      ? Color(0xFFE3E6EC)
                      : Color(0xFF2F80ED),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  '${i.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                      color: _current == i.pagenumber
                          ? Color(0xFF4F4F4F)
                          : Color(0xFFF5f5f5),
                      fontFamily: 'Seg'),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 110.0,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
      ),
    ));
  }
}

class CoronaSlider extends StatefulWidget {
  @override
  _CoronaSliderState createState() => _CoronaSliderState();
}

class _CoronaSliderState extends State<CoronaSlider> {
  bool isSliderSubmitted = false;
  double _value = 0.25;
  Color sliderColor = Color(0xFFF58A97);
  bool sliderSubmitStatus = false;
  bool showSliderStats = false;
  List<int> intList;

  int sliderValueOne = 1;
  int sliderValueTwo = 2;
  int sliderValueThree = 3;
  int sliderValueFour = 4;
  int sliderValueFive = 5;

  bool endSlider = false;

  var onem;
  var twom;
  var threem;
  var fourm;
  var fivem;

  @override
  void initState() {
    fetchSliderStat();
    super.initState();
  }

  void _setvalue(double value) => setState(() => _value = value);

  fetchSliderStat() async {
    String sliderURL = "https://knowcorona19.com/api/getSliderStats";
    var response = await http.get(sliderURL);
    var sliderbody = response.body;
    var json = jsonDecode(sliderbody);

    setState(() {
      onem = int.parse(json[0]['1m']);
      twom = int.parse(json[0]['2m']);
      threem = int.parse(json[0]['3m']);
      fourm = int.parse(json[0]['4m']);
      fivem = int.parse(json[0]['5m']);
      intList = [onem, twom, threem, fourm, fivem];

      var totalList = intList.reduce((i, j) => i + j);

      sliderValueOne = ((onem / totalList) * 100).round();
      sliderValueOne = ((onem / totalList) * 100).round();
      sliderValueTwo = ((twom / totalList) * 100).round();
      sliderValueThree = ((threem / totalList) * 100).round();
      sliderValueFour = ((fourm / totalList) * 100).round();
      sliderValueFive = ((fivem / totalList) * 100).round();
    });
  }

  checkSlider(double val) {
    if (val == 0.0) {
      storingValue(onem, '1m');
    } else if (val == 0.25) {
      storingValue(twom, '2m');
    } else if (val == 0.50) {
      storingValue(threem, '3m');
    } else if (val == 0.75) {
      storingValue(fourm, '4m');
    } else if (val == 1.0) {
      storingValue(fivem, '5m');
    }
  }

  storingValue(int clicked, String column) async {
    String newClicked = clicked.toString();

    String postURL = "https://knowcorona19.com/api/storingflutter";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"title":  "$newClicked", "column": "$column"}';
    try {
      http.Response response =
          await http.post(postURL, headers: headers, body: json);
      print(response.body);
    } catch (err) {
      print('Error sending data to the api for slider');
    }
  }

  Widget tickorCrossZero(double val) {
    if (val == 0.0) {
      return Icon(
        Icons.check_circle,
        color: Color(0xFFF4364F),
        size: 24.0,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Color(0xFFF4364F),
        size: 24.0,
      );
    }
  }

  Widget tickorCrossOne(double val) {
    if (val == 0.25) {
      return Icon(
        Icons.check_circle,
        color: Color(0xFFF4364F),
        size: 24.0,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Color(0xFFF4364F),
        size: 24.0,
      );
    }
  }

  Widget tickorCrossTwo(double val) {
    if (val == 0.50) {
      return Icon(
        Icons.check_circle,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    }
  }

  Widget tickorCrossThree(double val) {
    if (val == 0.75) {
      return Icon(
        Icons.check_circle,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    }
  }

  Widget tickorCrossFour(double val) {
    if (val == 1.0) {
      return Icon(
        Icons.check_circle,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Color(0xFF6FCF97),
        size: 24.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: endSlider,
      child: Column(children: <Widget>[
        Container(
          width: 290.0,
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: sliderColor,
              inactiveTrackColor: Colors.grey[400],
              trackHeight: 25.0,
              thumbColor: Color(0xFFF58A97),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
              overlayColor: Colors.purple.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
            ),
            child: Slider(
                value: _value,
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    if (isSliderSubmitted) {
                      sliderSubmitStatus = false;
                    } else {
                      sliderSubmitStatus = true;
                    }
                    _value = value;

                    if (value < 0.4) {
                      sliderColor = Color(0xFFF58A97);
                    } else {
                      sliderColor = Color(0xFF56CCF2);
                    }
                  });
                }),
          ),
        ),
        SizedBox(height: 7),
        Center(
            child: Visibility(
          visible: showSliderStats,
          child: Container(
            width: 270,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    tickorCrossZero(_value),
                    Text(
                      sliderValueOne.toString() + '%',
                      style: TextStyle(color: Color(0xFFF58A97)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    tickorCrossOne(_value),
                    Text(
                      sliderValueTwo.toString() + '%',
                      style: TextStyle(color: Color(0xFFF58A97)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    tickorCrossTwo(_value),
                    Text(
                      sliderValueThree.toString() + '%',
                      style: TextStyle(color: Color(0xFF6FCF97)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    tickorCrossThree(_value),
                    Text(
                      sliderValueFour.toString() + '%',
                      style: TextStyle(color: Color(0xFF6FCF97)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    tickorCrossFour(_value),
                    Text(
                      sliderValueFive.toString() + '%',
                      style: TextStyle(color: Color(0xFF6FCF97)),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Center(
              child: Text(
                context.getString('menu.socialthree'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: 'Seg',
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2D9CDB),
                ),
              ),
            )),
        SizedBox(height: 10),
        Center(
          child: sliderSubmitStatus
              ? RaisedButton(
                  color: Color(0xFF56CCF2),
                  elevation: 3,
                  padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    context.getString('Submit'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      sliderSubmitStatus = false;
                      isSliderSubmitted = true;
                      showSliderStats = true;
                      endSlider = true;
                    });

                    // posting data to the db, get the value of the slider
                    //selected and the global variable and send it to the
                    // to check which meter it selected and then increment that
                    // variable and post it back

                    checkSlider(_value);
                  })
              : RaisedButton(
                  color: Color(0xFFBDBDBD),
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    context.getString('Submit'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {}),
        ),
      ]),
    );
  }
}

class SurveyTitleQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
      child: Text(
        context.getString('menu.socialone') +
            '\n \n' +
            context.getString('menu.socialtwo'),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 21, fontFamily: 'Seg'),
      ),
    );
  }
}
// *? This is the Survey general question

// *? This is the Survey Information Widget

class SurveyInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('Images/Group-2.png'),
          ),
          SizedBox(height: 30),
          Center(
              child: Text(
            context.getString('menu.socialIntro'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Seg',
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D9CDB),
            ),
          )),
        ],
      ),
    );
  }
}
// *? This is the navigation widget

Widget navigationTab() {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print('Going to the back page');
          },
          child: Image(
            image: AssetImage('Images/Vector.png'),
          ),
        ),
        Image(
          image: AssetImage('Images/rewardtab.png'),
        )
      ],
    ),
  );
}
