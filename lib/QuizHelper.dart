class QuizHelper {
  int responseCode;
  List<Results> results;

  QuizHelper({this.responseCode, this.results});

  QuizHelper.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String id;
  String category;
  String type;
  String difficulty;
  String question;
  String questionUrdu;
  String correctAnswer;
  String correctUrdu;
  List<String> incorrectAnswers;
  String correctStat;
  List<String> incorrectStats;
  List<String> urduOptions;
  List<AnswersWithStats> allAnswersWithStats = List();
  int totalStatsCount = 0;

  Results(
      {this.id,
      this.category,
      this.type,
      this.difficulty,
      this.question,
      this.questionUrdu,
      this.correctAnswer,
      this.correctUrdu,
      this.incorrectAnswers,
      this.urduOptions,
      this.correctStat,
      this.incorrectStats,
      this.totalStatsCount});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    questionUrdu = json['question_urdu'];
    correctAnswer = json['correct_answer'];
    correctUrdu = json['correct_urdu'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
    correctStat = json['correct_stat'];
    incorrectStats = json['incorrect_stats'].cast<String>();
    urduOptions = json['urdu_Options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['question_urdu'] = this.questionUrdu;
    data['correct_answer'] = this.correctAnswer;
    data['correct_urdu'] = this.correctUrdu;
    data['incorrect_answers'] = this.incorrectAnswers;
    data['correct_stat'] = this.correctStat;
    data['incorrect_stats'] = this.incorrectStats;
    data['urdu_Options'] = this.urduOptions;
    return data;
  }
}

class AnswersWithStats {
  String answers;
  String stats;
}
