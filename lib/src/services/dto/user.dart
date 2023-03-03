class User {
  int? id;
  String? name;
  String? email;
  bool? email_verified_at;
  String? created_at;
  String? updated_at;
  int? salary;

  User({this.id, this.name, this.email, this.email_verified_at, this.created_at, this.updated_at, this.salary});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.email_verified_at;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    data['salary'] = this.salary;
    return data;
  }
  
}