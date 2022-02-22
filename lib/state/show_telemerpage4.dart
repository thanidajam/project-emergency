import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTelemerPage4 extends StatefulWidget {
  const ShowTelemerPage4({ Key? key }) : super(key: key);

  @override
  _ShowTelemerPage4State createState() => _ShowTelemerPage4State();
}

class _ShowTelemerPage4State extends State<ShowTelemerPage4> {
    List<String> textList = [
    'สายด่วนยาเสพติด กรมการแพทย์',
    'สำนักงานหลักประกันสุขภาพแห่งชาติ',
    'ศูนย์พิษวิทยา โรงพยาบาลรามาธิบดี',
    'สำนักงานคณะกรรมการอาหารและยา',
    'สำนักงานอาสากาชาด สภากาชาดไทย',
    'ศูนย์รับบริจาคอวัยวะสภากาชาดไทย',
    'สายด่วนกรมสุขภาพจิต',
  ];

  List<String> telList = [
    '1165',
    '1367',
    '1367',
    '1556',
    '022510385',
    '1666',
    '1667',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บริการทางการแพทย์', style: GoogleFonts.prompt(),),
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
