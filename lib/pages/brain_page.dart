import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:quiz_riverpod/providers/quiz_services_providers.dart';
import 'package:quiz_riverpod/widgets/custom_button.dart';

class BrainPage extends StatelessWidget {
  const BrainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Consumer(
              builder: (context, ref, child) {
                final quizProvider = ref.watch(quizServicesNotifiersProvider);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(
                          quizProvider.question,
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
                        ref
                            .read(quizServicesNotifiersProvider.notifier)
                            .userClicked(context: context, usersAnswer: true);
                      },
                      text: 'TRUE',
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        ref
                            .read(quizServicesNotifiersProvider.notifier)
                            .userClicked(context: context, usersAnswer: false);
                      },
                      text: 'FALSE',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: quizProvider.icons,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
