import 'dart:developer';

import 'package:elred_assignment_2/Animations/slide_left_to_right_animation.dart';
import 'package:elred_assignment_2/config/app_styles.dart';
import 'package:elred_assignment_2/models/Profile/profile_post_model.dart';
import 'package:elred_assignment_2/providers/Profile/profile_provider.dart';
import 'package:elred_assignment_2/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../config/app_colors.dart';
import '../../providers/Date/date_provider.dart';
import '../../providers/Designation/designation_provider.dart';
import '../../providers/HomeScreen/home_screen_provider.dart';
import '../../providers/Profession/profession_provider.dart';
import '../../providers/Radio/radio_provider.dart';
import '../widgets/success_dialog_widget.dart';

class ProfileSummaryScreen extends StatefulWidget {
  const ProfileSummaryScreen({super.key});

  @override
  State<ProfileSummaryScreen> createState() => _ProfileSummaryScreenState();
}

class _ProfileSummaryScreenState extends State<ProfileSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profile Summary",
                      style: AppStyles.textFiledStyle14or16.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Hi ",
                        style: AppStyles.logoTextStyle.copyWith(fontSize: 20),
                        children: [
                          TextSpan(
                            text: context
                                    .watch<HomeScreenProvider>()
                                    .nameValidatioin
                                    .value
                                    .toString() ??
                                '',
                            style: AppStyles.logoTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "You did it🎉",
                      style: AppStyles.questionTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .002,
                      ),
                      _contentWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Text(
                        "My personal details 🙂",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightOrangeColor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Text(
                        "My name is ${context.watch<HomeScreenProvider>().nameValidatioin.value.toString()}, I am  ${context.watch<RadioProvder>().selectedRadioValue} \n born on ${context.watch<DateProvider>().dateController.text.toString()}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff313030)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Text(
                        "How i keep busy💻",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightOrangeColor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Text(
                        "I am ${context.watch<ProfessionsProvider>().selectedRadioValue.toString()} and I develop \n${context.watch<DesignationProvider>().selectedRadioValue.toString()}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff313030)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MediaQuery.of(context).size.height * .09,
              decoration: const BoxDecoration(color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<HomeScreenProvider>().resetValues();
                      context.read<RadioProvder>().resetRadioScrenValidation();
                      context.read<DateProvider>().resetDateTime();
                      context.read<ProfessionsProvider>().resetAllValues();
                      context.read<DesignationProvider>().resetAllValues();
                      if (mounted) {
                        Navigator.push(context,
                            LeftToRightPageRoute(page: const HomeScreen()));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.refresh,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: ElevatedButton(
                      style: AppStyles.buttonStyle,
                      onPressed: () async {
                        final String name = context
                            .read<HomeScreenProvider>()
                            .nameValidatioin
                            .value
                            .toString();
                        final String gender = context
                            .read<RadioProvder>()
                            .selectedRadioValue
                            .toString();
                        final String dob = context
                            .read<DateProvider>()
                            .dateController
                            .text
                            .toString();
                        final String profession = context
                            .read<ProfessionsProvider>()
                            .selectedRadioValue
                            .toString();

                        if (mounted) {
                          ProfilePostModel postModel = ProfilePostModel(
                              name: name,
                              gender: gender,
                              dob: dob,
                              profession: profession,
                              skills: "h");

                          log(postModel.toJson().toString());
                          await context.read<ProfileProvider>().post(
                              profilePostModel: postModel,
                              successCallback: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: SuccessDialog(),
                                    );
                                  },
                                );
                              });
                        }
                      },
                      child: context.watch<ProfileProvider>().isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Confirm"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _contentWidget() {
    return Text(
      "Please review your answers below and do change if any or confirm and continue.",
      style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: const Color(0xff313030)),
    );
  }
}
