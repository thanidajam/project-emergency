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
      body: Column(
        children: [
          Card (child: buildList1()),
          Card (child: buildList2()),
          Card (child: buildList3()),
        ],
      ),
    );
  }

  Row buildList1() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'สายด่วนสำหรับแจ้งเหตุด่วนเหตุร้าย',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color(0xff212121)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 36),
          child: IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, MyConstant.routeShowTelemerpage2),
              icon: Icon(
              Icons.play_circle,
              size: 34,
            )),
        )
      ],
    );
  }

   Row buildList2() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'สายด่วนแจ้งเหตุฉุกเฉิน/กู้ชีพ/กู้ภัย',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color(0xff212121)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 42),
          child: IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, MyConstant.routeShowTelemerpage3),
              icon: Icon(
                Icons.play_circle,
                size: 34,
              )),
        )
      ],
    );
  }

   Row buildList3() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'สายด่วนบริการทางการแพทย์',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color(0xff212121)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85),
          child: IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, MyConstant.routeShowTelemerpage4),
              icon: Icon(
                Icons.play_circle,
                size: 34,
              )),
        )
      ],
    );
  }

}