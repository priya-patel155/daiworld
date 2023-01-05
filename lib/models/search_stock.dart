class searchstock {
  List<Data>? data;
  String? message;
  String? status;

  searchstock({this.data, this.message, this.status});

  searchstock.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? value;
  String? listType;
  String? urlValue;
  String? urlValueHov;

  Data({this.id, this.value, this.listType, this.urlValue, this.urlValueHov});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    value = json['Value'];
    listType = json['ListType'];
    urlValue = json['UrlValue'];
    urlValueHov = json['UrlValueHov'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Value'] = this.value;
    data['ListType'] = this.listType;
    data['UrlValue'] = this.urlValue;
    data['UrlValueHov'] = this.urlValueHov;
    return data;
  }
}
