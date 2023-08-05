import 'dart:convert';
import 'dart:developer';

import 'package:elred_assignment_2/Animations/side_right_to_left_animation.dart';
import 'package:elred_assignment_2/providers/Radio/radio_provider.dart';
import 'package:elred_assignment_2/screens/Date/date_screen.dart';
import 'package:elred_assignment_2/screens/widgets/heading_widget.dart';
import 'package:elred_assignment_2/screens/widgets/logo_title_widget.dart';
import 'package:elred_assignment_2/screens/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../models/widget_model.dart';
import '../../providers/HomeScreen/home_screen_provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final int _selectdScreenIndex = 1;

  //! name screen

  @override
  void initState() {
    _loadJsonData();
    super.initState();
  }

  @override
  void dispose() {
    context.read<RadioProvder>().resetRadioScrenValidation();
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
              const HeadingTextWidget(),
              SizedBox(
                height: height * 0.03,
              ),
              const ProgressWidget(progressValue: 0.4),
              SizedBox(
                height: height * 0.03,
              ),
              //! question-widget here,
              _questionWidget(
                  question: context.watch<RadioProvder>().question,
                  description: context.watch<RadioProvder>().description),
              //! button-widget
              Container(
                height: height * .08,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.white,
                child: ElevatedButton(
                  style: AppStyles.buttonStyle,
                  onPressed: context.watch<RadioProvder>().isRadioScreenValid
                      ? () {
                          //! naviagtion
                          // Utils.showSnackBar(message: "screen is valid");
                          Navigator.push(
                              context,
                              SlideRightToLeftPageRoute(
                                  page: const DateScreen()));
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

  _questionWidget({required String question, required String description}) {
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
                "My name is ${context.watch<HomeScreenProvider>().nameValidatioin.value.toString()}",
                style: AppStyles.questionTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.8)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.036,
              ),
              Text(
                question,
                // "My name is",
                style: AppStyles.questionTextStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.036,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                children: context
                    .watch<RadioProvder>()
                    .radioValues
                    .map((e) => RadioListTile<String>(
                        activeColor: AppColors.primaryColor,
                        title: Text(e),
                        value: e,
                        groupValue:
                            context.watch<RadioProvder>().selectedRadioValue,
                        onChanged: (String? value) {
                          context
                              .read<RadioProvder>()
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
      context.read<HomeScreenProvider>().resetValues();

      final dynamic data = await rootBundle.loadString("assets/widget.json");
      WidgetModel widgetModel = WidgetModel.fromJson(jsonDecode(data));
      if (widgetModel.screens!.isNotEmpty) {
        log("converting to model is succcessssssssss");
        log(widgetModel.screens!.first.toJson().toString());

        if (_selectdScreenIndex == 0) {
          //! name-screen
          if (mounted) {}
          // setState(() {});
        } else if (_selectdScreenIndex == 1) {
          if (mounted) {
            context.read<RadioProvder>().setQuestioinValue(
                value: widgetModel.screens![1].question.toString());
            context.read<RadioProvder>().setDescriptionvalue(
                value: widgetModel.screens![1].heading.toString());
            for (int i = 0; i < widgetModel.screens![1].options!.length; i++) {
              context.read<RadioProvder>().setRadioTitles(
                  values: widgetModel.screens![1].options![i].text.toString());
            }
            for (int i = 0; i < widgetModel.screens![1].options!.length; i++) {
              context.read<RadioProvder>().setRadioValues(
                  values: widgetModel.screens![1].options![i].value!);
            }
          }
        } else if (_selectdScreenIndex == 2) {
        } else if (_selectdScreenIndex == 3) {
        } else if (_selectdScreenIndex == 4) {
        } else {}
      } else {
        log("convering to model is failed");
      }
    });
  }
}
