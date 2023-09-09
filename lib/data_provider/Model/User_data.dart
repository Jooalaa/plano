class User_data {
  Founduser? founduser;
  String? token;

  User_data({this.founduser, this.token});

  User_data.fromJson(Map<String, dynamic> json) {
    founduser = json['founduser'] != null
        ? new Founduser.fromJson(json['founduser'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.founduser != null) {
      data['founduser'] = this.founduser!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Founduser {
  String? sId;
  String? username;
  String? email;
  int? phone;
  String? role;

  Founduser({this.sId, this.username, this.email, this.phone, this.role});

  Founduser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    return data;
  }
}
