// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../config/app_styles.dart';

class HeadingTextWidget extends StatelessWidget {
  final String? text;
  const HeadingTextWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        text ?? "A few personal details🙂",
        style: AppStyles.logoTextStyle.copyWith(fontSize: 20),
      ),
    );
  }
}
