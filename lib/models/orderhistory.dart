class Orderhistory {
  int? iSr;
  int? iOrderid;
  int? iUserId;
  String? customerName;
  String? userName;
  String? assistBy1;
  String? companyName;
  String? orderDate;
  String? fullOrderDate;
  String? orderStatus;
  String? sCustomerNote;
  String? sAdminNote;
  double? dRapAmount;
  double? dNetPrice;
  double? pRICEPERCTS;
  int? iOrderDetId;
  String? sRefNo;
  String? sShape;
  double? dCts;
  String? sColor;
  String? sClarity;
  double? dRepPrice;
  String? sCut;
  String? sPolish;
  String? sSymm;
  String? sFls;
  double? dLength;
  double? dWidth;
  double? dDepth;
  double? dDepthPer;
  double? dTablePer;
  double? dCrAng;
  double? dCrHt;
  double? dPavAng;
  double? dPavHt;
  String? sCertiNo;
  String? sGirdle;
  double? girdlePer;
  double? dDisc;
  String? sLab;
  String? sPointer;
  String? sStatus;
  String? sShade;
  double? iSeqNo;
  String? sLuster;
  String? sTableNatts;
  String? sGirdleType;
  String? sCulet;
  double? dTableDepth;
  String? sSideFtr;
  String? sTableFtr;
  String? sInclusion;
  String? sHNA;
  String? sSideNatts;
  String? sComments;
  String? sSymbol;
  String? sStoneStatus;
  String? sCrownNatts;
  String? sCrownInclusion;
  String? location;
  double? sSupplDisc;
  String? sInscription;
  String? viewCertiUrl;
  String? verifyCertiUrl;
  bool? bPRimg;
  bool? bASimg;
  bool? bHTimg;
  bool? bHBimg;
  String? bGM;
  String? imageUrl;
  String? movieUrl;
  String? imagesLink;
  int? pageSize;
  int? totalPage;
  double? webBenefit;
  double? finalDisc;
  double? netValue;
  String? pickUpStatus;
  String? expDelDate;
  String? deliveryDate;
  String? fortunePartyCode;
  bool? isConfirmOrder;
  double? profit;
  double? sUPPBASEOFFERVALUE;
  double? supplierPrice;
  String? supplierStatus;
  String? suppOrderTime;
  String? aPIStatus;
  int? loginId;
  String? ipAddress;
  String? deviceType;
  String? orderBy;
  String? labEntryResponse;
  String? tableOpen;
  String? crownOpen;
  String? pavOpen;
  String? girdleOpen;
  String? Actual_image_url;
  String? Actual_movie_url;
  String? Actual_certi_url;

  Orderhistory(
      {this.iSr,
      this.iOrderid,
      this.iUserId,
      this.customerName,
      this.userName,
      this.assistBy1,
      this.companyName,
      this.orderDate,
      this.fullOrderDate,
      this.orderStatus,
      this.sCustomerNote,
      this.sAdminNote,
      this.dRapAmount,
      this.dNetPrice,
      this.pRICEPERCTS,
      this.iOrderDetId,
      this.sRefNo,
      this.sShape,
      this.dCts,
      this.sColor,
      this.sClarity,
      this.dRepPrice,
      this.sCut,
      this.sPolish,
      this.sSymm,
      this.sFls,
      this.dLength,
      this.dWidth,
      this.dDepth,
      this.dDepthPer,
      this.dTablePer,
      this.dCrAng,
      this.dCrHt,
      this.dPavAng,
      this.dPavHt,
      this.sCertiNo,
      this.sGirdle,
      this.girdlePer,
      this.dDisc,
      this.sLab,
      this.sPointer,
      this.sStatus,
      this.sShade,
      this.iSeqNo,
      this.sLuster,
      this.sTableNatts,
      this.sGirdleType,
      this.sCulet,
      this.dTableDepth,
      this.sSideFtr,
      this.sTableFtr,
      this.sInclusion,
      this.sHNA,
      this.sSideNatts,
      this.sComments,
      this.sSymbol,
      this.sStoneStatus,
      this.sCrownNatts,
      this.sCrownInclusion,
      this.location,
      this.sSupplDisc,
      this.sInscription,
      this.viewCertiUrl,
      this.verifyCertiUrl,
      this.bPRimg,
      this.bASimg,
      this.bHTimg,
      this.bHBimg,
      this.bGM,
      this.imageUrl,
      this.movieUrl,
      this.imagesLink,
      this.pageSize,
      this.totalPage,
      this.webBenefit,
      this.finalDisc,
      this.netValue,
      this.pickUpStatus,
      this.expDelDate,
      this.deliveryDate,
      this.fortunePartyCode,
      this.isConfirmOrder,
      this.profit,
      this.sUPPBASEOFFERVALUE,
      this.supplierPrice,
      this.supplierStatus,
      this.suppOrderTime,
      this.aPIStatus,
      this.loginId,
      this.ipAddress,
      this.deviceType,
      this.orderBy,
      this.labEntryResponse,
      this.tableOpen,
      this.crownOpen,
      this.pavOpen,
      this.girdleOpen,
      this.Actual_image_url,
        this.Actual_movie_url,
        this.Actual_certi_url});

  Orderhistory.fromJson(Map<String, dynamic> json) {
    iSr = json['iSr'];
    iOrderid = json['iOrderid'];
    iUserId = json['iUserId'];
    customerName = json['CustomerName'];
    userName = json['UserName'];
    assistBy1 = json['AssistBy1'];
    companyName = json['CompanyName'];
    orderDate = json['OrderDate'];
    fullOrderDate = json['FullOrderDate'];
    orderStatus = json['OrderStatus'];
    sCustomerNote = json['sCustomerNote'];
    sAdminNote = json['sAdminNote'];
    dRapAmount = json['dRapAmount'];
    dNetPrice = json['dNetPrice'];
    pRICEPERCTS = json['PRICE_PER_CTS'];
    iOrderDetId = json['iOrderDetId'];
    sRefNo = json['sRefNo'];
    sShape = json['sShape'];
    dCts = json['dCts'];
    sColor = json['sColor'];
    sClarity = json['sClarity'];
    dRepPrice = json['dRepPrice'];
    sCut = json['sCut'];
    sPolish = json['sPolish'];
    sSymm = json['sSymm'];
    sFls = json['sFls'];
    dLength = json['dLength'];
    dWidth = json['dWidth'];
    dDepth = json['dDepth'];
    dDepthPer = json['dDepthPer'];
    dTablePer = json['dTablePer'];
    dCrAng = json['dCrAng'];
    dCrHt = json['dCrHt'];
    dPavAng = json['dPavAng'];
    dPavHt = json['dPavHt'];
    sCertiNo = json['sCertiNo'];
    sGirdle = json['sGirdle'];
    girdlePer = json['girdle_per'];
    dDisc = json['dDisc'];
    sLab = json['sLab'];
    sPointer = json['sPointer'];
    sStatus = json['sStatus'];
    sShade = json['sShade'];
    iSeqNo = json['iSeqNo'];
    sLuster = json['sLuster'];
    sTableNatts = json['sTableNatts'];
    sGirdleType = json['sGirdleType'];
    sCulet = json['sCulet'];
    dTableDepth = json['dTableDepth'];
    sSideFtr = json['sSideFtr'];
    sTableFtr = json['sTableFtr'];
    sInclusion = json['sInclusion'];
    sHNA = json['sHNA'];
    sSideNatts = json['sSideNatts'];
    sComments = json['sComments'];
    sSymbol = json['sSymbol'];
    sStoneStatus = json['sStoneStatus'];
    sCrownNatts = json['sCrownNatts'];
    sCrownInclusion = json['sCrownInclusion'];
    location = json['Location'];
    sSupplDisc = json['sSupplDisc'];
    sInscription = json['sInscription'];
    viewCertiUrl = json['view_certi_url'];
    verifyCertiUrl = json['verify_certi_url'];
    bPRimg = json['bPRimg'];
    bASimg = json['bASimg'];
    bHTimg = json['bHTimg'];
    bHBimg = json['bHBimg'];
    bGM = json['BGM'];
    imageUrl = json['image_url'];
    movieUrl = json['movie_url'];
    imagesLink = json['ImagesLink'];
    pageSize = json['page_size'];
    totalPage = json['total_page'];
    webBenefit = json['Web_Benefit'];
    finalDisc = json['Final_Disc'];
    netValue = json['Net_Value'];
    pickUpStatus = json['PickUp_Status'];
    expDelDate = json['Exp_Del_Date'];
    deliveryDate = json['Delivery_Date'];
    fortunePartyCode = json['FortunePartyCode'];
    isConfirmOrder = json['IsConfirmOrder'];
    profit = json['Profit'];
    sUPPBASEOFFERVALUE = json['SUPP_BASE_OFFER_VALUE'];
    supplierPrice = json['SupplierPrice'];
    supplierStatus = json['Supplier_Status'];
    suppOrderTime = json['SuppOrderTime'];
    aPIStatus = json['API_Status'];
    loginId = json['LoginId'];
    ipAddress = json['IpAddress'];
    deviceType = json['DeviceType'];
    orderBy = json['OrderBy'];
    labEntryResponse = json['LabEntryResponse'];
    tableOpen = json['Table_Open'];
    crownOpen = json['Crown_Open'];
    pavOpen = json['Pav_Open'];
    girdleOpen = json['Girdle_Open'];
    Actual_image_url = json['Actual_image_url'];
    Actual_movie_url = json['Actual_movie_url'];
    Actual_certi_url = json['Actual_certi_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iSr'] = this.iSr;
    data['iOrderid'] = this.iOrderid;
    data['iUserId'] = this.iUserId;
    data['CustomerName'] = this.customerName;
    data['UserName'] = this.userName;
    data['AssistBy1'] = this.assistBy1;
    data['CompanyName'] = this.companyName;
    data['OrderDate'] = this.orderDate;
    data['FullOrderDate'] = this.fullOrderDate;
    data['OrderStatus'] = this.orderStatus;
    data['sCustomerNote'] = this.sCustomerNote;
    data['sAdminNote'] = this.sAdminNote;
    data['dRapAmount'] = this.dRapAmount;
    data['dNetPrice'] = this.dNetPrice;
    data['PRICE_PER_CTS'] = this.pRICEPERCTS;
    data['iOrderDetId'] = this.iOrderDetId;
    data['sRefNo'] = this.sRefNo;
    data['sShape'] = this.sShape;
    data['dCts'] = this.dCts;
    data['sColor'] = this.sColor;
    data['sClarity'] = this.sClarity;
    data['dRepPrice'] = this.dRepPrice;
    data['sCut'] = this.sCut;
    data['sPolish'] = this.sPolish;
    data['sSymm'] = this.sSymm;
    data['sFls'] = this.sFls;
    data['dLength'] = this.dLength;
    data['dWidth'] = this.dWidth;
    data['dDepth'] = this.dDepth;
    data['dDepthPer'] = this.dDepthPer;
    data['dTablePer'] = this.dTablePer;
    data['dCrAng'] = this.dCrAng;
    data['dCrHt'] = this.dCrHt;
    data['dPavAng'] = this.dPavAng;
    data['dPavHt'] = this.dPavHt;
    data['sCertiNo'] = this.sCertiNo;
    data['sGirdle'] = this.sGirdle;
    data['girdle_per'] = this.girdlePer;
    data['dDisc'] = this.dDisc;
    data['sLab'] = this.sLab;
    data['sPointer'] = this.sPointer;
    data['sStatus'] = this.sStatus;
    data['sShade'] = this.sShade;
    data['iSeqNo'] = this.iSeqNo;
    data['sLuster'] = this.sLuster;
    data['sTableNatts'] = this.sTableNatts;
    data['sGirdleType'] = this.sGirdleType;
    data['sCulet'] = this.sCulet;
    data['dTableDepth'] = this.dTableDepth;
    data['sSideFtr'] = this.sSideFtr;
    data['sTableFtr'] = this.sTableFtr;
    data['sInclusion'] = this.sInclusion;
    data['sHNA'] = this.sHNA;
    data['sSideNatts'] = this.sSideNatts;
    data['sComments'] = this.sComments;
    data['sSymbol'] = this.sSymbol;
    data['sStoneStatus'] = this.sStoneStatus;
    data['sCrownNatts'] = this.sCrownNatts;
    data['sCrownInclusion'] = this.sCrownInclusion;
    data['Location'] = this.location;
    data['sSupplDisc'] = this.sSupplDisc;
    data['sInscription'] = this.sInscription;
    data['view_certi_url'] = this.viewCertiUrl;
    data['verify_certi_url'] = this.verifyCertiUrl;
    data['bPRimg'] = this.bPRimg;
    data['bASimg'] = this.bASimg;
    data['bHTimg'] = this.bHTimg;
    data['bHBimg'] = this.bHBimg;
    data['BGM'] = this.bGM;
    data['image_url'] = this.imageUrl;
    data['movie_url'] = this.movieUrl;
    data['ImagesLink'] = this.imagesLink;
    data['page_size'] = this.pageSize;
    data['total_page'] = this.totalPage;
    data['Web_Benefit'] = this.webBenefit;
    data['Final_Disc'] = this.finalDisc;
    data['Net_Value'] = this.netValue;
    data['PickUp_Status'] = this.pickUpStatus;
    data['Exp_Del_Date'] = this.expDelDate;
    data['Delivery_Date'] = this.deliveryDate;
    data['FortunePartyCode'] = this.fortunePartyCode;
    data['IsConfirmOrder'] = this.isConfirmOrder;
    data['Profit'] = this.profit;
    data['SUPP_BASE_OFFER_VALUE'] = this.sUPPBASEOFFERVALUE;
    data['SupplierPrice'] = this.supplierPrice;
    data['Supplier_Status'] = this.supplierStatus;
    data['SuppOrderTime'] = this.suppOrderTime;
    data['API_Status'] = this.aPIStatus;
    data['LoginId'] = this.loginId;
    data['IpAddress'] = this.ipAddress;
    data['DeviceType'] = this.deviceType;
    data['OrderBy'] = this.orderBy;
    data['LabEntryResponse'] = this.labEntryResponse;
    data['Table_Open'] = this.tableOpen;
    data['Crown_Open'] = this.crownOpen;
    data['Pav_Open'] = this.pavOpen;
    data['Girdle_Open'] = this.girdleOpen;
    data['Actual_image_url'] = this.Actual_image_url;
    data['Actual_movie_url'] = this.Actual_movie_url;
    data['Actual_certi_url'] = this.Actual_certi_url;
    return data;
  }
}
