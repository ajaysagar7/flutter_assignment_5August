import 'dart:convert';
import 'dart:developer';

import 'package:elred_assignment_2/config/app_colors.dart';
import 'package:elred_assignment_2/config/app_styles.dart';
import 'package:elred_assignment_2/models/widget_model.dart';
import 'package:elred_assignment_2/providers/HomeScreen/home_screen_provider.dart';
import 'package:elred_assignment_2/screens/Radio/radio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Animations/side_right_to_left_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectdScreenIndex = 0;
  final TextEditingController _nameController = TextEditingController();

  //! name screen

  @override
  void initState() {
    _loadJsonData();
    super.initState();
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
              _logoTitleWidget(),
              SizedBox(
                height: height * 0.03,
              ),
              _headlineWidget(),
              SizedBox(
                height: height * 0.03,
              ),
              _progressWidget(),
              SizedBox(
                height: height * 0.03,
              ),
              _questionWidget(
                  questionText:
                      context.watch<HomeScreenProvider>().questionText!,
                  hintText: context.watch<HomeScreenProvider>().hintText!),
              //! button-widget
              Visibility(
                visible: context.watch<HomeScreenProvider>().showButton,
                replacement: Container(),
                child: Container(
                  height: height * .08,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.white,
                  child: ElevatedButton(
                    style: AppStyles.buttonStyle,
                    onPressed:
                        context.watch<HomeScreenProvider>().isHomeScreenValid
                            ? () {
                                // Utils.showSnackBar(message: "screen is valid");
                                // Navigator.of(context).push(
                                //   SlideRightToLeftPageRoute(
                                //     page: const RadioScreen(),
                                //   ),
                                // );
                                Navigator.push(
                                    context,
                                    SlideRightToLeftPageRoute(
                                        page: const RadioScreen()));
                              }
                            : null,
                    child: const Text("Next"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    if (widget != oldWidget) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  void _loadJsonData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<HomeScreenProvider>().resetValues();

      final dynamic data = await rootBundle.loadString("assets/widget.json");
      WidgetModel widgetModel = WidgetModel.fromJson(jsonDecode(data));
      if (widgetModel.screens!.isNotEmpty) {
        log("converting to model is succcessssssssss");
        log(widgetModel.screens!.first.toJson().toString());

        // for (int i = 0; i < widgetModel.screens!.length; i++) {}

        if (_selectdScreenIndex == 0) {
          //! name-screen
          // _nameMainHeading = widgetModel.screens!.first.heading.toString();
          if (mounted) {
            context.read<HomeScreenProvider>().setHeading(
                value: widgetModel.screens!.first.heading.toString());
            context.read<HomeScreenProvider>().setQuestionText(
                value: widgetModel.screens!.first.question.toString());
            context.read<HomeScreenProvider>().setHintText(
                value: widgetModel.screens!.first.hintText.toString());
          }
          // setState(() {});
        } else if (_selectdScreenIndex == 1) {
        } else if (_selectdScreenIndex == 2) {
        } else if (_selectdScreenIndex == 3) {
        } else if (_selectdScreenIndex == 4) {
        } else {}
      } else {
        log("convering to model is failed");
      }
    });
  }

  _logoTitleWidget() {
    return Center(
      child: Text(
        "Gamification",
        style: AppStyles.logoTextStyle,
      ),
    );
  }

  _headlineWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        context.watch<HomeScreenProvider>().mainHeading!,
        style: AppStyles.logoTextStyle.copyWith(fontSize: 20),
      ),
    );
  }

  _progressWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: const LinearProgressIndicator(
          value: 0.3,
          minHeight: 4,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
        ),
      ),
    );
  }

  _questionWidget({required String questionText, required String hintText}) {
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
              //! textfiled-widget
              TextFormField(
                onTap: () {
                  // context.read<HomeScreenProvider>().hide();
                  FocusScope.of(context).unfocus();
                },
                controller: _nameController,
                onChanged: (String? value) {
                  context.read<HomeScreenProvider>().onChanged(value: value!);
                },
                inputFormatters: const [],
                cursorColor: AppColors.primaryColor,
                style: AppStyles.textFiledStyle14or16.copyWith(
                    fontSize: 16, color: AppColors.textfieldTextColor),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.fillColor,
                    hintText: hintText,
                    hintStyle: AppStyles.textFiledStyle14or16,
                    border: AppStyles.outlineInputBorder,
                    focusedBorder: AppStyles.outlineInputBorder,
                    enabledBorder: AppStyles.outlineInputBorder,
                    errorBorder: AppStyles.outlineInputBorder),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                context
                    .watch<HomeScreenProvider>()
                    .nameValidatioin
                    .error
                    .toString(),
                style:
                    AppStyles.textFiledStyle14or16.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
