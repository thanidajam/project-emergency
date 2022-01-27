import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShownotiEmergency extends StatefulWidget {
  final EmergencyModel? emergencyModel;
  ShownotiEmergency({Key? key, this.emergencyModel}) : super(key: key);

  @override
  State<ShownotiEmergency> createState() => _ShownotiEmergencyState();
}

class _ShownotiEmergencyState extends State<ShownotiEmergency> {
  EmergencyModel? emergencyModel;
  UserModel? userModel;
  List<String> pathPic = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyModel = widget.emergencyModel;
    convertStringToArray();
  }

  Future<Null> processEditToMySQL(
    String? rec_emer,
    String? status,
  ) async {
    String apiEditData =
        '${MyConstant.domain}/emer_projectnew/api/editEmergency.php?isAdd=true&eid=${emergencyModel!.EID}&status=$status&rec_emer=$rec_emer';
    await Dio().get(apiEditData).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      }
    });
  }

  void convertStringToArray() {
    String string = emergencyModel!.Pic;
    //string = string.substring(1, string.length -1);
    List<String> strings = string.split(',');
    for (var item in strings) {
      pathPic.add(item.trim());
    }
    print('## pathImage ==> $pathPic');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลการแจ้งเหตุ'),
        backgroundColor: MyConstant.bg2,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(constraints),
                buildText(),
                buildText1(),
                buildText2(),
                buildText3(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(),
                      buildButton1(),
                    ],
                  ),
                ),
                buildButton2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildButton2() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: MyConstant().myButtonStyle4(),
          child: Text(
            'แจ้งเหตุเท็จ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Container buildButton1() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: MyConstant().myButtonStyle3(),
        child: Text(
          'ยืนยันการแจ้งเหตุ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Container buildButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: MyConstant().myButtonStyle1(),
        child: Text(
          'โทรด่วน',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Container buildText3() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: 'ผู้แจ้ง : ' '${emergencyModel!.Send_emer}',
            textStyle: MyConstant().h8Style()),
      ),
    );
  }

  Container buildText2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: 'ตำแหน่ง : ' '${emergencyModel!.Location}',
            textStyle: MyConstant().h8Style()),
      ),
    );
  }

  Container buildText1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: 'วันเวลาที่แจ้ง : ' '${emergencyModel!.E_date}',
            textStyle: MyConstant().h8Style()),
      ),
    );
  }

  Container buildText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: 'รับแจ้ง : ' '${emergencyModel!.E_name}',
            textStyle: MyConstant().h8Style()),
      ),
    );
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: constraints.maxWidth * 0.4,
            padding: EdgeInsets.only(top: 20),
            child: CachedNetworkImage(
              imageUrl: '${MyConstant.domain}${emergencyModel!.Pic}',
              placeholder: (context, url) => ShowProgress(),
            ),
          ),
        ],
      ),
    );
  }
}
