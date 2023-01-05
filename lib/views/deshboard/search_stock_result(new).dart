import 'dart:convert';
import 'dart:io';
import 'package:diaworld/core/constants/app_assets.dart';
import 'package:diaworld/views/deshboard/exceldownlode.dart';
import 'package:diaworld/views/deshboard/search_stock.dart';
import 'package:diaworld/views/deshboard/search_stock_new.dart';
import 'package:diaworld/views/deshboard/searchdetails_screen.dart';
import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../core/constants/app_Color.dart';
import '../../models/GetSearchModel.dart';
import '../../models/search_data.dart';
import '../../models/user_data.dart';
import '../../widgets/loder.dart';
import 'Placeorder.dart';
import 'order_history.dart';

class SearchstockNew extends StatefulWidget {
  List<searchData> searchlist;
  String? tablefrom;
  String? tableto;
  String? depthfrom;
  String? depthto;
  String? discountfrom;
  String? discountto;
  String? priceusdfrom;
  String? priceusdto;
  String? totalamtfrom;
  String? totalamtto;
  String? newarrival;
  String? keyfinal;
  String? SmartSearch;


  SearchstockNew(
      {Key? key,
      required List<searchData> this.searchlist,
      this.tablefrom,
      this.tableto,
      this.depthfrom,
      this.depthto,
      this.discountfrom,
      this.discountto,
      this.priceusdfrom,
      this.priceusdto,
      this.totalamtfrom,
      this.totalamtto,
      this.newarrival,
      this.keyfinal,
      this.SmartSearch})
      : super(key: key);

  @override
  State<SearchstockNew> createState() => _SearchstockNewState();
}

