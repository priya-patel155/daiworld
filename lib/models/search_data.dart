import 'package:uuid/uuid.dart';

class searchData {
  int? id;
  String? unique_id;
  String? value;
  String? listType;
  String? urlValue;
  String? urlValueHov;
  bool? isselected;
  var uuid = Uuid();
  searchData(
      {this.id,
      this.value,
      this.listType,
      this.urlValue,
      this.urlValueHov,
      this.unique_id});

  searchData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    value = json['Value'];
    listType = json['ListType'];
    urlValue = json['UrlValue'];
    urlValueHov = json['UrlValueHov'];
    isselected = json['isselected'];
    unique_id = uuid.v1();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Value'] = this.value;
    data['ListType'] = this.listType;
    data['UrlValue'] = this.urlValue;
    data['UrlValueHov'] = this.urlValueHov;
    data['isselected'] = this.isselected;
    data['unique_id'] = this.unique_id;
    return data;
  }
}
