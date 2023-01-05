import 'package:diaworld/core/constants/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:diaworld/widgets/nav_bar.dart';

class SearchStockResult extends StatefulWidget {
  const SearchStockResult({Key? key}) : super(key: key);

  @override
  State<SearchStockResult> createState() => _SearchStockResultState();
}

class _SearchStockResultState extends State<SearchStockResult> {
  bool _visiblity = false;
  bool _searchvisiblity = false;
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavBar(),
      // backgroundColor: Color(0xffcccccc),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: Column(
          children: [
            AppBar(
              title: Column(
                children: [
                  Visibility(
                      visible: !_searchvisiblity, child: Text('Search Result')),
                  Visibility(
                    visible: _searchvisiblity,
                    child: Container(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white30),
                            contentPadding: EdgeInsets.symmetric(vertical: 40),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchvisiblity = !_searchvisiblity;
                        });
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.refresh),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.desktop_windows_rounded),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            Container(
              color: CustomTheme.primarycolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.crop_square,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    'Showing 1 to 50 of 24402 enteries',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _visiblity = !_visiblity;
                      });
                    },
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: _visiblity,
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text(
                            'PCS',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '2402',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text('Cts', style: TextStyle(fontSize: 12)),
                          Text(
                            '226.19',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text('offer Disc', style: TextStyle(fontSize: 12)),
                          Text('-24.83%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text('Price/Cts', style: TextStyle(fontSize: 12)),
                          Text('\$40,938.7',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text('Offer Val', style: TextStyle(fontSize: 12)),
                          Text('\$9,259,95',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: CustomTheme.primarycolor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                            radius: 10,
                          ),
                        ),
                      ],
                    ),
                  ])
                ],
              ),
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('AJ12732', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RD', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('GIA', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      // Row(
                      //   children: [Icon(Icons.flag)],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('6224042682', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('2.63x3.87x2.34', style: TextStyle(fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('D', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('FL', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3EX-EX-EX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NON', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0.37', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NO BGM', style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Rap :', style: TextStyle(fontSize: 12)),
                            Text('3,900.00', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Disc :', style: TextStyle(fontSize: 12)),
                            Text(
                              '-19.26 %',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('\$/Cts:', style: TextStyle(fontSize: 12)),
                            Text('3,394.95', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              '1,256.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
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
