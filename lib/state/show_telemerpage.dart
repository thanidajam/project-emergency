import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ShowTelemerpage extends StatefulWidget {
  const ShowTelemerpage({Key? key}) : super(key: key);

  @override
  _ShowTelemerpageState createState() => _ShowTelemerpageState();
}

class _ShowTelemerpageState extends State<ShowTelemerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เบอร์โทรฉุกเฉิน'),
        backgroundColor: MyConstant.bg2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => buildListview(constraints),
      ),
    );
  }

  Column buildListview(BoxConstraints constraints) {
    return Column(children: [
      Card(
        color: Colors.deepOrange[50],
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 20),
              width: constraints.maxWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowTitle(
                        title: 'สายด่วนสำหรับแจ้งเหตุด่วนเหตุร้าย',
                        textStyle: MyConstant().h8Style(),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, MyConstant.routeShowTelemerpage2),
                          icon: Icon(
                            Icons.play_circle,
                            size: 30,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Card(
            color: Colors.deepOrange[50],
              child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, left: 20),
                width: constraints.maxWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShowTitle(
                            title: 'สายด่วนแจ้งเหตุฉุกเฉิน/กู้ชีพ/กู้ภัย',
                            textStyle: MyConstant().h8Style(),
                          ),
                          IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, MyConstant.routeShowTelemerpage3),
                              icon: Icon(
                                Icons.play_circle,
                                size: 30,
                              )),
                        ])
                  ],
                ),
              )
            ],
          )),
        ],
      ),
      Column(
        children: [
          Card(
            color: Colors.deepOrange[50],
              child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, left: 20),
                width: constraints.maxWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShowTitle(
                            title: 'สายด่วนบริการทางการแพทย์',
                            textStyle: MyConstant().h8Style(),
                          ),
                          IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, MyConstant.routeShowTelemerpage4),
                              icon: Icon(
                                Icons.play_circle,
                                size: 30,
                              )),
                        ])
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    ]);
  }
}