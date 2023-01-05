class GetSearchModel {
  int? sr;
  int? iUserid;
  String? certiNo;
  String? certiType;
  String? stoneRefNo;
  String? shape;
  String? color;
  String? clarity;
  String? cut;
  String? polish;
  String? symm;
  String? fls;
  String? lab;
  double? cts;
  String? pointer;
  double? curRapRate;
  double? salesDiscPer;
  String? status;
  double? pSeqNo;
  double? tablePer;
  double? depthPer;
  double? pricePerCts;
  double? rapAmount;
  double? netAmount;
  double? finalDisc;
  double? finalValue;
  String? promotion;
  String? newArrival;
  String? status1;
  String? shName;
  bool? bImage;
  String? imageUrl;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  String? movieUrl;
  String? viewCertiUrl;
  String? verifyCertiUrl;
  String? viewDna;
  int? pageSize;
  double? totalPage;
  String? symbol;
  String? inclusion;
  String? tableNatts;
  double? crownHeight;
  double? crownAngle;
  double? pavHeight;
  double? pavAngle;
  double? length;
  double? width;
  double? depth;
  String? shade;
  String? girdle;
  String? girdleType;
  String? stockStaus;
  String? partyName;
  String? crownNatts;
  String? crownInclusion;
  String? luster;
  String? location;
  String? sInscription;
  int? sOffer;
  String? bGM;
  String? black;
  String? sCulet;
  String? dCertiDate;
  double? dTableDepth;
  double? girdlePer;
  String? sComments;
  String? sHNA;
  String? sLrHalf;
  String? sLrHgt;
  String? sOpen;
  String? sSideFtr;
  String? sSideNatts;
  String? sStrLn;
  String? sTableFtr;
  String? imagesLink;
  String? chk;
  String? vw;
  String? stoneStatus;
  bool? bPRimg;
  bool? bASimg;
  bool? bHTimg;
  bool? bHBimg;
  bool? bMP4;
  bool? bjson;
  double? offerDisc;
  double? offerAmt;
  int? validDays;
  String? compName;
  String? userName;
  int? custId;
  String? transDate;
  String? custName;
  String? assistBy1;
  String? sShortName;
  String? tempOrderDate;
  int? isOverseas;
  String? sImglink;
  String? sVdoLink;
  double? netAmountCurrencyAmt;
  String? overseasImageDownloadLink;
  String? overseasImageDownloadLink1;
  String? overseasImageDownloadLink2;
  String? overseasImageDownloadLink3;
  String? overseasCertiDownloadLink;
  int? holdPartyCode;
  String? holdUsername;
  String? holdCompName;
  int? forCustHold;
  int? forAssistHold;
  int? forAdminHold;
  String? tableOpen;
  String? crownOpen;
  String? pavOpen;
  String? girdleOpen;
  String? curStatus;
  String? measurement;
  String? Actual_image_url;
  String? Actual_movie_url;
  String? Actual_certi_url;
  bool? isselect=false;


  GetSearchModel(
      {this.sr,
      this.iUserid,
      this.certiNo,
      this.certiType,
      this.stoneRefNo,
      this.shape,
      this.color,
      this.clarity,
      this.cut,
      this.polish,
      this.symm,
      this.fls,
      this.lab,
      this.cts,
      this.pointer,
      this.curRapRate,
      this.salesDiscPer,
      this.status,
      this.pSeqNo,
      this.tablePer,
      this.depthPer,
      this.pricePerCts,
      this.rapAmount,
      this.netAmount,
      this.finalDisc,
      this.finalValue,
      this.promotion,
      this.newArrival,
      this.status1,
      this.shName,
      this.bImage,
      this.imageUrl,
      this.imageUrl1,
      this.imageUrl2,
      this.imageUrl3,
      this.movieUrl,
      this.viewCertiUrl,
      this.verifyCertiUrl,
      this.viewDna,
      this.pageSize,
      this.totalPage,
      this.symbol,
      this.inclusion,
      this.tableNatts,
      this.crownHeight,
      this.crownAngle,
      this.pavHeight,
      this.pavAngle,
      this.length,
      this.width,
      this.depth,
      this.shade,
      this.girdle,
      this.girdleType,
      this.stockStaus,
      this.partyName,
      this.crownNatts,
      this.crownInclusion,
      this.luster,
      this.location,
      this.sInscription,
      this.sOffer,
      this.bGM,
      this.black,
      this.sCulet,
      this.dCertiDate,
      this.dTableDepth,
      this.girdlePer,
      this.sComments,
      this.sHNA,
      this.sLrHalf,
      this.sLrHgt,
      this.sOpen,
      this.sSideFtr,
      this.sSideNatts,
      this.sStrLn,
      this.sTableFtr,
      this.imagesLink,
      this.chk,
      this.vw,
      this.stoneStatus,
      this.bPRimg,
      this.bASimg,
      this.bHTimg,
      this.bHBimg,
      this.bMP4,
      this.bjson,
      this.offerDisc,
      this.offerAmt,
      this.validDays,
      this.compName,
      this.userName,
      this.custId,
      this.transDate,
      this.custName,
      this.assistBy1,
      this.sShortName,
      this.tempOrderDate,
      this.isOverseas,
      this.sImglink,
      this.sVdoLink,
      this.netAmountCurrencyAmt,
      this.overseasImageDownloadLink,
      this.overseasImageDownloadLink1,
      this.overseasImageDownloadLink2,
      this.overseasImageDownloadLink3,
      this.overseasCertiDownloadLink,
      this.holdPartyCode,
      this.holdUsername,
      this.holdCompName,
      this.forCustHold,
      this.forAssistHold,
      this.forAdminHold,
      this.tableOpen,
      this.crownOpen,
      this.pavOpen,
      this.girdleOpen,
      this.curStatus,
      this.measurement,
      this.Actual_image_url,
      this.Actual_movie_url,
      this.Actual_certi_url
      });

  GetSearchModel.fromJson(Map<String, dynamic> json) {
    sr = json['Sr'];
    iUserid = json['iUserid'];
    certiNo = json['certi_no'];
    certiType = json['certi_type'];
    stoneRefNo = json['stone_ref_no'];
    shape = json['shape'];
    color = json['color'];
    clarity = json['clarity'];
    cut = json['cut'];
    polish = json['polish'];
    symm = json['symm'];
    fls = json['fls'];
    lab = json['lab'];
    cts = json['cts'];
    pointer = json['pointer'];
    curRapRate = json['cur_rap_rate'];
    salesDiscPer = json['sales_disc_per'];
    status = json['status'];
    pSeqNo = json['p_seq_no'];
    tablePer = json['table_per'];
    depthPer = json['depth_per'];
    pricePerCts = json['price_per_cts'];
    rapAmount = json['rap_amount'];
    netAmount = json['net_amount'];
    finalDisc = json['Final_Disc'];
    finalValue = json['Final_Value'];
    promotion = json['promotion'];
    newArrival = json['new_arrival'];
    status1 = json['status1'];
    shName = json['sh_name'];
    bImage = json['bImage'];
    imageUrl = json['image_url'];
    imageUrl1 = json['image_url1'];
    imageUrl2 = json['image_url2'];
    imageUrl3 = json['image_url3'];
    movieUrl = json['movie_url'];
    viewCertiUrl = json['view_certi_url'];
    verifyCertiUrl = json['verify_certi_url'];
    viewDna = json['view_dna'];
    pageSize = json['page_size'];
    totalPage = json['total_page'];
    symbol = json['symbol'];
    inclusion = json['inclusion'];
    tableNatts = json['table_natts'];
    crownHeight = json['crown_height'];
    crownAngle = json['crown_angle'];
    pavHeight = json['pav_height'];
    pavAngle = json['pav_angle'];
    length = json['length'];
    width = json['width'];
    depth = json['depth'];
    shade = json['shade'];
    girdle = json['girdle'];
    girdleType = json['girdle_type'];
    stockStaus = json['Stock_Staus'];
    partyName = json['Party_Name'];
    crownNatts = json['Crown_Natts'];
    crownInclusion = json['Crown_Inclusion'];
    luster = json['Luster'];
    location = json['Location'];
    sInscription = json['sInscription'];
    sOffer = json['SOffer'];
    bGM = json['BGM'];
    black = json['Black'];
    sCulet = json['sCulet'];
    dCertiDate = json['dCertiDate'];
    dTableDepth = json['dTableDepth'];
    girdlePer = json['girdle_per'];
    sComments = json['sComments'];
    sHNA = json['sHNA'];
    sLrHalf = json['sLrHalf'];
    sLrHgt = json['sLrHgt'];
    sOpen = json['sOpen'];
    sSideFtr = json['sSideFtr'];
    sSideNatts = json['sSideNatts'];
    sStrLn = json['sStrLn'];
    sTableFtr = json['sTableFtr'];
    imagesLink = json['ImagesLink'];
    chk = json['chk'];
    vw = json['vw'];
    stoneStatus = json['StoneStatus'];
    bPRimg = json['bPRimg'];
    bASimg = json['bASimg'];
    bHTimg = json['bHTimg'];
    bHBimg = json['bHBimg'];
    bMP4 = json['bMP4'];
    bjson = json['bjson'];
    offerDisc = json['offerDisc'];
    offerAmt = json['offerAmt'];
    validDays = json['validDays'];
    compName = json['CompName'];
    userName = json['UserName'];
    custId = json['cust_id'];
    transDate = json['Trans_date'];
    custName = json['cust_name'];
    assistBy1 = json['AssistBy1'];
    sShortName = json['sShort_Name'];
    tempOrderDate = json['TempOrderDate'];
    isOverseas = json['IsOverseas'];
    sImglink = json['sImglink'];
    sVdoLink = json['sVdoLink'];
    netAmountCurrencyAmt = json['net_amount_CurrencyAmt'];
    overseasImageDownloadLink = json['Overseas_Image_Download_Link'];
    overseasImageDownloadLink1 = json['Overseas_Image_Download_Link1'];
    overseasImageDownloadLink2 = json['Overseas_Image_Download_Link2'];
    overseasImageDownloadLink3 = json['Overseas_Image_Download_Link3'];
    overseasCertiDownloadLink = json['Overseas_Certi_Download_Link'];
    holdPartyCode = json['Hold_Party_Code'];
    holdUsername = json['Hold_Username'];
    holdCompName = json['Hold_CompName'];
    forCustHold = json['ForCust_Hold'];
    forAssistHold = json['ForAssist_Hold'];
    forAdminHold = json['ForAdmin_Hold'];
    tableOpen = json['Table_Open'];
    crownOpen = json['Crown_Open'];
    pavOpen = json['Pav_Open'];
    girdleOpen = json['Girdle_Open'];
    curStatus = json['Cur_Status'];
    measurement = json['Measurement'];
    Actual_image_url = json['Actual_image_url'];
    Actual_movie_url = json['Actual_movie_url'];
    Actual_certi_url = json['Actual_certi_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sr'] = this.sr;
    data['iUserid'] = this.iUserid;
    data['certi_no'] = this.certiNo;
    data['certi_type'] = this.certiType;
    data['stone_ref_no'] = this.stoneRefNo;
    data['shape'] = this.shape;
    data['color'] = this.color;
    data['clarity'] = this.clarity;
    data['cut'] = this.cut;
    data['polish'] = this.polish;
    data['symm'] = this.symm;
    data['fls'] = this.fls;
    data['lab'] = this.lab;
    data['cts'] = this.cts;
    data['pointer'] = this.pointer;
    data['cur_rap_rate'] = this.curRapRate;
    data['sales_disc_per'] = this.salesDiscPer;
    data['status'] = this.status;
    data['p_seq_no'] = this.pSeqNo;
    data['table_per'] = this.tablePer;
    data['depth_per'] = this.depthPer;
    data['price_per_cts'] = this.pricePerCts;
    data['rap_amount'] = this.rapAmount;
    data['net_amount'] = this.netAmount;
    data['Final_Disc'] = this.finalDisc;
    data['Final_Value'] = this.finalValue;
    data['promotion'] = this.promotion;
    data['new_arrival'] = this.newArrival;
    data['status1'] = this.status1;
    data['sh_name'] = this.shName;
    data['bImage'] = this.bImage;
    data['image_url'] = this.imageUrl;
    data['image_url1'] = this.imageUrl1;
    data['image_url2'] = this.imageUrl2;
    data['image_url3'] = this.imageUrl3;
    data['movie_url'] = this.movieUrl;
    data['view_certi_url'] = this.viewCertiUrl;
    data['verify_certi_url'] = this.verifyCertiUrl;
    data['view_dna'] = this.viewDna;
    data['page_size'] = this.pageSize;
    data['total_page'] = this.totalPage;
    data['symbol'] = this.symbol;
    data['inclusion'] = this.inclusion;
    data['table_natts'] = this.tableNatts;
    data['crown_height'] = this.crownHeight;
    data['crown_angle'] = this.crownAngle;
    data['pav_height'] = this.pavHeight;
    data['pav_angle'] = this.pavAngle;
    data['length'] = this.length;
    data['width'] = this.width;
    data['depth'] = this.depth;
    data['shade'] = this.shade;
    data['girdle'] = this.girdle;
    data['girdle_type'] = this.girdleType;
    data['Stock_Staus'] = this.stockStaus;
    data['Party_Name'] = this.partyName;
    data['Crown_Natts'] = this.crownNatts;
    data['Crown_Inclusion'] = this.crownInclusion;
    data['Luster'] = this.luster;
    data['Location'] = this.location;
    data['sInscription'] = this.sInscription;
    data['SOffer'] = this.sOffer;
    data['BGM'] = this.bGM;
    data['Black'] = this.black;
    data['sCulet'] = this.sCulet;
    data['dCertiDate'] = this.dCertiDate;
    data['dTableDepth'] = this.dTableDepth;
    data['girdle_per'] = this.girdlePer;
    data['sComments'] = this.sComments;
    data['sHNA'] = this.sHNA;
    data['sLrHalf'] = this.sLrHalf;
    data['sLrHgt'] = this.sLrHgt;
    data['sOpen'] = this.sOpen;
    data['sSideFtr'] = this.sSideFtr;
    data['sSideNatts'] = this.sSideNatts;
    data['sStrLn'] = this.sStrLn;
    data['sTableFtr'] = this.sTableFtr;
    data['ImagesLink'] = this.imagesLink;
    data['chk'] = this.chk;
    data['vw'] = this.vw;
    data['StoneStatus'] = this.stoneStatus;
    data['bPRimg'] = this.bPRimg;
    data['bASimg'] = this.bASimg;
    data['bHTimg'] = this.bHTimg;
    data['bHBimg'] = this.bHBimg;
    data['bMP4'] = this.bMP4;
    data['bjson'] = this.bjson;
    data['offerDisc'] = this.offerDisc;
    data['offerAmt'] = this.offerAmt;
    data['validDays'] = this.validDays;
    data['CompName'] = this.compName;
    data['UserName'] = this.userName;
    data['cust_id'] = this.custId;
    data['Trans_date'] = this.transDate;
    data['cust_name'] = this.custName;
    data['AssistBy1'] = this.assistBy1;
    data['sShort_Name'] = this.sShortName;
    data['TempOrderDate'] = this.tempOrderDate;
    data['IsOverseas'] = this.isOverseas;
    data['sImglink'] = this.sImglink;
    data['sVdoLink'] = this.sVdoLink;
    data['net_amount_CurrencyAmt'] = this.netAmountCurrencyAmt;
    data['Overseas_Image_Download_Link'] = this.overseasImageDownloadLink;
    data['Overseas_Image_Download_Link1'] = this.overseasImageDownloadLink1;
    data['Overseas_Image_Download_Link2'] = this.overseasImageDownloadLink2;
    data['Overseas_Image_Download_Link3'] = this.overseasImageDownloadLink3;
    data['Overseas_Certi_Download_Link'] = this.overseasCertiDownloadLink;
    data['Hold_Party_Code'] = this.holdPartyCode;
    data['Hold_Username'] = this.holdUsername;
    data['Hold_CompName'] = this.holdCompName;
    data['ForCust_Hold'] = this.forCustHold;
    data['ForAssist_Hold'] = this.forAssistHold;
    data['ForAdmin_Hold'] = this.forAdminHold;
    data['Table_Open'] = this.tableOpen;
    data['Crown_Open'] = this.crownOpen;
    data['Pav_Open'] = this.pavOpen;
    data['Girdle_Open'] = this.girdleOpen;
    data['Cur_Status'] = this.curStatus;
    data['Measurement'] = this.measurement;
    data['Actual_image_url'] = this.Actual_image_url;
    data['Actual_movie_url'] = this.Actual_movie_url;
    data['Actual_certi_url'] = this.Actual_certi_url;
    return data;
  }
}
