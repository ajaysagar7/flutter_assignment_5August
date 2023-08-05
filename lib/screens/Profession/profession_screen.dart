import 'dart:convert';
import 'dart:developer';

import 'package:elred_assignment_2/Animations/side_right_to_left_animation.dart';
import 'package:elred_assignment_2/providers/Date/date_provider.dart';
import 'package:elred_assignment_2/providers/Profession/profession_provider.dart';
import 'package:elred_assignment_2/screens/Designation/designation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../models/widget_model.dart';
import '../../providers/HomeScreen/home_screen_provider.dart';
import '../../providers/Radio/radio_provider.dart';
import '../widgets/heading_widget.dart';
import '../widgets/logo_title_widget.dart';
import '../widgets/progress_widget.dart';

class ProfessionScreen extends StatefulWidget {
  const ProfessionScreen({super.key});

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  final int _selectdScreenIndex = 3;

  //! name screen

  @override
  void initState() {
    _loadJsonData();
    super.initState();
  }

  @override
  void dispose() {
    context.read<ProfessionsProvider>().resetAllValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SizedBox(
          height: height - MediaQuery.of(context).padding.top,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const LogoTitleWidget(),
              SizedBox(
                height: height * 0.03,
              ),
              HeadingTextWidget(
                text: context.watch<ProfessionsProvider>().appbarTitle,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const ProgressWidget(progressValue: 0.8),
              SizedBox(
                height: height * 0.03,
              ),
              //! question-widget here,
              _questionWidget(
                question: context.watch<ProfessionsProvider>().question!,
              ),

              //! button-widget
              Container(
                height: height * .08,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.white,
                child: ElevatedButton(
                  style: AppStyles.buttonStyle,
                  onPressed: context.watch<ProfessionsProvider>().isScreenValid
                      ? () {
                          Navigator.push(
                              context,
                              SlideRightToLeftPageRoute(
                                  page: const DesignationScreen()));
                        }
                      : null,
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _questionWidget({
    required String question,
  }) {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.036,
              ),
              Text(
                "My name is ${context.watch<HomeScreenProvider>().nameValidatioin.value.toString()}, I am  ${context.watch<RadioProvder>().selectedRadioValue} \n born on ${context.watch<DateProvider>().dateController.text.toString()}",
                style: AppStyles.questionTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.8)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                question,
                style: AppStyles.questionTextStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //! drop-down-widget
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                children: context
                    .watch<ProfessionsProvider>()
                    .options
                    .map((e) => RadioListTile<String>(
                        activeColor: AppColors.primaryColor,
                        title: Text(e.text!),
                        value: e.text!,
                        groupValue: context
                            .watch<ProfessionsProvider>()
                            .selectedRadioValue,
                        onChanged: (String? value) {
                          context
                              .read<ProfessionsProvider>()
                              .setRadioValue(value: value!);
                        }))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loadJsonData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final dynamic data = await rootBundle.loadString("assets/widget.json");
      WidgetModel widgetModel = WidgetModel.fromJson(jsonDecode(data));
      if (widgetModel.screens!.isNotEmpty) {
        context.read<ProfessionsProvider>().resetAllValues();

        log("converting to model is succcessssssssss");
        // log(widgetModel.screens!.first.toJson().toString());

        if (_selectdScreenIndex == 0) {
          //! name-screen
          if (mounted) {}
          // setState(() {});
        } else if (_selectdScreenIndex == 1) {
        } else if (_selectdScreenIndex == 2) {
        } else if (_selectdScreenIndex == 3) {
          if (mounted) {
            context.read<ProfessionsProvider>().setAppbarTitle(
                widgetModel.screens![_selectdScreenIndex].heading.toString());
            context.read<ProfessionsProvider>().setQuestion(
                widgetModel.screens![_selectdScreenIndex].question.toString());

            context.read<ProfessionsProvider>().setOption(
                value: widgetModel.screens![_selectdScreenIndex].options!);
          }
        } else if (_selectdScreenIndex == 4) {
        } else {}
      } else {
        log("convering to model is failed");
      }
    });
  }
}
