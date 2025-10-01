class EventModel {
  String id;
  String categoryId;
  String title;
  String desc;
  String date;
  String time;
  String image;
  bool isFavorite;

  EventModel(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.image,
      required this.time,
      this.isFavorite = false,
      required this.date,
      required this.desc});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "title": title,
      "desc": desc,
      "isFavorite": isFavorite,
      "time": time,
      "date": date,
      "image": image
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json["id"],
        categoryId: json["categoryId"],
        time: json["time"],
        title: json["title"],
        image: json["image"],
        date: json["date"],
        isFavorite: json["isFavorite"] ?? false,
        desc: json["desc"]);
  }
}
