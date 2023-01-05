import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../core/constants/app_Color.dart';

class Loder extends StatefulWidget {
  Color? bgColor;
  Loder({Key? key, this.bgColor}) : super(key: key);

  @override
  State<Loder> createState() => _LoderState();
}

class _LoderState extends State<Loder> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(
        opacity: 0.5,
        child: ModalBarrier(dismissible: false, color: widget.bgColor),
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              child: LoadingIndicator(
                  indicatorType: Indicator.values[25],
                  colors: [CustomTheme.primarycolor]),
            ),
          ],
        ),
      )
    ]);
  }
}
