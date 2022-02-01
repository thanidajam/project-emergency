import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/main.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDataEmer extends StatefulWidget {
  final EmergencyModel? emergencyModel;
  ShowDataEmer({Key? key, this.emergencyModel}) : super(key: key);

  @override
  State<ShowDataEmer> createState() => _ShowDataEmerState();
}

class _ShowDataEmerState extends State<ShowDataEmer> {
  EmergencyModel? emergencyModel;
  UserModel? userModel;
  String? rec_emer;
  String? status;
  List<String> pathPic = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyModel = widget.emergencyModel;
    convertStringToArray();
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImage(constraints),
                  buildText(),
                  buildText1(),
                  buildText2(),
                  buildText3(),
                  buildText4(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildText4() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: 'เบอร์โทร : ' '${emergencyModel!.Phone}',
            textStyle: MyConstant().h8Style()),
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
        child: Row(
          children: [
            Text(
              'ตำแหน่ง :',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            ShowTitle(
                title: '${emergencyModel!.Location}' == 'null'
                    ? 'ไม่ระบุตำแหน่งที่ตั้ง'
                    : '${emergencyModel!.Location}',
                textStyle: MyConstant().h8Style()),
          ],
        ),
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
        child: Row(
          children: [
            Text(
              'รับแจ้ง : ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            ShowTitle(
                title: '${emergencyModel!.E_name} ' == ' '
                    ? 'แจ้งเหตุฉุกเฉิน'
                    : '${emergencyModel!.E_name}',
                textStyle: MyConstant().h8Style()),
          ],
        ),
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
              errorWidget: (context, url, error) => Text(''),
              placeholder: (context, url) => ShowProgress(),
            ),
          ),
        ],
      ),
    );
  }
}
