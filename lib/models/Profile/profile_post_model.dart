class ProfilePostModel {
  String name;
  String gender;
  String dob;
  String profession;
  String skills;

  ProfilePostModel({
    required this.name,
    required this.gender,
    required this.dob,
    required this.profession,
    required this.skills,
  });

  factory ProfilePostModel.fromJson(Map<String, dynamic> json) {
    return ProfilePostModel(
      name: json['name'] ?? "",
      gender: json['gender'] ?? "",
      dob: json['dob'] ?? "",
      profession: json['profession'] ?? "",
      skills: json['skills'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'dob': dob,
      'profession': profession,
      'skills': skills,
    };
  }
}
