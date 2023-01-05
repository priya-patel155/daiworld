import 'dart:convert';

import 'package:diaworld/views/deshboard/searchdetails_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../core/constants/app_Color.dart';
import '../../core/constants/app_assets.dart';
import '../../models/GetSearchModel.dart';
import '../../models/user_data.dart';
import '../../widgets/loder.dart';

class NewArrivale extends StatefulWidget {
  const NewArrivale({Key? key}) : super(key: key);

  @override
  State<NewArrivale> createState() => _NewArrivaleState();
}

class _NewArrivaleState extends State<NewArrivale> {
  String? token;
  List<GetSearchModel>? getserchmodel = [];
  bool isLoading = false;
  bool dataLoaded = true;
  int _selectedIndex = 0;
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

    Map<String, dynamic> formdata = {
      "NewArrival": "true",
      "FormName": "Search Stock",
      "ColorType": "Regular",
      "PageNo": "1",
      "PgSize": "500",
      "UsedFor": "View",
      "ActivityType": "Get"
    };
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: CustomTheme.primarycolor,
            title: Text(
              'New Arrival',
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
                    : Text('no data found'),
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
}
