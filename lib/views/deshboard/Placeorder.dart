import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../models/Place_order_.dart';
import '../../models/user_data.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_form_feilds.dart';
import 'deshboard_screen.dart';

class PlaceOrder extends StatefulWidget {
  final String? stoneref;
  const PlaceOrder({Key? key, this.stoneref}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  TextEditingController Comments = new TextEditingController();
  String? token;
  PlaceDimondOrder? _placesorder;
  Future Placedimondorder() async {
    Map<String, dynamic> formdata = {
      "StoneID": widget.stoneref,
      "Comments": Comments.text,
    };

    print(formdata);
    final response = await ApiClient().dio.post(Constant.placeorder,
        data: formdata,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    print(response.data);

    _placesorder = PlaceDimondOrder.fromJson(response.data);
    if (_placesorder!.status == "SUCCESS") {
     /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        _placesorder!.message!,
        style: TextStyle(color: Colors.white),
      )));*/

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           // title: Text("Alert Dialog"),
            content: Text(_placesorder!.message!),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return Deshboard();
                    },
                  ), (route) => false);                },
              )
            ],
          );
        },
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        _placesorder!.error!,
        style: TextStyle(color: Colors.white),
      )));
    }
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Order',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.w,
            ),
            CustomeTextFormFeild(
              fieldController: Comments,
              labletext: 'Comments',
              hint: 'Comments',
            ),
            SizedBox(
              height: 8.w,
            ),
            CustomButton(
              title: 'Place Order',
              onPressed: () {
                Placedimondorder();
              },
            ),
          ],
        ),
      ),
    );
  }
}
