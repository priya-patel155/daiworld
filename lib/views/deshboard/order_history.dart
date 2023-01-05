import 'dart:convert';
import 'dart:io';
import 'package:diaworld/core/constants/app_Color.dart';

import 'package:diaworld/widgets/nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../core/constants/app_assets.dart';
import '../../models/orderhistory.dart';
import '../../models/user_data.dart';
import '../../widgets/loder.dart';
import '../../widgets/text_form_feilds.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool _searchvisiblity = false;
  bool _visiblity = false;
  String? token;
  DateTime startdateOrg = DateTime.now();
  DateTime endDateOrg = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 7);
  String? start_date;
  String? end_date;
  bool isLoading = false;
  TextEditingController SerachController = TextEditingController();

  String? date;

  //Orderhistory? orderhistory;

  List<Orderhistory>? orderhistory = [];

  Future orderlist() async {
    orderhistory?.clear();
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> formdata = {
      "FromDate": start_date,
      "ToDate": end_date,
      "PageNo": "1",
      "PgSize": "1000",
      "FormName": "Order History",
      "CommonName": SerachController.text.length==0?"":SerachController.text,
      "ActivityType": "Get"
    };

    print(formdata);
    final response = await ApiClient().dio.post(Constant.orderhistory,
        data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    print(response);
     print(response.data['Status']+ 'jjj');

    if(response.data['Status']=="1") {

      setState(() {
        // print('order history: ${response.data['Data'][0]['DataList']}');

        isLoading = false;

      });

      print(response.data['Data']);

      if(response.data['Data'] == null){
        Fluttertoast.showToast(
            msg:response.data['Message'],  // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM,    // location
            timeInSecForIosWeb: 1               // duration
        );
      }

      for (int i = 0; i < response.data['Data'][0]['DataList'].length; i++) {
        orderhistory!.add(
            Orderhistory.fromJson((response.data['Data'][0]['DataList'][i])));
      }

    }else{
      setState(() {
        isLoading = false;

      });
    }
    // print('dbjscjhdscjhsdvchjsdvch${orderhistory!.length}');
    // orderhistory = Orderhistory.fromJson(response.data);
  }

  DateTime? today;

  @override
  void initState() {
    super.initState();
    // DateTime selectedFromDate = DateTime.now();
    // String date = getFormatedDate(selectedFromDate);
    // print(date.toString() + 'kk');
    // selected_date = newdate;
    // print('startdate${selected_date}');
    //
    // selected_enddate = newdate;
    // print('enddate${selected_enddate}');
    getFormatedDateInit();

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
    await orderlist();
  }

  getFormatedDateInit() {
    start_date = getFormatedDate(startdateOrg.toString());
    end_date = getFormatedDate(endDateOrg.toString());
    setState(() {});
  }

  external DateTime subtract(Duration duration);

  String? newdate;
  DateTime? todate = DateTime.now();

  getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('d-MMM-y');
    newdate = outputFormat.format(inputDate);
    return newdate;
  }

  Future Pickfromdate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    String dateparsed = getFormatedDate(date);
    print(dateparsed);
    setState(() {
      start_date = dateparsed;
    });

    print('mnxcknbsxkcjn${start_date}');
  }

  Future Pickenddate(BuildContext context) async {
    todate = await showDatePicker(
        context: context,
        initialDate: DateTime(todate!.year, todate!.month, todate!.day + 7),
        firstDate: DateTime(2000),
        lastDate: DateTime(todate!.year, todate!.month, todate!.day + 7));

    DateTime enddate = DateTime(todate!.year, todate!.month, todate!.day + 7);

    String dateparsed = getFormatedDate(todate);
    print(dateparsed);
    setState(() {
      end_date = dateparsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      // backgroundColor: Color(0xffcccccc),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Order History'),
          ],
        ),
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5.w,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${start_date.toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      await Pickfromdate(context);
                                    },
                                    child: Icon(
                                      Icons.calendar_today_sharp,
                                      color: CustomTheme.primarycolor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    end_date.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      await Pickenddate(context);
                                    },
                                    child: Icon(
                                      Icons.calendar_today_sharp,
                                      color: CustomTheme.primarycolor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextFormField(
                                    controller: SerachController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Company/user/Customer Name',
                                        hintStyle: TextStyle(
                                            color: CustomTheme.grey,
                                            fontSize: 12)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () async {
                              await orderlist();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: CustomTheme.primarycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Container(
                    child: Expanded(
                  child: orderhistory != null
                      ? ListView.builder(
                          itemCount: orderhistory!.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                          spreadRadius: 2.0,
                                        ), //
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child:  FadeInImage.assetNetwork(
                                              placeholder: ImageUtils.diamondslogo, // Before image load
                                              image: orderhistory![index].Actual_image_url.toString(), // After image load
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                         /* Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                ImageUtils.diamondshape,
                                                height: 10.w,
                                              ),
                                            ),
                                          ),*/
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child:Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      orderhistory![index]
                                                          .customerName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 1.w,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Order ID: ',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          height: 4.w,
                                                        ),
                                                        Text(
                                                          orderhistory![index]
                                                              .iOrderid
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.w,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Stock Id:',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                          orderhistory![index]
                                                              .sRefNo
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12
                                                              ,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                width: 35.w,
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child:Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Date:',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 4.w,
                                                      ),
                                                      Text(
                                                        orderhistory![index]
                                                            .orderDate
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    orderhistory![index]
                                                        .orderStatus
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: CustomTheme
                                                            .primarycolor,
                                                        fontSize: 14
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 48
                                          ),
                                          Text(
                                            'Company Name :',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                         Flexible(child:  Text(
                                           orderhistory![index]
                                               .companyName
                                               .toString(),
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight:
                                               FontWeight.w600),
                                         ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Shape :'),
                                                    Text(
                                                      orderhistory![index]
                                                          .sShape
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Cts:'),
                                                    Text(
                                                      orderhistory![index]
                                                          .dCts!
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Color:'),
                                                    Text(
                                                      orderhistory![index]
                                                          .sColor
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Clarity:'),
                                                    Text(
                                                      orderhistory![index]
                                                          .sClarity
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Cut:'),
                                                    Text(
                                                      orderhistory![index]
                                                          .sCut
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Rap\nPrice(\$):'),
                                                    Text(
                                                      orderhistory![index]
                                                          .dRepPrice!
                                                          .toStringAsFixed(0),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Disc(\$):'),
                                                    Text(
                                                      orderhistory![index]
                                                          .dDisc!
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Lab :'),
                                                      Text(
                                                        orderhistory![index]
                                                            .sLab
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Certi No:'),
                                                      Text(
                                                        orderhistory![index]
                                                            .sCertiNo
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Polish:'),
                                                      Text(
                                                        orderhistory![index]
                                                            .sPolish
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Fls:'),
                                                      Text(
                                                        orderhistory![index]
                                                            .sFls
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Symm:'),
                                                      Text(
                                                        orderhistory![index]
                                                            .sSymm
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Rap\nAmt(\$):'),
                                                      Text(
                                                        orderhistory![index]
                                                            .dRapAmount!
                                                            .toStringAsFixed(0),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Net Amt(\$):'),
                                                      Text(
                                                        orderhistory![index]
                                                            .netValue!
                                                            .toStringAsFixed(2),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                )
                              ],
                            );
                          })
                      : Center(
                          child: Text('No data found'),
                        ),
                )),
              ],
            ),
          ),
          Container(
            child: isLoading ? Loder(bgColor: CustomTheme.black) : Container(),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("Please select at least one stone"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
