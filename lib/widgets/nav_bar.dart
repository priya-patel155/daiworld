import 'dart:convert';

import 'package:diaworld/views/deshboard/deshboard_screen.dart';
import 'package:diaworld/views/deshboard/order_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../core/constants/app_Color.dart';
import '../core/constants/app_assets.dart';
import '../models/user_data.dart';
import '../views/Authorization/edit_profile.dart';
import '../views/Authorization/sign_in.dart';
import '../views/deshboard/imagewebview.dart';
import '../views/deshboard/search_stock_new.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  SharedPreferences? sharedPreferences;

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            SizedBox(
              height: Height / 50,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: CustomTheme.primarycolor,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Deshboard()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: CustomTheme.primarycolor,
              ),
              title: Text(
                'Edit Profile',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                ImageUtils.recent,
                color: CustomTheme.primarycolor,
                height: 5.w,
              ),
              title: Text(
                'Search Stock',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchStockNew()));
              },
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                ImageUtils.history,
                color: CustomTheme.primarycolor,
                height: 5.w,
              ),
              title: Text(
                'Order History',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderHistory()));
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                ImageUtils.aboutus,
                color: CustomTheme.primarycolor,
                height: 5.w,
              ),
              title: Text(
                'About Us',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageWebView(
                            webimageurl:
                                "http://www.bhavyamdiam.com/Login/Aboutus")));
              },
            ),
            Divider(),
            ListTile(
                leading: Image.asset(
                  ImageUtils.inventory,
                  color: CustomTheme.primarycolor,
                  height: 5.w,
                ),
                title: Text(
                  'Extensive Inventory',
                  style: TextStyle(color: CustomTheme.primarycolor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageWebView(
                              webimageurl:
                              "http://www.bhavyamdiam.com/Login/ExtensiveInventory")));

                }),
            Divider(),
            ListTile(
              leading: Image.asset(
                ImageUtils.contactus,
                color: CustomTheme.primarycolor,
                height: 5.w,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageWebView(
                            webimageurl:
                            "http://www.bhavyamdiam.com/Login/ContactUs")));

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: CustomTheme.primarycolor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: CustomTheme.primarycolor),
              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
