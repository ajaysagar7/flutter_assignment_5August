// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class ProgressWidget extends StatelessWidget {
  final double progressValue;
  const ProgressWidget({
    Key? key,
    required this.progressValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LinearProgressIndicator(
        color: Colors.white,
        value: progressValue,
        valueColor: const AlwaysStoppedAnimation(AppColors.primaryColor),
      ),
    );
  }
}
