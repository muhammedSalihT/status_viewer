class AllStatusModel {
  AllStatusModel({
    this.id,
    this.title,
    this.readStatus,
    this.image,
    this.profile,
  });

  int? id;
  String? title;
  bool? readStatus;
  String? image;
  Profile? profile;

  factory AllStatusModel.fromJson(Map<String, dynamic> json) => AllStatusModel(
        id: json["id"],
        title: json["title"],
        readStatus: json["read_status"],
        image: json["image"],
        profile: Profile.fromJson(json["profile"]),
      );
}

class Profile {
  Profile({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}
