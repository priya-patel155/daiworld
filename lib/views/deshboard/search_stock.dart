import 'dart:convert';

import 'package:diaworld/core/constants/app_Color.dart';

import 'package:diaworld/views/deshboard/search_stock_result(new).dart';

import 'package:diaworld/widgets/custom_button.dart';
import 'package:diaworld/widgets/nav_bar.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../models/GetSearchModel.dart';
import '../../models/search_data.dart';

import '../../models/search_stock.dart';
import '../../models/search_stock.dart';
import '../../models/user_data.dart';
import '../../widgets/text_form_feilds.dart';

class SearchStock extends StatefulWidget {
  const SearchStock({Key? key}) : super(key: key);

  @override
  State<SearchStock> createState() => _SearchStockState();
}

class _SearchStockState extends State<SearchStock> {
  String? token;
  searchstock? searchstoke;
  GetSearchModel? _getsearchmodel;
  bool? isselected;
  int? shape1;
  int? clarity1;
  int? color1;
  int? crown_incl1;
  int? fls1;
  int? lab;
  int? location;
  int? luster;
  int? pavilionopen;
  int? pointer;
  int? polish;
  int? symm;
  int? tableincel;
  int? tableopen;
  int? grideleopen;

  List<searchData> search = [];

  List<searchData> black = [];
  List<searchData> cut = [];
  List<searchData> BGM = [];
  List<searchData> CLARITY = [];
  List<searchData> COLOR = [];
  List<searchData> CROWN_INCL = [];
  List<searchData> FLS = [];
  List<searchData> GIRDLEOPEN = [];
  List<searchData> LAB = [];
  List<searchData> LOCATION = [];
  List<searchData> LUSTER = [];
  List<searchData> PAVILIONOPEN = [];
  List<searchData> POINTER = [];
  List<searchData> POLISH = [];
  List<searchData> SHADE = [];
  List<searchData> SYMM = [];
  List<searchData> TABLE_INCL = [];
  List<searchData> TABLEOPEN = [];
  List<searchData> SHAPE = [];
  GetSearchModel? getserchmodel;
  List<searchData> selecteditemlist = [];
  TextEditingController _tablefrom = TextEditingController();
  TextEditingController _tableto = TextEditingController();
  TextEditingController _depthfrom = TextEditingController();
  TextEditingController _depthto = TextEditingController();
  TextEditingController _discountfrom = TextEditingController();
  TextEditingController _discountto = TextEditingController();

