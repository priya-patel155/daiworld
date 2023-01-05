class DashBoardModel {
  int? sCnt;
  String? type;

  DashBoardModel({this.sCnt, this.type});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
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
