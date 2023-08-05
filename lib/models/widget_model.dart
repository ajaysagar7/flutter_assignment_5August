class WidgetModel {
  List<Screens>? screens;

  WidgetModel({this.screens});

  WidgetModel.fromJson(Map<String, dynamic> json) {
    if (json['screens'] != null) {
      screens = <Screens>[];
      json['screens'].forEach((v) {
        screens!.add(Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (screens != null) {
      data['screens'] = screens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screens {
  int? screenIndex;
  String? screenName;
  String? heading;
  String? question;
  String? hintText;
  List<String>? fields;
  List<Options>? options;
  String? ans;
  String? dobhintText;

  Screens(
      {this.screenIndex,
      this.screenName,
      this.heading,
      this.question,
      this.hintText,
      this.fields,
      this.options,
      this.ans,
      this.dobhintText});

  Screens.fromJson(Map<String, dynamic> json) {
    screenIndex = json['screen_index'];
    screenName = json['screen_name'];
    heading = json['heading'];
    question = json['question'];
    hintText = json['hint_text'];
    fields = json['fields'].cast<String>();
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    ans = json['ans'];
    dobhintText = json['dobhintText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['screen_index'] = screenIndex;
    data['screen_name'] = screenName;
    data['heading'] = heading;
    data['question'] = question;
    data['hint_text'] = hintText;
    data['fields'] = fields;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['ans'] = ans;
    data['dobhintText'] = dobhintText;
    return data;
  }
}

class Options {
  String? text;
  String? value;

  Options({this.text, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}
