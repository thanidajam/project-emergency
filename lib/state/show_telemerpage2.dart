import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTelemerPage2 extends StatefulWidget {
  const ShowTelemerPage2({Key? key}) : super(key: key);

  @override
  _ShowTelemerPage2State createState() => _ShowTelemerPage2State();
}

class _ShowTelemerPage2State extends State<ShowTelemerPage2> {
  List<String> textList = [
    'แจ้งเหตุด่วน-เหตุร้ายทุกชนิด',
    'แจ้งอัคคีภัย สัตว์เข้าบ้าน',
    'ศูนย์ความปลอดภัยกรมทางหลวงชนบท',
    'ศูนย์ปราบปรามการโจรกรรม',
    'กองปราบปราม',
    'อุบัติเหตุทางน้ำ กองบัญชาการตำรวจ',
    'สายด่วนกรมเจ้าท่า เหตุด่วนทางน้ำ',
  ];

  List<String> telList = [
    '191',
    '199',
    '1146',
    '1192',
    '1195',
    '1196',
    '1199',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แจ้งเหตุด่วนเหตุร้าย', style: GoogleFonts.prompt(),),
        backgroundColor: MyConstant.bg2,
      ),
      body: ListView.builder(
        itemCount: textList.length,
        itemBuilder: (context, index) => Card(
          color: Colors.deepOrange[50],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowTitle(
                        title: textList[index],
                        textStyle: MyConstant().h8Style()),
                    ShowTitle(
                        title: telList[index], textStyle: MyConstant().h8Style()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15,top: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}