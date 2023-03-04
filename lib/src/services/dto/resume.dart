import 'dart:convert';

class IResume {
  int? salary;
  int? balance;
  String? status;
  Revenues? revenues;
  Revenues? expenses;
  // List<Payload>? payload;
  Payload? payload;

  IResume(
      {this.salary,
      this.balance,
      this.status,
      this.revenues,
      this.expenses,
      this.payload});

  IResume.fromJson(Map<String, dynamic> json) {
    salary = json['salary'];
    balance = json['balance'];
    status = json['status'];
    revenues = json['revenues'] != null
        ? new Revenues.fromJson(json['revenues'])
        : null;
    expenses = json['expenses'] != null
        ? new Revenues.fromJson(json['expenses'])
        : null;
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    // final payloadList = json['payload'] as List;
    // payload = json['payload'] != null ? payloadList.map((e) => Payload.fromJson(e)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salary'] = this.salary;
    data['balance'] = this.balance;
    data['status'] = this.status;
    if (this.revenues != null) {
      data['revenues'] = this.revenues!.toJson();
    }
    if (this.expenses != null) {
      data['expenses'] = this.expenses!.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
      // data['payload'] = this.payload!.toList();
    }
    return data;
  }
}

class Revenues {
  int? total;
  int? quantity;
  int? average;

  Revenues({this.total, this.quantity, this.average});

  Revenues.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    quantity = json['quantity'];
    average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    data['average'] = this.average;
    return data;
  }
}

class Payload {
  String? startDate;
  String? endDate;

  Payload({this.startDate, this.endDate});

  Payload.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
