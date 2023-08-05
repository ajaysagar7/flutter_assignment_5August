import 'package:flutter/material.dart';

import '../../config/app_styles.dart';

class LogoTitleWidget extends StatelessWidget {
  const LogoTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Gamification",
        style: AppStyles.logoTextStyle,
        textAlign: TextAlign.center,
      ),
    );
    // Center(
    //   child: Row(
    //     children: [
    //       IconButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           icon: const Icon(
    //             Icons.arrow_back,
    //             color: Colors.white,
    //           )),
    //       Expanded(
    //         child: Text(
    //           "Gamification",
    //           style: AppStyles.logoTextStyle,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
