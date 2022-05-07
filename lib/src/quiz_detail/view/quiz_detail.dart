import 'package:flutter/material.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';
import 'package:quiz_app/src/utilities/export.dart';

part 'quiz_detail_card.dart';
part 'quiz_detail_list_tile.dart';

class QuizDetails extends StatelessWidget {
  const QuizDetails({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenScaleFactor.screenHeight * 0.5,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: ColorPallet.blueGreyGradient,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _QuizDetailsCard(
              quiz: quiz,
            ),
          )
        ],
      ),
    );
  }
}
