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
    return GradientBackground(
      child: Scaffold(
        backgroundColor: ColorPallet.transparent,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                quiz.name,
                style: CustomTheme.headline4.copyWith(
                  color: ColorPallet.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'GET ${quiz.earnings} Points',
                style: CustomTheme.headline6.copyWith(color: ColorPallet.white),
              ),
              trailing: TextWithLeadingIcon(
                icon: Icons.star_purple500_sharp,
                iconColor: ColorPallet.golden,
                iconSize: 30,
                text: quiz.starRating.toString(),
                textColor: ColorPallet.white,
                textSize: 18.toFont,
              ),
            ),
            Expanded(
              child: _QuizDetailsCard(
                quiz: quiz,
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomOutlineButton(
          onTap: () {},
          text: 'Start Quiz',
        ),
      ),
    );
  }
}
