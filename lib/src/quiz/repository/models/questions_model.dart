part of '../quiz_repo.dart';

class QuestionModel {
  final String title;
  final List<Options> options;

  QuestionModel({
    required this.title,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      title: json['title'],
      options: List<Options>.from(
        json['options'].map((dynamic element) => Options.formJson(element)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'options': List<dynamic>.from(
        options.map((Options e) => e.toJson()),
      )
    };
  }
}

class Options {
  final String answer;
  final bool isCorrect;

  const Options({
    required this.answer,
    required this.isCorrect,
  });

  factory Options.formJson(Map<String, dynamic> json) {
    return Options(
      answer: json['answer'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'answer': answer,
      'is_correct': isCorrect,
    };
  }
}
