import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowContactpage extends StatefulWidget {
  const ShowContactpage({ Key? key }) : super(key: key);

  @override
  _ShowContactpageState createState() => _ShowContactpageState();
}

class _ShowContactpageState extends State<ShowContactpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ติดต่อเรา'),
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
            child: ShowTitle(
              title: 'เว็บไซต์ : www.sd.rmutt.ac.th',
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
            child: ShowTitle(
              title: 'เบอร์ติดต่อห้องพยาบาล : 025494010',
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
            child: ShowTitle(
              title: 'สถานที่ตั้ง : อาคารสโมสรข้าราชการ ชั้น 1',
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
              child: ShowTitle(
                title: 'กองพัฒนานักศึกษาฝ่ายสุขภาพและอนามัย',
                textStyle: MyConstant().h8Style(),
              ),
            ),
          ],
        );
  }
}