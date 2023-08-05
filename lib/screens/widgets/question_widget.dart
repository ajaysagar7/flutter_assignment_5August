// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../config/app_styles.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final String descriptionText;
  final List<Widget> widets;
  const QuestionWidget({
    Key? key,
    required this.questionText,
    required this.descriptionText,
    required this.widets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionText,
                // "My name is",
                style: AppStyles.questionTextStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.036,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
