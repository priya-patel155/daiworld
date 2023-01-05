import 'package:diaworld/views/Authorization/sign_in.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../api/api_client.dart';
import '../../api/api_constant.dart';
import '../../models/forfotpass_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_form_feilds.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController _name = new TextEditingController();
  bool isLoading = false;
  Forgotpass? _forgotpass;
  Future forgotpassword() async {
    setState(() {
      isLoading = true;
    });
    try {
      Map<String, dynamic> formdata = {
        "UserName": _name.text,
      };
      print(formdata);

      final response = await ApiClient().dio.post(
            Constant.forgotpass,
            data: formdata,
          );

      _forgotpass = Forgotpass.fromJson(response.data);
      ;
      if (_forgotpass!.status == '1') {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_forgotpass!.message!)));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('error')));
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.w,
            ),
            CustomeTextFormFeild(
              labletext: 'Email/UserName',
              fieldController: _name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Requird";
                }
              },
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomButton(
              title: 'Forgot Password',
              onPressed: () async {
                await forgotpassword();
              },
            )
          ],
        ),
      ),
    );
  }
}
