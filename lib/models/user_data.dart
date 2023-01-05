class UserData {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userID;
  String? userName;
  String? status;
  String? message;
  String? isAdmin;
  String? isEmp;
  String? isGuest;
  String? transID;
  String? issued;
  String? expires;
  String? error;
  String? error_description;

  UserData(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userID,
      this.userName,
      this.status,
      this.message,
      this.isAdmin,
      this.isEmp,
      this.isGuest,
      this.transID,
      this.issued,
      this.error,
      this.error_description,
      this.expires});

  UserData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userID = json['UserID'];
    userName = json['UserName'];
    status = json['Status'];
    message = json['Message'];
    isAdmin = json['IsAdmin'];
    isEmp = json['IsEmp'];
    isGuest = json['IsGuest'];
    transID = json['TransID'];
    issued = json['.issued'];
    expires = json['.expires'];
    error = json['error'];
    error_description = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['UserID'] = this.userID;
    data['UserName'] = this.userName;
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['IsAdmin'] = this.isAdmin;
    data['IsEmp'] = this.isEmp;
    data['IsGuest'] = this.isGuest;
    data['TransID'] = this.transID;
    data['.issued'] = this.issued;
    data['.expires'] = this.expires;
    data['error'] = this.error;
    data['error_description'] = this.error_description;
    return data;
  }
}
