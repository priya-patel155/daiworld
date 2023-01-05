class Getprofile {
  List<Data>? data;
  String? message;
  String? status;

  Getprofile({this.data, this.message, this.status});

  Getprofile.fromJson(Map<String, dynamic> json) {
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
  int? iTotalRec;
  int? iSr;
  int? iUserid;
  String? sUsername;
  String? sPassword;
  String? sFirstName;
  String? sLastName;
  String? sFullName;
  String? userDet;
  String? sEmail;
  String? sCompName;
  String? sCompMobile;
  String? sCompEmail;
  int? iUserType;
  String? sUserType;
  int? iEmpId;
  int? iEmpId2;
  int? iLoginFailed;
  bool? bIsActive;
  bool? bIsDeleted;
  String? dtModifiedDate;
  int? iModifiedBy;
  String? dtCreatedDate;
  bool? bIsCompUser;
  int? dAYS;
  String? dtSuspendedDate;
  String? suspended;
  String? sCreatedDate;
  String? sModifiedDate;
  int? iCompCityId;
  int? iCompCountryId;
  bool? deletePermission;
  bool? isPrimary;
  bool? searchStock;
  bool? placeOrder;
  bool? orderHisrory;
  bool? myCart;
  bool? myWishlist;
  bool? quickSearch;
  bool? deleteUser;
  bool? subUserCount;
  bool? isPrimaryUser;
  int? messageId;
  bool? orderApproved;
  String? lastLoginDate;
  String? lastActivationDate;
  String? daysFromLastActivation;
  String? daysFromLastLogin;

  Data(
      {this.iTotalRec,
      this.iSr,
      this.iUserid,
      this.sUsername,
      this.sPassword,
      this.sFirstName,
      this.sLastName,
      this.sFullName,
      this.userDet,
      this.sEmail,
      this.sCompName,
      this.sCompMobile,
      this.sCompEmail,
      this.iUserType,
      this.sUserType,
      this.iEmpId,
      this.iEmpId2,
      this.iLoginFailed,
      this.bIsActive,
      this.bIsDeleted,
      this.dtModifiedDate,
      this.iModifiedBy,
      this.dtCreatedDate,
      this.bIsCompUser,
      this.dAYS,
      this.dtSuspendedDate,
      this.suspended,
      this.sCreatedDate,
      this.sModifiedDate,
      this.iCompCityId,
      this.iCompCountryId,
      this.deletePermission,
      this.isPrimary,
      this.searchStock,
      this.placeOrder,
      this.orderHisrory,
      this.myCart,
      this.myWishlist,
      this.quickSearch,
      this.deleteUser,
      this.subUserCount,
      this.isPrimaryUser,
      this.messageId,
      this.orderApproved,
      this.lastLoginDate,
      this.lastActivationDate,
      this.daysFromLastActivation,
      this.daysFromLastLogin});

  Data.fromJson(Map<String, dynamic> json) {
    iTotalRec = json['iTotalRec'];
    iSr = json['iSr'];
    iUserid = json['iUserid'];
    sUsername = json['sUsername'];
    sPassword = json['sPassword'];
    sFirstName = json['sFirstName'];
    sLastName = json['sLastName'];
    sFullName = json['sFullName'];
    userDet = json['UserDet'];
    sEmail = json['sEmail'];
    sCompName = json['sCompName'];
    sCompMobile = json['sCompMobile'];
    sCompEmail = json['sCompEmail'];
    iUserType = json['iUserType'];
    sUserType = json['sUserType'];
    iEmpId = json['iEmpId'];
    iEmpId2 = json['iEmpId2'];
    iLoginFailed = json['iLoginFailed'];
    bIsActive = json['bIsActive'];
    bIsDeleted = json['bIsDeleted'];
    dtModifiedDate = json['dtModifiedDate'];
    iModifiedBy = json['iModifiedBy'];
    dtCreatedDate = json['dtCreatedDate'];
    bIsCompUser = json['bIsCompUser'];
    dAYS = json['DAYS'];
    dtSuspendedDate = json['dtSuspendedDate'];
    suspended = json['Suspended'];
    sCreatedDate = json['sCreatedDate'];
    sModifiedDate = json['sModifiedDate'];
    iCompCityId = json['iCompCityId'];
    iCompCountryId = json['iCompCountryId'];
    deletePermission = json['DeletePermission'];
    isPrimary = json['IsPrimary'];
    searchStock = json['SearchStock'];
    placeOrder = json['PlaceOrder'];
    orderHisrory = json['OrderHisrory'];
    myCart = json['MyCart'];
    myWishlist = json['MyWishlist'];
    quickSearch = json['QuickSearch'];
    deleteUser = json['DeleteUser'];
    subUserCount = json['SubUserCount'];
    isPrimaryUser = json['IsPrimaryUser'];
    messageId = json['MessageId'];
    orderApproved = json['OrderApproved'];
    lastLoginDate = json['LastLoginDate'];
    lastActivationDate = json['LastActivationDate'];
    daysFromLastActivation = json['DaysFromLastActivation'];
    daysFromLastLogin = json['DaysFromLastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iTotalRec'] = this.iTotalRec;
    data['iSr'] = this.iSr;
    data['iUserid'] = this.iUserid;
    data['sUsername'] = this.sUsername;
    data['sPassword'] = this.sPassword;
    data['sFirstName'] = this.sFirstName;
    data['sLastName'] = this.sLastName;
    data['sFullName'] = this.sFullName;
    data['UserDet'] = this.userDet;
    data['sEmail'] = this.sEmail;
    data['sCompName'] = this.sCompName;
    data['sCompMobile'] = this.sCompMobile;
    data['sCompEmail'] = this.sCompEmail;
    data['iUserType'] = this.iUserType;
    data['sUserType'] = this.sUserType;
    data['iEmpId'] = this.iEmpId;
    data['iEmpId2'] = this.iEmpId2;
    data['iLoginFailed'] = this.iLoginFailed;
    data['bIsActive'] = this.bIsActive;
    data['bIsDeleted'] = this.bIsDeleted;
    data['dtModifiedDate'] = this.dtModifiedDate;
    data['iModifiedBy'] = this.iModifiedBy;
    data['dtCreatedDate'] = this.dtCreatedDate;
    data['bIsCompUser'] = this.bIsCompUser;
    data['DAYS'] = this.dAYS;
    data['dtSuspendedDate'] = this.dtSuspendedDate;
    data['Suspended'] = this.suspended;
    data['sCreatedDate'] = this.sCreatedDate;
    data['sModifiedDate'] = this.sModifiedDate;
    data['iCompCityId'] = this.iCompCityId;
    data['iCompCountryId'] = this.iCompCountryId;
    data['DeletePermission'] = this.deletePermission;
    data['IsPrimary'] = this.isPrimary;
    data['SearchStock'] = this.searchStock;
    data['PlaceOrder'] = this.placeOrder;
    data['OrderHisrory'] = this.orderHisrory;
    data['MyCart'] = this.myCart;
    data['MyWishlist'] = this.myWishlist;
    data['QuickSearch'] = this.quickSearch;
    data['DeleteUser'] = this.deleteUser;
    data['SubUserCount'] = this.subUserCount;
    data['IsPrimaryUser'] = this.isPrimaryUser;
    data['MessageId'] = this.messageId;
    data['OrderApproved'] = this.orderApproved;
    data['LastLoginDate'] = this.lastLoginDate;
    data['LastActivationDate'] = this.lastActivationDate;
    data['DaysFromLastActivation'] = this.daysFromLastActivation;
    data['DaysFromLastLogin'] = this.daysFromLastLogin;
    return data;
  }
}
