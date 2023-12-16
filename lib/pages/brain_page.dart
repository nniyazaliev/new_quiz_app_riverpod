import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_riverpod/brain_quiz.dart';
import 'package:quiz_riverpod/widgets/custom_button.dart';

class BrainPage extends StatefulWidget {
  const BrainPage({
    super.key,
  });

  @override
  State<BrainPage> createState() => _BrainPageState();
}

class _BrainPageState extends State<BrainPage> {
  List<Widget> icons = [];

  BrainQuiz brainQuiz = BrainQuiz();

  @override
  void initState() {
    brainQuiz.suroonuToltur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    brainQuiz.showQuestion(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  userClicked(true);
                },
                text: 'TRUE',
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  userClicked(false);
                },
                text: 'FALSE',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  children: icons,
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon({required IconData icon, required Color iconColor}) {
    return Icon(
      icon,
      color: iconColor,
      size: 30,
    );
  }

  Future<void> _showMyDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Суроолор бутту'),
          content: const Text('Кайрадан башта'),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart'),
              onPressed: () {
                kairadanBashta();
                Navigator.of(context).pop(); // Закрывает диалоговое окно
              },
            ),
          ],
        );
      },
    );
  }

  void kairadanBashta() {
    brainQuiz.restart();
    icons = [];
    setState(() {});
  }

  void userClicked(bool usersAnswer) {
    bool isFinished = brainQuiz.isFinished();
    bool tuuraJoop = brainQuiz.getCorrectAnswer();
    log('userClicked akyrkySuroobu: $isFinished');

    if (isFinished) {
      icons.add(buildIcon(icon: Icons.close, iconColor: Colors.red));

      log('userClicked akyrkySuroobu TUURA: $isFinished');

      _showMyDialog();
    } else {
      if (usersAnswer == tuuraJoop) {
        //log('User tuuraJoop berdi');
        icons.add(buildIcon(icon: Icons.check, iconColor: Colors.green));
      } else {
        //log('User kata joop berdi');
        icons.add(buildIcon(icon: Icons.close, iconColor: Colors.red));
      }

      brainQuiz.nextQuestion();
    }
    setState(() {});
  }

  void tuuraIkonkaKosh() {
    //icons.add(buildIcon(icon: Icons.check, iconColor: Colors.green));
    brainQuiz.nextQuestion();
    setState(() {});
  }

  void kataIkonkaKosh() {
    //icons.add(buildIcon(icon: Icons.close, iconColor: Colors.red));

    setState(() {});
  }
}
