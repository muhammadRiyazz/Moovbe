class Driver {
  Driver({
    required this.status,
    required this.driverList,
  });

  bool status;
  List<DriverList> driverList;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        status: json["status"],
        driverList: List<DriverList>.from(
            json["driver_list"].map((x) => DriverList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "driver_list": List<dynamic>.from(driverList.map((x) => x.toJson())),
      };
}

class DriverList {
  DriverList({
    required this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  int id;
  String name;
  String mobile;
  String licenseNo;

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
        id: json["id"] ?? 0,
        name: json["name"] ?? 'name',
        mobile: json["mobile"] ?? '',
        licenseNo: json["license_no"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
      };
}
