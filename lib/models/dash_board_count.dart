class Dashboardcount {
  List<Data>? data;
  String? message;
  String? status;

  Dashboardcount({this.data, this.message, this.status});

  Dashboardcount.fromJson(Map<String, dynamic> json) {
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
  int? sCnt;
  String? type;

  Data({this.sCnt, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    sCnt = json['sCnt'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sCnt'] = this.sCnt;
    data['Type'] = this.type;
    return data;
  }
}
