enum enTable_Dealing_Users {
  ID,
  UID,
  IDBranch,
  Code,
  Name,
  EMail,
  IsActive,
  IsAdminAccount,
  IDEmployeeBind,
  Mobile,
  Phone,
  Address,
  Note,
  ImageName,
  ImageURL
}

class Dealing_Users {
  int? ID;
  String? UID;

  String? Name;
  String? EMail;
  bool? IsActive;

  Dealing_Users({
    this.ID,
    this.UID,
    this.Name,
    this.EMail,
    this.IsActive,
  });

  factory Dealing_Users.fromJson(Map<String, dynamic> json) {
    return Dealing_Users(
      ID: json['ID'],
      UID: json['UID'],
      Name: json['Name'],
      EMail: json['EMail'],
      IsActive: json['IsActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'UID': UID,
      'Name': Name,
      'EMail': EMail,
      'IsActive': IsActive,
    };
  }
}
