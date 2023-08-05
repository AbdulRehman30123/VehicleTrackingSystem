class Today {
  String? drviername;
  String? numberplate;
  String? vehiclename;
  Today({this.drviername, this.numberplate, this.vehiclename});

  Today.fromJson(Map<String, dynamic> json) {
    drviername = json["drivername"];
    numberplate = json["numberplate"];
    vehiclename = json["vehiclename"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["drivername"] = this.drviername;
    data["numberplate"] = this.numberplate;
    data["vehiclename"] = this.vehiclename;

    return data;
  }
}
