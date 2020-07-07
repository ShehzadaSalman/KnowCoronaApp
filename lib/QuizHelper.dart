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
  String correctAnswer;
  List<String> incorrectAnswers;
  String correctStat;
  List<String> incorrectStats;
  List<AnswersWithStats> allAnswersWithStats = List();
  int totalStatsCount = 0;

  Results(
      {this.id,
        this.category,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
        this.correctStat,
        this.incorrectStats,
        this.totalStatsCount});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
    correctStat = json['correct_stat'];
    incorrectStats = json['incorrect_stats'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.incorrectAnswers;
    data['correct_stat'] = this.correctStat;
    data['incorrect_stats'] = this.incorrectStats;
    return data;
  }
}

class AnswersWithStats {
  String answers;
  String stats;

}