  Future getsearchlist({
    searchData? clarity,
    searchData? shape,
  }) async {
    Map<String, dynamic> searh_map = {};
    searh_map['shape'] = shape!.value;
    searh_map['clarity'] = clarity!.value;
    // searh_map['color'] = colors!.value;

    Map<String, dynamic> formdata = (searh_map);
    print(formdata.entries);
    final response = await ApiClient().dio.post(Constant.getsearchstock,
        data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    print(response.data);
    getserchmodel = GetSearchModel.fromJson(response.data);

    // if (getserchmodel!.dataList != null) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SearchstockNew()));
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Somthing went wrong!')));
    // }
  }

  List<searchData> _searchdata = [];

  searchstockfuncation(searchData data) {
    _searchdata.add(data);
  }

  Future searchkiststock() async {
    Map<String, dynamic> formdata = ({"ListValue": "dp"});
    print(formdata);
    final response = await ApiClient().dio.post(Constant.searchlist,
        data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    // print(response.data);
    setState(() {
      searchstoke = searchstock.fromJson(response.data);
    });

    searchstoke!.data!.forEach((element) {
      searchData data = searchData.fromJson(element.toJson());
      if (data.listType == 'CUT') {
        cut.add(data);
      } else if (data.listType == 'black') {
        black.add(data);
      } else if (data.listType == 'BGM') {
        BGM.add(data);
      } else if (data.listType == 'CLARITY') {
        CLARITY.add(data);
      } else if (data.listType == 'COLOR') {
        COLOR.add(data);
      } else if (data.listType == 'CROWN_INCL') {
        CROWN_INCL.add(data);
      } else if (data.listType == 'FLS') {
        FLS.add(data);
      } else if (data.listType == 'GIRDLEOPEN') {
        GIRDLEOPEN.add(data);
      } else if (data.listType == 'LAB') {
        LAB.add(data);
      } else if (data.listType == 'LOCATION') {
        LOCATION.add(data);
      } else if (data.listType == 'LUSTER') {
        LUSTER.add(data);
      } else if (data.listType == 'PAVILIONOPEN') {
        PAVILIONOPEN.add(data);
      } else if (data.listType == 'POINTER') {
        POINTER.add(data);
      } else if (data.listType == 'POLISH') {
        POLISH.add(data);
      } else if (data.listType == 'SHADE') {
        SHADE.add(data);
      } else if (data.listType == 'SYMM') {
        SYMM.add(data);
      } else if (data.listType == 'TABLE_INCL') {
        TABLE_INCL.add(data);
      } else if (data.listType == 'TABLEOPEN') {
        TABLEOPEN.add(data);
      } else if (data.listType == 'SHAPE') {
        SHAPE.add(data);
      } else {
        print('no data found');
      }
    });
    print(cut.length);
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Map<String, dynamic> data = jsonDecode(shared.getString('register')!);
    var user = UserData.fromJson(data);
    setState(() {
      token = user.accessToken;
    });
    print('access token ${token}');
    await searchkiststock();
  }

  checkById(id) {
    var myListFiltered = _searchdata.where((e) => e.unique_id == id);
    return myListFiltered.length > 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Search Stock'),
        // leading: Icon(Icons.menu),
        centerTitle: true,
        // actions: [
        //   Icon(Icons.download_rounded),
        //   SizedBox(
        //     width: 2.w,
        //   ),
        //   Icon(Icons.message),
        //   SizedBox(
        //     width: 2.w,
        //   ),
        // ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                title: 'Reset',
                onPressed: () {
                  setState(() {
                    _searchdata = [];
                  });
                },
              )),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                  child: CustomButton(
                title: 'Search',
                onPressed: () {
                  // print(_searchdata);
                  // searchData clarity = CLARITY[clarity1!];
                  // print(clarity.toJson());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchstockNew(
                                searchlist: _searchdata,
                                tablefrom: _tablefrom.text,
                                tableto: _tableto.text,
                                depthfrom: _depthfrom.text,
                                depthto: _depthto.text,
                                discountfrom: _discountfrom.text,
                                discountto: _discountto.text,
                              )));
                },
              )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Height / 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'SHAPE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 20.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: SHAPE.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where(
                                  (e) => e.unique_id == SHAPE[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(SHAPE[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id == SHAPE[index].unique_id);
                              }

                              // searchstock()
                              //   shape1 = index;
                              // SHAPE[index].isselected =
                              //     !(SHAPE[index].isselected ?? false);
                              // if (SHAPE[index].isselected ?? true) {
                              //   selecteditemlist.add(SHAPE[index]);
                              //   print('hello world add${selecteditemlist}');
                              // } else {
                              //   selecteditemlist.remove(SHAPE[index].value);
                              //   print('hello world remove ${selecteditemlist}');
                              // }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 25.w,
                            //  height: 60.w,
                            decoration: BoxDecoration(
                                color: checkById(SHAPE[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                checkById(SHAPE[index].unique_id)
                                    ? Container(
                                        child: Image.network(
                                          SHAPE[index].urlValueHov.toString(),
                                          height: 8.w,
                                          color:
                                              checkById(SHAPE[index].unique_id)
                                                  ? Colors.white
                                                  : CustomTheme.primarycolor,
                                        ),
                                      )
                                    : Container(
                                        child: SvgPicture.network(
                                          SHAPE[index].urlValue.toString(),
                                          height: 8.w,
                                          color:
                                              checkById(SHAPE[index].unique_id)
                                                  ? Colors.white
                                                  : CustomTheme.primarycolor,
                                        ),
                                      ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  SHAPE[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(SHAPE[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'CARAT WEIGHT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: POINTER.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                              e.unique_id == POINTER[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(POINTER[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                item.unique_id == POINTER[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                             width: 25.w,
                            decoration: BoxDecoration(
                                color: checkById(POINTER[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  POINTER[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(POINTER[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'COLOR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,

                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: COLOR.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where(
                                      (e) => e.unique_id == COLOR[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(COLOR[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                item.unique_id == COLOR[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 22.w,
                            decoration: BoxDecoration(
                                color: checkById(COLOR[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  COLOR[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(COLOR[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 1.w,
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'CLARITY',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: CLARITY.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == CLARITY[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(CLARITY[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id == CLARITY[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 22.w,
                            decoration: BoxDecoration(
                                color: checkById(CLARITY[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  CLARITY[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(CLARITY[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'POLISH',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: POLISH.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                              e.unique_id == POLISH[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(POLISH[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                item.unique_id == POLISH[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(POLISH[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  POLISH[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(POLISH[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'SYMM',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: SYMM.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where(
                                      (e) => e.unique_id == SYMM[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(SYMM[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                item.unique_id == SYMM[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(SYMM[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  SYMM[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(SYMM[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'FLS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: FLS.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where(
                                      (e) => e.unique_id == FLS[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(FLS[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                item.unique_id == FLS[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(FLS[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  FLS[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(FLS[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'CROWN_INCL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: CROWN_INCL.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == CROWN_INCL[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(CROWN_INCL[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    CROWN_INCL[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(CROWN_INCL[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  CROWN_INCL[index].value.toString(),
                                  style: TextStyle(
                                      color:
                                          checkById(CROWN_INCL[index].unique_id)
                                              ? Colors.white
                                              : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'GIRDLEOPEN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: GIRDLEOPEN.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == GIRDLEOPEN[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(GIRDLEOPEN[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    GIRDLEOPEN[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(GIRDLEOPEN[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  GIRDLEOPEN[index].value.toString(),
                                  style: TextStyle(
                                      color:
                                          checkById(GIRDLEOPEN[index].unique_id)
                                              ? Colors.white
                                              : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'LAB',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: LAB.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where(
                                  (e) => e.unique_id == LAB[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(LAB[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id == LAB[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(LAB[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  LAB[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(LAB[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'LOCATION',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: LOCATION.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == LOCATION[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(LOCATION[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    LOCATION[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(LOCATION[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  LOCATION[index].value.toString(),
                                  style: TextStyle(
                                      color:
                                          checkById(LOCATION[index].unique_id)
                                              ? Colors.white
                                              : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'LUSTER',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: LUSTER.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == LUSTER[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(LUSTER[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id == LUSTER[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(LUSTER[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  LUSTER[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(LUSTER[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'PAVILIONOPEN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: PAVILIONOPEN.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == PAVILIONOPEN[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(PAVILIONOPEN[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    PAVILIONOPEN[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(PAVILIONOPEN[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  PAVILIONOPEN[index].value.toString(),
                                  style: TextStyle(
                                      color: checkById(
                                              PAVILIONOPEN[index].unique_id)
                                          ? Colors.white
                                          : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),


                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'TABLE_INCL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: TABLE_INCL.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == TABLE_INCL[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(TABLE_INCL[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    TABLE_INCL[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(TABLE_INCL[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  TABLE_INCL[index].value.toString(),
                                  style: TextStyle(
                                      color:
                                          checkById(TABLE_INCL[index].unique_id)
                                              ? Colors.white
                                              : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'TABLEOPEN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  height: 18.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: TABLEOPEN.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conext, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              var myListFiltered = _searchdata.where((e) =>
                                  e.unique_id == TABLEOPEN[index].unique_id);
                              if (myListFiltered.length == 0) {
                                searchstockfuncation(TABLEOPEN[index]);
                              } else {
                                _searchdata.removeWhere((item) =>
                                    item.unique_id ==
                                    TABLEOPEN[index].unique_id);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: checkById(TABLEOPEN[index].unique_id)
                                    ? CustomTheme.primarycolor
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ), //
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  TABLEOPEN[index].value.toString(),
                                  style: TextStyle(
                                      color:
                                          checkById(TABLEOPEN[index].unique_id)
                                              ? Colors.white
                                              : CustomTheme.primarycolor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'TABLE(%)',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'From',
                          fieldController: _tablefrom,
                          fieldInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'TO',
                          fieldController: _tableto,
                          fieldInputType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Depth (%)',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'From',
                          fieldController: _depthfrom,
                          fieldInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'TO',
                          fieldController: _depthto,
                          fieldInputType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Discount',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'From',
                          fieldController: _discountfrom,
                          fieldInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomeTextFormFeild(
                          labletext: 'TO',
                          fieldController: _discountto,
                          fieldInputType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class diamondshape {
  String? name;

  String? imagedata;
  // IconData? icon;
  diamondshape({this.name, this.imagedata});
}
