import 'dart:convert';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:diaworld/core/constants/app_Color.dart';
import 'package:diaworld/core/constants/app_assets.dart';
import 'package:diaworld/core/constants/app_font_style.dart';
import 'package:diaworld/views/Authorization/sign_upscreen.dart';
import 'package:diaworld/views/deshboard/deshboard_screen.dart';
import 'package:diaworld/widgets/custom_button.dart';
import 'package:diaworld/widgets/custome_text_form_field.dart';
import 'package:diaworld/widgets/text_form_feilds.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../models/user_data.dart';
import '../../widgets/loder.dart';
import 'forgot_password_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  bool isLoading = false;
  UserData? _userData;
  String? ipaddres="98.207.254.136";


  void getip() async {
    final ipv4 = await Ipify.ipv4();
   // print(ipv4); // 98.207.254.136
    ipaddres =ipv4;

    print(ipaddres);
    /*final ipv6 = await Ipify.ipv64();
    print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e

    final ipv4json = await Ipify.ipv64(format: Format.JSON);
    print(ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}
*/
    // The response type can be text, json or jsonp
  }

  @override
  void initState() {
    super.initState();

    getip();

  }



  Future Login() async {

    setState(() {
      isLoading = true;
    });
    try {
      if (_formKey.currentState?.validate() ?? false) {
        Map<String, dynamic> formdata = {
          "UserName": _name.text,
          "Password": _pwd.text.toString(),
          "grant_type": 'password',
          "DeviseType": 'android',
          "IpAddress": ipaddres,
        };
        print(formdata);

        final response = await ApiClient().dio.post(Constant.login,
            data: formdata,
            options: Options(contentType: "application/x-www-form-urlencoded"));

        print('shared data ${response}');
        print('shared data ${response.data}');

        _userData = UserData.fromJson(response.data);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


        String data = jsonEncode(_userData);
        sharedPreferences.setString("register", data);
        print('shared data ${data}');
        print(_userData!.toJson());
        if (_userData!.status == '1') {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(_userData!.message!)));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Deshboard()));
        } else if (_userData!.error == 'invalid_grant') {
          showAlertDialog(context);
        } else {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error')));
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.response!.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Name or Password is Wrong, Kindly Contact Administrator")));
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.response!.data['error_description'])));

        // print(e.response!.data['error']);
      }
      return UnAuthorizeError(e.response!.data['error']);
    }
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomRight,
              //     colors: [
              //       CustomTheme.gradient5,
              //       CustomTheme.gradient4,
              //       CustomTheme.gradient3,
              //       CustomTheme.gradient2,
              //       CustomTheme.gradient5
              //     ]),
              image: DecorationImage(
            image: AssetImage(ImageUtils.downloadbackgroung),
            fit: BoxFit.fill,
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                ImageUtils.diamondslogo,
                                height: 40.w,
                              ),
                            ),
                            Center(
                                child: Text(
                              'Bhavyam Diam',
                              style:
                                  FontTextStyle.GorditaW7S12darkBlack.copyWith(
                                      color: CustomTheme.primarycolor,),
                            )),
                            SizedBox(
                              height: Height / 50,
                            ),
                            CustomeTextFormFeild(
                              labletext: 'UserName',
                              fieldController: _name,
                              prefixIcon: Icon(Icons.account_circle_rounded),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter user name";
                                }
                              },
                            ),
                            SizedBox(
                              height: Height / 50,
                            ),
                            CustomeTextFormFeild(
                              labletext: 'Password',
                              fieldController: _pwd,
                              obscureText: _obscureText,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _toggle();
                                },
                                child: Icon(
                                  Icons.visibility,
                                  color: CustomTheme.grey,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                              },
                            ),
                            SizedBox(
                              height: Height / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Forgotpassword()));
                                  },
                                  child: Container(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: CustomTheme.primarycolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Height / 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title: 'Sign In',
                                    onPressed: () async {
                                      // await Login();
                                      getip();
                                      await Login();
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Deshboard()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    title: 'Sign Up',
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUPScreen()));
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: isLoading ? Loder(bgColor: CustomTheme.black) : Container(),
        ),
      ],
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
      title: Text(""),
      content: Text(_userData!.error_description!),
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

class UnAuthorizeError implements Exception {
  final _message;

  UnAuthorizeError([
    this._message,
  ]);

  String toString() {
    return "$_message";
  }
}
