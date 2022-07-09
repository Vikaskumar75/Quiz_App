part of '../availability_repo.dart';

QuizAvailability availabilityFromJson(String str) => QuizAvailability.fromJson(
      json.decode(str),
    );

String availabilityToJson(QuizAvailability data) => json.encode(data.toJson());

class QuizAvailability {
  QuizAvailability({
    required this.status,
    required this.total,
    required this.data,
  });

  final String status;
  final int total;
  final List<Quiz> data;

  QuizAvailability copyWith({
    String? status,
    int? total,
    List<Quiz>? data,
  }) =>
      QuizAvailability(
        status: status ?? this.status,
        total: total ?? this.total,
        data: data ?? this.data,
      );

  factory QuizAvailability.fromJson(Map<String, dynamic> json) =>
      QuizAvailability(
        status: json['status'],
        total: json['total'],
        data: List<Quiz>.from(json['data'].map(
          (dynamic x) => Quiz.fromJson(x),
        )),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'total': total,
        'data': List<dynamic>.from(
          data.map((Quiz x) => x.toJson()),
        ),
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.noOfQuestions,
    required this.duration,
    required this.categories,
    required this.starRating,
    required this.earnings,
    required this.starsToWin,
    required this.pointsForCorrectAnswer,
    required this.warnings,
  });

  final String id;
  final String name;
  final String imageUrl;
  final int noOfQuestions;
  final String duration;
  final List<String> categories;
  final double starRating;
  final int earnings;
  final int starsToWin;
  final int pointsForCorrectAnswer;
  final List<String> warnings;

  Quiz copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? noOfQuestions,
    String? duration,
    List<String>? categories,
    double? starRating,
    int? earnings,
    int? starsToWin,
    int? pointsForCorrectAnswer,
    List<String>? warnings,
  }) =>
      Quiz(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        noOfQuestions: noOfQuestions ?? this.noOfQuestions,
        duration: duration ?? this.duration,
        categories: categories ?? this.categories,
        starRating: starRating ?? this.starRating,
        earnings: earnings ?? this.earnings,
        starsToWin: starsToWin ?? this.starsToWin,
        pointsForCorrectAnswer:
            pointsForCorrectAnswer ?? this.pointsForCorrectAnswer,
        warnings: warnings ?? this.warnings,
      );

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        noOfQuestions: json['no_of_questions'],
        duration: json['duration'],
        categories: List<String>.from(
          json['categories'].map((dynamic x) => x),
        ),
        starRating: json['star_rating'].toDouble(),
        earnings: json['earnings'],
        starsToWin: json['stars_to_win'],
        pointsForCorrectAnswer: json['point_for_correct_answer'],
        warnings: List<String>.from(json['warnings'].map((dynamic x) => x)),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'image_url': imageUrl,
        'no_of_questions': noOfQuestions,
        'duration': duration,
        'categories': List<String>.from(
          categories.map((String x) => x),
        ),
        'star_rating': starRating,
        'earnings': earnings,
        'stars_to_win': starsToWin,
        'point_for_correct_answer': pointsForCorrectAnswer,
        'warnings': List<String>.from(warnings.map((String x) => x)),
      };
}
