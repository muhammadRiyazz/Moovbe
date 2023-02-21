class bus {
  bus({
    required this.status,
    required this.busesList,
  });

  bool status;
  List<BusList> busesList;

  factory bus.fromJson(Map<String, dynamic> json) => bus(
        status: json["status"],
        busesList: List<BusList>.from(
            json["bus_list"].map((x) => BusList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "bus_list": List<dynamic>.from(busesList.map((x) => x.toJson())),
      };
}

class BusList {
  BusList({
    required this.id,
    required this.name,
    required this.image,
    required this.seatcount,
    required this.type,
    required this.driver,
  });

  int id;
  String name;
  String image;
  String seatcount;
  String type;
  int driver;

  factory BusList.fromJson(Map<String, dynamic> json) => BusList(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      seatcount: json["seat_count"],
      driver: json["driver"],
      type: json["type"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "seat_count": seatcount,
        "driver": driver,
        "type": type,
      };
}
