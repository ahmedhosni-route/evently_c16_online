class EventModel {
  String title;
  String desc;
  String date;
  String image;

  EventModel(
      {required this.title,
      required this.image,
      required this.date,
      required this.desc});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "desc": desc,
      "date": date,
      "image": image};
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        title: json["title"],
        image: json["image"],
        date: json["date"],
        desc: json["desc"]);
  }
}
