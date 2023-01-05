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
  Null? sOtherName;
  Null? sAddress;
  Null? sAddress2;
  Null? sAddress3;
  Null? sCity;
  Null? sZipcode;
  Null? sState;
  Null? sCountry;
  Null? sMobile;
  Null? sPhone;
  String? sEmail;
  Null? sEmailPersonal;
  Null? sPassportId;
  Null? sHkId;
  String? sCompName;
  Null? sCompAddress;
  Null? sCompAddress2;
  Null? sCompAddress3;
  Null? sCompCity;
  Null? sCompZipcode;
  Null? sCompState;
  Null? sCompCountry;
  String? sCompMobile;
  Null? sCompMobile2;
  Null? sCompPhone;
  Null? sCompPhone2;
  Null? sCompFaxNo;
  String? sCompEmail;
  Null? sRapNetId;
  Null? sCompRegNo;
  int? iUserType;
  String? sUserType;
  int? iEmpId;
  int? iEmpId2;
  Null? assistBy1;
  Null? assistBy2;
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
  Null? sStockCategory;
  Null? scompemail2;
  String? sCreatedDate;
  String? sModifiedDate;
  Null? sWeChatId;
  Null? sSkypeId;
  Null? sWebsite;
  int? iCompCityId;
  int? iCompCountryId;
  Null? fortunePartyCode;
  Null? dBA;
  Null? remark;
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
  Null? supplierId;
  int? messageId;
  Null? messageName;
  bool? orderApproved;
  String? lastLoginDate;
  String? lastActivationDate;
  String? daysFromLastActivation;
  String? daysFromLastLogin;
  Null? sUNRISEView;
  Null? sHAIRUView;
  Null? jBView;
  Null? kGKView;
  Null? sUNRISEDownload;
  Null? sHAIRUDownload;
  Null? jBDownload;
  Null? kGKDownload;
  Null? supplierName;

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
      this.sOtherName,
      this.sAddress,
      this.sAddress2,
      this.sAddress3,
      this.sCity,
      this.sZipcode,
      this.sState,
      this.sCountry,
      this.sMobile,
      this.sPhone,
      this.sEmail,
      this.sEmailPersonal,
      this.sPassportId,
      this.sHkId,
      this.sCompName,
      this.sCompAddress,
      this.sCompAddress2,
      this.sCompAddress3,
      this.sCompCity,
      this.sCompZipcode,
      this.sCompState,
      this.sCompCountry,
      this.sCompMobile,
      this.sCompMobile2,
      this.sCompPhone,
      this.sCompPhone2,
      this.sCompFaxNo,
      this.sCompEmail,
      this.sRapNetId,
      this.sCompRegNo,
      this.iUserType,
      this.sUserType,
      this.iEmpId,
      this.iEmpId2,
      this.assistBy1,
      this.assistBy2,
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
      this.sStockCategory,
      this.scompemail2,
      this.sCreatedDate,
      this.sModifiedDate,
      this.sWeChatId,
      this.sSkypeId,
      this.sWebsite,
      this.iCompCityId,
      this.iCompCountryId,
      this.fortunePartyCode,
      this.dBA,
      this.remark,
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
      this.supplierId,
      this.messageId,
      this.messageName,
      this.orderApproved,
      this.lastLoginDate,
      this.lastActivationDate,
      this.daysFromLastActivation,
      this.daysFromLastLogin,
      this.sUNRISEView,
      this.sHAIRUView,
      this.jBView,
      this.kGKView,
      this.sUNRISEDownload,
      this.sHAIRUDownload,
      this.jBDownload,
      this.kGKDownload,
      this.supplierName});

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
    sOtherName = json['sOtherName'];
    sAddress = json['sAddress'];
    sAddress2 = json['sAddress2'];
    sAddress3 = json['sAddress3'];
    sCity = json['sCity'];
    sZipcode = json['sZipcode'];
    sState = json['sState'];
    sCountry = json['sCountry'];
    sMobile = json['sMobile'];
    sPhone = json['sPhone'];
    sEmail = json['sEmail'];
    sEmailPersonal = json['sEmailPersonal'];
    sPassportId = json['sPassportId'];
    sHkId = json['sHkId'];
    sCompName = json['sCompName'];
    sCompAddress = json['sCompAddress'];
    sCompAddress2 = json['sCompAddress2'];
    sCompAddress3 = json['sCompAddress3'];
    sCompCity = json['sCompCity'];
    sCompZipcode = json['sCompZipcode'];
    sCompState = json['sCompState'];
    sCompCountry = json['sCompCountry'];
    sCompMobile = json['sCompMobile'];
    sCompMobile2 = json['sCompMobile2'];
    sCompPhone = json['sCompPhone'];
    sCompPhone2 = json['sCompPhone2'];
    sCompFaxNo = json['sCompFaxNo'];
    sCompEmail = json['sCompEmail'];
    sRapNetId = json['sRapNetId'];
    sCompRegNo = json['sCompRegNo'];
    iUserType = json['iUserType'];
    sUserType = json['sUserType'];
    iEmpId = json['iEmpId'];
    iEmpId2 = json['iEmpId2'];
    assistBy1 = json['AssistBy1'];
    assistBy2 = json['AssistBy2'];
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
    sStockCategory = json['sStockCategory'];
    scompemail2 = json['scompemail2'];
    sCreatedDate = json['sCreatedDate'];
    sModifiedDate = json['sModifiedDate'];
    sWeChatId = json['sWeChatId'];
    sSkypeId = json['sSkypeId'];
    sWebsite = json['sWebsite'];
    iCompCityId = json['iCompCityId'];
    iCompCountryId = json['iCompCountryId'];
    fortunePartyCode = json['FortunePartyCode'];
    dBA = json['DBA'];
    remark = json['Remark'];
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
    supplierId = json['SupplierId'];
    messageId = json['MessageId'];
    messageName = json['MessageName'];
    orderApproved = json['OrderApproved'];
    lastLoginDate = json['LastLoginDate'];
    lastActivationDate = json['LastActivationDate'];
    daysFromLastActivation = json['DaysFromLastActivation'];
    daysFromLastLogin = json['DaysFromLastLogin'];
    sUNRISEView = json['SUNRISE_View'];
    sHAIRUView = json['SHAIRU_View'];
    jBView = json['JB_View'];
    kGKView = json['KGK_View'];
    sUNRISEDownload = json['SUNRISE_Download'];
    sHAIRUDownload = json['SHAIRU_Download'];
    jBDownload = json['JB_Download'];
    kGKDownload = json['KGK_Download'];
    supplierName = json['SupplierName'];
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
    data['sOtherName'] = this.sOtherName;
    data['sAddress'] = this.sAddress;
    data['sAddress2'] = this.sAddress2;
    data['sAddress3'] = this.sAddress3;
    data['sCity'] = this.sCity;
    data['sZipcode'] = this.sZipcode;
    data['sState'] = this.sState;
    data['sCountry'] = this.sCountry;
    data['sMobile'] = this.sMobile;
    data['sPhone'] = this.sPhone;
    data['sEmail'] = this.sEmail;
    data['sEmailPersonal'] = this.sEmailPersonal;
    data['sPassportId'] = this.sPassportId;
    data['sHkId'] = this.sHkId;
    data['sCompName'] = this.sCompName;
    data['sCompAddress'] = this.sCompAddress;
    data['sCompAddress2'] = this.sCompAddress2;
    data['sCompAddress3'] = this.sCompAddress3;
    data['sCompCity'] = this.sCompCity;
    data['sCompZipcode'] = this.sCompZipcode;
    data['sCompState'] = this.sCompState;
    data['sCompCountry'] = this.sCompCountry;
    data['sCompMobile'] = this.sCompMobile;
    data['sCompMobile2'] = this.sCompMobile2;
    data['sCompPhone'] = this.sCompPhone;
    data['sCompPhone2'] = this.sCompPhone2;
    data['sCompFaxNo'] = this.sCompFaxNo;
    data['sCompEmail'] = this.sCompEmail;
    data['sRapNetId'] = this.sRapNetId;
    data['sCompRegNo'] = this.sCompRegNo;
    data['iUserType'] = this.iUserType;
    data['sUserType'] = this.sUserType;
    data['iEmpId'] = this.iEmpId;
    data['iEmpId2'] = this.iEmpId2;
    data['AssistBy1'] = this.assistBy1;
    data['AssistBy2'] = this.assistBy2;
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
    data['sStockCategory'] = this.sStockCategory;
    data['scompemail2'] = this.scompemail2;
    data['sCreatedDate'] = this.sCreatedDate;
    data['sModifiedDate'] = this.sModifiedDate;
    data['sWeChatId'] = this.sWeChatId;
    data['sSkypeId'] = this.sSkypeId;
    data['sWebsite'] = this.sWebsite;
    data['iCompCityId'] = this.iCompCityId;
    data['iCompCountryId'] = this.iCompCountryId;
    data['FortunePartyCode'] = this.fortunePartyCode;
    data['DBA'] = this.dBA;
    data['Remark'] = this.remark;
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
    data['SupplierId'] = this.supplierId;
    data['MessageId'] = this.messageId;
    data['MessageName'] = this.messageName;
    data['OrderApproved'] = this.orderApproved;
    data['LastLoginDate'] = this.lastLoginDate;
    data['LastActivationDate'] = this.lastActivationDate;
    data['DaysFromLastActivation'] = this.daysFromLastActivation;
    data['DaysFromLastLogin'] = this.daysFromLastLogin;
    data['SUNRISE_View'] = this.sUNRISEView;
    data['SHAIRU_View'] = this.sHAIRUView;
    data['JB_View'] = this.jBView;
    data['KGK_View'] = this.kGKView;
    data['SUNRISE_Download'] = this.sUNRISEDownload;
    data['SHAIRU_Download'] = this.sHAIRUDownload;
    data['JB_Download'] = this.jBDownload;
    data['KGK_Download'] = this.kGKDownload;
    data['SupplierName'] = this.supplierName;
    return data;
  }
}
