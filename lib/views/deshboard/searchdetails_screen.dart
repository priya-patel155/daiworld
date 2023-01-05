import 'package:diaworld/core/constants/app_Color.dart';
import 'package:diaworld/core/constants/app_assets.dart';
import 'package:diaworld/views/deshboard/videiwebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import '../../models/GetSearchModel.dart';
import 'Placeorder.dart';
import 'certificatewebview.dart';
import 'imagewebview.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class SearchDetails extends StatefulWidget {
  final GetSearchModel getsearchmodel;
  SearchDetails({Key? key, required this.getsearchmodel}) : super(key: key);

  @override
  State<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Detail'),
       /* actions: [
          Icon(Icons.download_rounded),
          SizedBox(
            width: 2.w,
          )
        ],*/
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:  FadeInImage.assetNetwork(
                      placeholder: ImageUtils.diamondslogo, // Before image load
                      image: widget.getsearchmodel.Actual_image_url.toString(), // After image load
                      height: 50,
                      width: 50,
                    ),
                  ),
                  /*Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: SvgPicture.asset(
                      ImageUtils.diamondshape,
                      height: 12.w,
                    ),
                  ),*/
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.getsearchmodel.shape.toString() ?? '',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: CustomTheme.primarycolor),
                          )
                        ],
                      ),
                      Text(
                        widget.getsearchmodel.sInscription.toString() ?? '',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6.w,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffcadce6),
              ),
              child: Text(
                'Primary Details',
                style: TextStyle(
                    color: CustomTheme.primarycolor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Stock ID:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.stoneRefNo.toString() ?? '',
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Cts:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.cts!.toStringAsFixed(2) ?? '',
                              style: TextStyle(color: Colors.black,fontSize: 14),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Color:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.color.toString() ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Clarity:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.clarity.toString() ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Cut:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.cut.toString() ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Certi No:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.certiNo.toString() ?? '',
                              style: TextStyle(color: Colors.black,fontSize: 12),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Shape',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.shape.toString()+"  " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Polish',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.polish.toString()+"  " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Symm',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.symm.toString()+"  " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Fls',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.fls.toString()+"  " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffcadce6),
              ),
              child: Text(
                'Price',
                style: TextStyle(
                    color: CustomTheme.primarycolor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rap Price(\$):',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.curRapRate
                              !.toStringAsFixed(0) ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Disc(%):',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.finalDisc!.toStringAsFixed(2) ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Price/CTS(\$):',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.pricePerCts!.toStringAsFixed(2) ??
                                  '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rap Amt(\$):',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.rapAmount!.toStringAsFixed(0)+" " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              'Net Amt(\$):',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.getsearchmodel.netAmount!.toStringAsFixed(2)+" " ?? '',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Container(
              width: 90.w,
              // height: 20.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          ImageUtils.shoppingbag,
                          height: 10.w,
                          color: Color(0xff4eadfe),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceOrder(
                                    stoneref:
                                    widget.getsearchmodel.stoneRefNo,
                                  )));

                        },
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Place Order',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          ImageUtils.imagegallery,
                          height: 10.w,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageWebView(
                                      webimageurl: widget.getsearchmodel.imageUrl)));
                        },
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Images',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoWebView(
                                      videourl:
                                          widget.getsearchmodel.movieUrl)));
                        },
                        child: Image.asset(
                          ImageUtils.play,
                          height: 10.w,
                        ),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CertificateWebview(
                                        cerificateurl:
                                            widget.getsearchmodel.viewCertiUrl,
                                      )));
                        },
                        child: Image.asset(
                          ImageUtils.award,
                          height: 10.w,
                        ),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Certificate',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
          /*  Container(
              width: 80.w,
              // height: 20.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ImageUtils.addtocart,
                        height: 8.w,
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Add TO Cart',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceOrder(
                                        stoneref:
                                            widget.getsearchmodel.stoneRefNo,
                                      )));
                        },
                        child: Image.asset(
                          ImageUtils.shoppingbag,
                          height: 8.w,
                        ),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Place Order',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ImageUtils.share,
                        height: 8.w,
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
