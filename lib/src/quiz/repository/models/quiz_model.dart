part of '../quiz_repo.dart';

class QuizModel {
  final String title;
  final int avgTimePerQuestion;
  final int pointsForCorrectAnswer;
  final int pointsToWin;
  final List<String> categoriesId;
  final List<String> warnings;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    required this.avgTimePerQuestion,
    required this.pointsForCorrectAnswer,
    required this.pointsToWin,
    required this.categoriesId,
    required this.warnings,
    required this.questions,
  });

  QuizModel copyWith({
    String? title,
    int? avgTimePerQuestion,
    int? pointsForCorrectAnswer,
    int? pointsToWin,
    List<String>? categoriesId,
    List<String>? warnings,
    List<QuestionModel>? questions,
  }) {
    return QuizModel(
      title: title ?? this.title,
      avgTimePerQuestion: avgTimePerQuestion ?? this.avgTimePerQuestion,
      pointsForCorrectAnswer:
          pointsForCorrectAnswer ?? this.pointsForCorrectAnswer,
      pointsToWin: pointsToWin ?? this.pointsToWin,
      categoriesId: categoriesId ?? this.categoriesId,
      warnings: warnings ?? this.warnings,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': title,
      'avg_time_per_question': avgTimePerQuestion,
      'points_for_correct_answer': pointsForCorrectAnswer,
      'points_to_win': pointsToWin,
      'categories': categoriesId,
      'warnings': warnings,
      'questions': questions.map((QuestionModel x) => x.toJson()).toList(),
    };
  }

  // factory QuizModel.fromMap(Map<String, dynamic> map) {
  //   return QuizModel(
  //     title: map['title'] as String,
  //     avgTimePerQuestion: map['avgTimePerQuestion'] as int,
  //     pointsForCorrectAnswer: map['pointsForCorrectAnswer'] as int,
  //     pointsToWin: map['pointsToWin'] as int,
  //     categoriesId: List<String>.from((map['categoriesId'] as List<String>),
  //     warnings: List<String>.from((map['warnings'] as List<String>),
  //     questions: List<QuestionModel>.from((map['questions'] as List<int>).map<QuestionModel>((x) => QuestionModel.fromJson(x as Map<String,dynamic>),),),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizModel(title: $title, avgTimePerQuestion: $avgTimePerQuestion, pointsForCorrectAnswer: $pointsForCorrectAnswer, pointsToWin: $pointsToWin, categoriesId: $categoriesId, warnings: $warnings, questions: $questions)';
  }
}
