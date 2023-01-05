import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../core/constants/app_Color.dart';
import '../../core/constants/app_assets.dart';
import '../../models/get_profile.dart';
import '../../models/updateprofile.dart';
import '../../models/user_data.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_form_feilds.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _MobileNo = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController cmpname = TextEditingController();
  UserData? _userData;
  // List<Getprofile>? _getprofile = [];
  Getprofile? _getprofile;
  String? id;
  String? token;
  String? PrevIsActive;
  String? IsActive;
  String? Suspended;

  getdata() async {
    SharedPreferences Shared = await SharedPreferences.getInstance();
    Map<String, dynamic> data = jsonDecode(Shared.getString('register')!);
    var user = UserData.fromJson(data);
    print("my store data  :- ${user}");
    setState(() {
      id = user.userID;
      token = user.accessToken;
    });

    print('osscksdbcnkdncknx${id}');
    await getprofile();
  }

  Future getprofile() async {
    try {
      Map<String, dynamic> formdata = ({"UserID": id});

      final response = await ApiClient().dio.post(Constant.getprofile,
          data: formdata,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));

      setState(() {
        _getprofile = Getprofile.fromJson(response.data);
      });

      if (_getprofile != null && _getprofile?.data?.length != null) {
        print("if");
        for (int i = 0; i < _getprofile!.data!.length; i++) {
          print("for");
          setState(() {
            id = _getprofile!.data![i].iUserid.toString();
            _firstName.text = _getprofile!.data![i].sFirstName.toString();
            _lastName.text = _getprofile!.data![i].sLastName.toString();
            _username.text = _getprofile!.data![i].sUsername.toString();
            _MobileNo.text = _getprofile!.data![i].sCompMobile.toString();
            _Email.text = _getprofile!.data![i].sCompEmail.toString();
            cmpname.text = _getprofile!.data![i].sCompName.toString();
            PrevIsActive = _getprofile!.data![i].bIsActive.toString();
            Suspended = _getprofile!.data![i].suspended.toString();
          });
          print("firstname:--- ${_getprofile!.data![i].sFirstName.toString()}");
          print("firstname:--- ${_firstName.text}");
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('data not found')));
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future updateprofiledata() async {
    // String fileName = image1!.path.split('/').last;
    // print("Image path =>${image1!.path}");
    try {
      Map<String, dynamic> formdata = ({
        "UserID": id,
        "FirstName": _firstName.text,
        "LastName": _lastName.text,
        "CompanyName": cmpname.text,
        "CompEmail": _Email.text,
        "CompMobile": _MobileNo.text,
        "PrevIsActive": PrevIsActive,
        "IsActive": true,
        "Suspended": Suspended
      });

      final response = await ApiClient().dio.post(Constant.updateprofile,
          data: formdata,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));

      updateProfile usermodel = updateProfile.fromJson(response.data);
      print(response.data);

      String data = jsonEncode(usermodel);
      print('data${data}');

      if (usermodel.status == "1") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(usermodel.message.toString())));
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          color: CustomTheme.primarycolor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Image.asset(
                  ImageUtils.diamondslogo,
                  height: 20.w,
                  color: Colors.white,
                ),
                Spacer(),
                Text(
                  'Bhavyam Diam',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomeTextFormFeild(
                              labletext: 'First Name',
                              fieldController: _firstName,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: CustomeTextFormFeild(
                              labletext: 'Last Name',
                              fieldController: _lastName,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      CustomeTextFormFeild(
                        labletext: 'User Name',
                        fieldController: _username,
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      CustomeTextFormFeild(
                        labletext: 'Company Name',
                        fieldController: cmpname,
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      CustomeTextFormFeild(
                        labletext: 'Mobile No/WhatsApp No',
                        fieldController: _MobileNo,
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      CustomeTextFormFeild(
                        labletext: 'Email Address',
                        fieldController: _Email,
                      ),
                    ],
                  )),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                title: 'Edit',
                onPressed: () async {
                  await updateprofiledata();

                  /*_firstName.clear();
                  _lastName.clear();
                  cmpname.clear();
                  _Email.clear();
                  _MobileNo.clear();
                  _username.clear();*/
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
