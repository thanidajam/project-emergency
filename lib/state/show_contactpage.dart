import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowContactpage extends StatefulWidget {
  const ShowContactpage({Key? key}) : super(key: key);

  @override
  _ShowContactpageState createState() => _ShowContactpageState();
}

class _ShowContactpageState extends State<ShowContactpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ติดต่อเรา',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: MyConstant.bg2,
      ),
      body: Column(
        children: [
          buildContact(),
          buildContact1(),
          buildContact2(),
          buildContact3(),
        ],
      ),
    );
  }

  Row buildContact3() {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 3, left: 20),
            child: Text(
              'เว็บไซต์ : ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShowTitle(
            title: 'www.sd.rmutt.ac.th',
            textStyle: MyConstant().h8Style(),
          ),
        ),
      ],
    );
  }

  Row buildContact2() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 20),
          child: Text(
            'เบอร์ติดต่อห้องพยาบาล : ',
            style: GoogleFonts.prompt(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShowTitle(
            title: '025494010',
            textStyle: MyConstant().h8Style(),
          ),
        ),
      ],
    );
  }

  Row buildContact1() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 20),
          child: Text(
            'สถานที่ : ',
            style: GoogleFonts.prompt(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShowTitle(
            title: 'อาคารสโมสรข้าราชการ ชั้น 1',
            textStyle: MyConstant().h8Style(),
          ),
        ),
      ],
    );
  }

  Row buildContact() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/doctor.png',
                width: 250,
                height: 250,
              ),
              ShowTitle(
                title: 'กองพัฒนานักศึกษาฝ่ายสุขภาพและอนามัย',
                textStyle: MyConstant().h10Style(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