class _SearchstockNewState extends State<SearchstockNew> {
  String? token;
  List<GetSearchModel>? getserchmodel = [];
  bool isLoading = false;
  bool dataLoaded = true;
  int _selectedIndex = 0; //New

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Map<String, dynamic> data = jsonDecode(shared.getString('register')!);
    var user = UserData.fromJson(data);
    setState(() {
      token = user.accessToken;
    });
    // print('access token ${token}');
    await getsearchlist();
  }

  Future getsearchlist() async {
    setState(() {
      isLoading = true;
    });

    List<String> keys = [];
    widget.searchlist.forEach((element) {
      keys.add(element.listType!);
    });

    Map<String, List<String>> obj = {};
    var distinctIds = keys.toSet().toList();
    distinctIds.forEach((keyElement) {
      obj[keyElement] = [];
    });

    widget.searchlist.forEach((element) {
      if (obj.containsKey(element.listType)) {
        obj[element.listType!]!.add(element.value!);
      }
    });

    Map<String, String> finalObj = {};
    obj.forEach((key, value) {
      String data = value.join(',');
      finalObj[key] = data;
      // finalObj[key] = data;
    });

    finalObj['table_per'] = "${widget.tablefrom},${widget.tableto}";
    finalObj['depth'] = "${widget.depthfrom},${widget.depthto}";
    finalObj['Final_Disc'] = "${widget.discountfrom},${widget.discountto}";
    finalObj['FormPricePerCts'] = "${widget.priceusdfrom}";
    finalObj['ToPricePerCts'] = "${widget.priceusdto}";
    finalObj['FormNetAmt'] = "${widget.totalamtfrom}";
    finalObj['ToNetAmt'] = "${widget.totalamtto}";
    finalObj['NewArrival'] = "${widget.newarrival}";
    finalObj['KeyToSymbol'] = "${widget.keyfinal}";
    finalObj['SmartSearch'] = "${widget.SmartSearch}";
    finalObj['ActivityType'] = "Get";
    finalObj['FormName'] = "Search Stock";
    finalObj['ColorType'] = "Regular";
    finalObj['PageNo'] = "1";
    finalObj['PgSize'] = "500";
    finalObj['UsedFor'] = "View";

    print('sdnckjsdncj${finalObj}');

    Map<String, dynamic> formdata = (finalObj);
    // print('sbdcbsddbsjhbhjdsb${searh_map.entries}');
    final response = await ApiClient().dio.post(Constant.getsearchstock,
        data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    print(response);
    if (response.data['Data'].length > 0) {
      if (getserchmodel != null) {
        for (int i = 0; i < response.data['Data'][0]['DataList'].length; i++) {
          // print(response.data['Data'][0]['DataList'][i]);
          getserchmodel!.add(GetSearchModel.fromJson(
              (response.data['Data'][0]['DataList'][i])));
        }
        setState(() {
          isLoading = false;
          dataLoaded = false;
        });
      } else {
        print('sncjkasnc');
        setState(() {
          isLoading = false;
          dataLoaded = false;
        });
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('No Data Found')));

      }
    } else {
      setState(() {
        isLoading = false;
        dataLoaded = false;
      });
    }

    setState(() {});
  }

  String? filePath;

  exportDataToExcel() async {
    var excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        "Stock Id";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value =
        "Certi No";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value =
        "Cts";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value =
        "Shape";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)).value =
        "Color";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)).value =
        "Polish";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Clarity";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Symm";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Cut";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        "Fls";

    for (int i = 0; i < getserchmodel!.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
          .value = getserchmodel![i].iUserid;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
          .value = getserchmodel![i].certiNo;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
          .value = getserchmodel![i].cts;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
          .value = getserchmodel![i].shape;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1))
          .value = getserchmodel![i].color;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1))
          .value = getserchmodel![i].polish;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 1))
          .value = getserchmodel![i].clarity;
    }

    List<int>? fileBytes = excel.save();

    var dir = await getExternalStorageDirectory();
    print('${dir!.path}/" + "Invoice_Report.xlsx"');
    File file = File("${dir.path}/" + "Invoice_Report.xlsx");
    print(dir.path);
    File urlFile = await file.writeAsBytes(fileBytes!);
    print(urlFile.absolute.path);
    filePath = urlFile.absolute.path;
    print("filePath $filePath");
    if (filePath != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Download Successfully')));

      await file.writeAsBytes(fileBytes);
      filePath = file.absolute.path;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchStockNew()));
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderHistory()));
      } /*else if (_selectedIndex == 2) {
      }*/ else if (_selectedIndex == 2) {
        List<String> stoneRefNo = [];

        for (var i = 0; i < getserchmodel!.length; i++) {
          if (getserchmodel![i].isselect == true) {
            print(getserchmodel![i].stoneRefNo);
            print(getserchmodel![i].cts);
            print(getserchmodel![i].isselect);
            stoneRefNo.add(getserchmodel![i].stoneRefNo!);
          }
        }

        if (stoneRefNo.isEmpty) {
          Fluttertoast.showToast(
              msg: "Stone not selected", // message
              toastLength: Toast.LENGTH_SHORT, // length
              gravity: ToastGravity.BOTTOM, // location
              timeInSecForIosWeb: 1 // duration
              );
        } else {
          String s = stoneRefNo.join(',');
          print("stoneRefNo = " + '${s}');

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaceOrder(
                        stoneref: s,
                      )));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: CustomTheme.primarycolor,
            title: Text(
              'SEARCH RESULT',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: [
              GestureDetector(
                child: Icon(
                  Icons.download_rounded,
                  color: CustomTheme.white,
                ),
                onTap: () {
                  exportDataToExcel();
                },
              ),
              SizedBox(
                width: 4.w,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            selectedItemColor: Colors.white,
            backgroundColor: CustomTheme.primarycolor,
            selectedFontSize: 10,
            unselectedFontSize: 9,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ImageUtils.istock,
                  ),
                ),
                label: 'Stock',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ImageUtils.iorder,
                  ),
                ),
                label: 'MyOrder',
              ),
              /*BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ImageUtils.inew,
                  ),
                ),
                label: 'NewArrival',
              ),*/
             /* BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ImageUtils.icart,
                  ),
                ),
                label: 'MyCart',
              ),*/
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ImageUtils.iplaceorder,
                  ),
                ),
                label: 'Place Order',
              ),
            ],
            currentIndex: _selectedIndex,
            //New
            onTap: _onItemTapped,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 3.w,
                ),
                Center(
                  child: Text(
                    // getserchmodel!.dataList!.length.toString(),
                    '1 to ${getserchmodel!.length.toString()}',
                    style: TextStyle(color: CustomTheme.grey),
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                (isLoading == false &&
                        dataLoaded == false &&
                        getserchmodel!.length > 0)
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: getserchmodel!.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchDetails(
                                                    getsearchmodel:
                                                        getserchmodel![index],
                                                  )));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: const Offset(1.0, 1.0),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0,
                                            ), //
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Container(
                                              //   height: 10.h,
                                              //   width: 5.w,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(10),
                                              //     //set border radius to 50% of square height and width
                                              //     image: DecorationImage(
                                              //       image: NetworkImage(
                                              //           getserchmodel![index]
                                              //               .imageUrl
                                              //               .toString(),
                                              //           scale: 1.0),
                                              //       fit: BoxFit
                                              //           .cover, //change image fill type
                                              //     ),
                                              //   ),
                                              //   child: Text(''),
                                              // ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      ImageUtils.diamondslogo,
                                                  // Before image load
                                                  image: getserchmodel![index]
                                                      .Actual_image_url
                                                      .toString(),
                                                  // After image load
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),

                                              /* Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Center(
                                                  child:
                                                      // Image.network(
                                                      //     getserchmodel![index]
                                                      //         .imageUrl
                                                      //         .toString())
                                                      SvgPicture.asset(
                                                    ImageUtils.diamondshape,
                                                    height: 10.w,
                                                  ),
                                                ),
                                              ),*/

                                              SizedBox(
                                                width: 10,
                                              ),

                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${getserchmodel![index].shape}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      getserchmodel![index]
                                                                  .lab ==
                                                              'NON'
                                                          ? SizedBox()
                                                          : Text(
                                                              '${getserchmodel![index].lab}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      12.sp),
                                                            ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text(
                                                        '${getserchmodel![index].stoneRefNo}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.sp),
                                                      ),
                                                      //   csi-458153, GIA
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.w,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Cts:${getserchmodel![index].cts!.toStringAsFixed(2) ?? ''}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        'Color:${getserchmodel![index].color ?? ''}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        'Clarity:${getserchmodel![index].clarity ?? ''}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Checkbox(
                                                      value:
                                                          getserchmodel![index]
                                                              .isselect,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          getserchmodel![index]
                                                              .isselect = val!;
                                                          print(getserchmodel![
                                                                  index]
                                                              .isselect);
                                                        });
                                                      }),
                                                ),
                                              ),

                                              // const Spacer(),
                                              // Icon(
                                              //   Icons.crop_square,
                                              //   color: CustomTheme.grey,
                                              //   size: 30,
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Cut:',
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 15),
                                                            child: Text(
                                                              '${getserchmodel![index].cut ?? ''}',
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Polish:',
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 15),
                                                            child: Text(
                                                              ' ${getserchmodel![index].polish ?? ''}',
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Symm:',
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 15),
                                                            child: Text(
                                                              '${getserchmodel![index].symm ?? ''}',
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Fls:',
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].fls ?? ''}',
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Certi No:',
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].certiNo ?? ''}',
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.w,
                                          ),
                                          Divider(
                                            height: 1,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 4.w,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Rap\nPrice(\$):',
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].curRapRate!.toStringAsFixed(0) ?? ''}',
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                      SizedBox(
                                                        height: 2.w,
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        height: 2.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Disc (%)',
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].finalDisc!.toStringAsFixed(2) ?? ''}',
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 2.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Amount(\$):',
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].netAmount!.toStringAsFixed(2) ?? ''}',
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                      SizedBox(
                                                        height: 4.2.w,
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        height: 2.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Price/\nCTS(\$):',
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Text(
                                                            '${getserchmodel![index].pricePerCts!.toStringAsFixed(2) ?? ''}',
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  )
                                ],
                              );
                            }),
                      )
                    : Text('no data found')
              ],
            ),
          ),
        ),
        Container(
          child: isLoading ? Loder(bgColor: CustomTheme.black) : Container(),
        ),
      ],
    );
  }

  Widget datatext() {
    return Center(child: Text('No Data Found'));
  }
}
