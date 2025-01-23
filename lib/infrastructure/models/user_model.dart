
class UserModel {
  String? token;
  String? username;
  String? email;
  String? password;
  int? points;
  int? balance;
  String? sId;
  int? iV;

  UserModel(
      {this.token,
        this.username,
        this.email,
        this.password,
        this.points,
        this.balance,
        this.sId,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    points = json['points'];
    balance = json['balance'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['points'] = this.points;
    data['balance'] = this.balance;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}