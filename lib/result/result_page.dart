import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int questionsLength;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.questionsLength,
    required this.result,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading30,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body15,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold15,
                      ),
                      TextSpan(
                        text: "\nCom $result de $questionsLength acertos",
                        style: AppTextStyles.body15,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.share(
                            label: "Compartilhar",
                            onTap: () {
                              Share.share(
                                  "DevQuiz NLW 5 - Flutter:\n\n Resultado do Quiz: $title\n\nObtive: ${result / questionsLength * 100}% de aproveitamento!");
                            }),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                NextButtonWidget.goBack(
                  label: "Voltar ao início",
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
