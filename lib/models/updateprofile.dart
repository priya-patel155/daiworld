class updateProfile {
  String? message;
  String? status;
  String? error;

  updateProfile({this.message, this.status, this.error});

  updateProfile.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    data['Error'] = this.error;
    return data;
  }
}
