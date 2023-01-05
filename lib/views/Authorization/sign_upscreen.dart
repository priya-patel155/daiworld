import 'package:diaworld/core/constants/app_Color.dart';
import 'package:diaworld/views/Authorization/sign_in.dart';
import 'package:diaworld/widgets/custom_button.dart';
import 'package:diaworld/widgets/text_form_feilds.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../core/constants/app_assets.dart';
import '../../models/sign_up.dart';
import '../../widgets/loder.dart';
import '../../widgets/regular_expression.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _MobileNo = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController cmpname = TextEditingController();
  final TextEditingController isd = TextEditingController();
  Signup? signup;
  bool isLoading = false;
  Future register() async {
    setState(() {
      isLoading = true;
    });
    try {
      if (_formKey.currentState?.validate() ?? false) {
        Map<String, dynamic> formdata = ({
          "UserName": _username.text,
          "Password": _password.text,
          "FirstName": _firstName.text,
          "LastName": _lastName.text,
          "CompanyName": cmpname.text,
          "CompMobile": "+${isd.text}${_MobileNo.text}",
          "CompEmail": _Email.text,
        });
        print(formdata);
        final response =
            await ApiClient().dio.post(Constant.registration, data: formdata);
        signup = Signup.fromJson(response.data);

        print(response.data);
        if (signup!.status == 1) {
          setState(() {
            isLoading = false;
          });

          showAlertDialog(context);
        } else {
          setState(() {
            isLoading = false;
          });
          showAlertDialog(context);
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
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
    return Stack(
      children: [
        Scaffold(
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
                      'Registration',
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomeTextFormFeild(
                                  labletext: 'First Name',
                                  maxLength: 20,

                                  fieldController: _firstName,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter First Name";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: CustomeTextFormFeild(
                                  labletext: 'Last Name',
                                  maxLength: 30,
                                  fieldController: _lastName,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter Last Name";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomeTextFormFeild(
                            labletext: 'User Name',
                            maxLength: 20,
                            fieldController: _username,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter User Name";
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomeTextFormFeild(
                            labletext: 'Password',
                            maxLength: 20,
                            fieldController: _password,
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
                            height: 5.w,
                          ),
                          CustomeTextFormFeild(
                            labletext: 'Company Name',
                            fieldController: cmpname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Company Name";
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomeTextFormFeild(
                                  labletext: 'ISD',
                                  fieldController: isd,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter ISD";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomeTextFormFeild(
                                    labletext: 'Mobile No/WhatsApp No',
                                    maxLength: 15,
                                    fieldController: _MobileNo,
                                    fieldInputType: TextInputType.number,
                                    validator: mobileValidator),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomeTextFormFeild(
                              labletext: 'Email Address',
                              fieldController: _Email,
                              validator: emailValidator),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: 'Reset',
                          onPressed: () {
                            _username.clear();
                            _password.clear();
                            _firstName.clear();
                            _lastName.clear();
                            cmpname.clear();
                            _MobileNo.clear();
                            _Email.clear();
                             isd.clear();

                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          title: 'Submit',
                          onPressed: () async {
                            await register();
                            // showAlertDialog(context);
                            // _username.clear();
                            // _password.clear();
                            // _firstName.clear();
                            // _lastName.clear();
                            // cmpname.clear();
                            // _MobileNo.clear();
                            // _Email.clear();
                            // isd.clear();
                          },
                        ),
                      ),
                    ],
                  )
                ],
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
        print('hello popup');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return SignIn();
          },
        ), (route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(""),
      content: Html(data:signup!.message),
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

  String? mobileValidator(value) {
    if (value.length == 0) {
      return "Please enter your mobile number!";
    } else if (value.length < 10) {
      return "Please enter a valid mobile number!";
    } else if (value.length > 10) {
      return "Please enter a valid mobile number!";
    }
  }

  String? emailValidator(value) {
    if (value.length == 0) {
      return "Please enter your email address !";
    } else if (!Regex.email_expression.hasMatch(value)) {
      return "Please enter your email address !";
    }
  }
}
