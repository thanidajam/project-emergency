import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowTelemerPage3 extends StatefulWidget {
  const ShowTelemerPage3({Key? key}) : super(key: key);

  @override
  _ShowTelemerPage3State createState() => _ShowTelemerPage3State();
}

class _ShowTelemerPage3State extends State<ShowTelemerPage3> {
  List<String> textList = [
    'ศูนย์ประชาบดี แจ้งคนหาย',
    'ศูนย์ปลอดภัยคมนาคม',
    'หน่วยแพทย์กู้ชีวิต วชิรพยาบาล',
    'ศูนย์ร้องทุกข์กรุงเทพมหานคร',
    'ศูนย์เอราวัณ สำนักการแพทย์กรุงเทพฯ',
    'สถาบันการแพทย์ฉุกเฉินแห่งชาติ',
    'ศูนย์เตือนภัยพิบัติแห่งชาติ',
  ];

  List<String> telList = [
    '1300',
    '1356',
    '1554',
    '1555',
    '1646',
    '1669',
    '192',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แจ้งเหตุด่วนเหตุฉุกเฉิน',
          style: GoogleFonts.prompt(),
        ),
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
                        title: telList[index],
                        textStyle: MyConstant().h8Style()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: IconButton(
                    onPressed: () {
                      List<String> phone = telList;
                      launch('tel: ${phone[index]}');
                    },
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
