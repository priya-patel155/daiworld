import 'dart:convert';

import 'package:diaworld/core/constants/app_Color.dart';
import 'package:diaworld/core/constants/app_assets.dart';
import 'package:diaworld/models/dashboard_model.dart';
import 'package:diaworld/views/deshboard/search_stock.dart';
import 'package:diaworld/views/deshboard/search_stock_new.dart';
import 'package:diaworld/views/deshboard/search_stock_result(new).dart';
import 'package:diaworld/views/deshboard/search_stock_result.dart';
import 'package:diaworld/widgets/nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:diaworld/views/deshboard/search_stock_result.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../models/dash_board_count.dart';
import '../../models/search_data.dart';
import '../../models/user_data.dart';
import '../Authorization/sign_in.dart';
import 'newarrivel_screen.dart';
import 'order_history.dart';

class Deshboard extends StatefulWidget {
  const Deshboard({Key? key}) : super(key: key);

  @override
  State<Deshboard> createState() => _DeshboardState();
}

class _DeshboardState extends State<Deshboard> {
  Dashboardcount? _dashboardcount;
  List<DashBoardModel> dashboardModelList = [];
  List<searchData> _searchdata = [];
  TextEditingController _searchbyid = TextEditingController();
  String? date = "01 Oct 2000";
  String? time = "00:00 AM";

  // List<Data>
  String? token;

  Future dashboardcount() async {
    final response = await ApiClient().dio.post(Constant.dashboardcount,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    print(Constant.dashboardcount);
    print(response.data);

    setState(() {
      _dashboardcount = Dashboardcount.fromJson(response.data);

      _dashboardcount!.data!.forEach((element) {
        if (element.type == 'Stock') {
          DashBoardModel dashBoardModel =
              DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });
      _dashboardcount!.data!.forEach((element) {
        if (element.type == 'NewArrival') {
          DashBoardModel dashBoardModel =
              DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });
      _dashboardcount!.data!.forEach((element) {
        if (element.type == 'MyOrder') {
          DashBoardModel dashBoardModel =
              DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });
      /* _dashboardcount!.data!.forEach((element) {
        if (element.type == 'NewArrival') {
          DashBoardModel dashBoardModel =
              DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });
      _dashboardcount!.data!.forEach((element) {
        if (element.type == 'MyCart') {
          DashBoardModel dashBoardModel =
              DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });*/

      /*_dashboardcount!.data!.forEach((element) {
        if (element.type == 'Stock' ||
            element.type == 'MyOrder' ||
            element.type == 'NewArrival' ||
            element.type == 'MyCart') {
          DashBoardModel dashBoardModel = DashBoardModel.fromJson(element.toJson());
          dashboardModelList.add(dashBoardModel);
        }
      });*/
    });
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
    await dashboardcount();
    await getdatetime();
  }

  Future getdatetime() async {
    Map<String, dynamic> formdata = {};

    print(formdata);
    final response = await ApiClient().dio.post(Constant.GetLastLoggedin,
        // data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    print(response);
    print(response.data['Data'][0]['LoginDate'] + ' date');

    var str = response.data['Data'][0]['LoginDate'];
    var parts = str.split(' ');
    var prefix = parts[2].trim(); // prefix: "date"
    var time1 = parts.sublist(3).join(' ').trim();

    print(prefix);
    print(time1);

    setState(() {
      date = parts[0].trim() + " " + parts[1].trim() + " " + parts[2].trim();
      time = time1;
    });

    /* if (response.data['Status'] == "1") {

    }*/
  }

  int? selected;

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 2;
    SharedPreferences? sharedPreferences;
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Home'),
          // leading: Icon(Icons.menu),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  sharedPreferences?.clear();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("Are you sure want to Logout ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () async {
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  await preferences.clear();
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return SignIn();
                                    },
                                  ), (route) => false);
                                },
                                child: Text("Yes")),
                          ],
                        );
                      });
                },
                child: Icon(Icons.logout)),
            SizedBox(
              width: 2.w,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Height / 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: TextFormField(
                    controller: _searchbyid,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      print("Go button is clicked");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchstockNew(
                                  searchlist: _searchdata,
                                  tablefrom: "",
                                  tableto: "",
                                  depthfrom: "",
                                  depthto: "",
                                  discountfrom: "",
                                  discountto: "",
                                  priceusdfrom: "",
                                  priceusdto: "",
                                  totalamtfrom: "",
                                  totalamtto: "",
                                  newarrival: "",
                                  keyfinal: "",
                                  SmartSearch: _searchbyid.text)));
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Stone Id and Certificate No',
                        hintStyle: TextStyle(color: CustomTheme.grey)),
                  ),
                ),
                SizedBox(
                  height: Height / 50,
                ),
                Container(
                  height: Height / 2.5,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: _dashboardcount != null &&
                              _dashboardcount!.data != null
                          ? dashboardModelList.length
                          : 0,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              childAspectRatio: (itemWidth / itemHeight),
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });

                            if (selected == 0)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchStockNew()));
                            if (selected == 1)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewArrivale()));
                          },
                          child: Container(
                            // height: 100,`
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ), //
                                ],
                                image: DecorationImage(
                                  image: AssetImage(
                                    ImageUtils.backgroundimage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: CustomTheme.whiteColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Height / 60,
                                ),
                                Text(
                                  '${dashboardModelList[index].type ?? ''}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: CustomTheme.primarycolor,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: Height / 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${dashboardModelList[index].sCnt ?? ''}',
                                      style: TextStyle(
                                          color: CustomTheme.primarycolor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    // SvgPicture.asset(
                                    //   _homelist[index].imagedata.toString(),
                                    //   color: CustomTheme.primarycolor,
                                    //   height: 6.w,
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Center(
                  child: Text(
                    'Specialist in I1, I2',
                    style: TextStyle(
                        color: CustomTheme.primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                // SizedBox(
                //   height: Height / 100,
                // ),
                SizedBox(
                  height: Height / 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageUtils.diamondslogo,
                      height: Height / 5,
                    ),
                    Column(
                      children: [
                        Text(
                          '|| Last Login ||',
                          style: TextStyle(
                              color: CustomTheme.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: Height / 80,
                        ),
                        Text(
                          date.toString(),
                          style: TextStyle(
                              color: CustomTheme.primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: Height / 95,
                        ),
                        Text(
                          time.toString(),
                          style: TextStyle(
                              color: CustomTheme.primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class homemodel {
  String? name;
  String? stock;
  String? imagedata;

  // IconData? icon;
  homemodel({this.name, this.imagedata, this.stock});
}
