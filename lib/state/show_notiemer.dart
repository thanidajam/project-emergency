import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/main.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ShownotiEmergency extends StatefulWidget {
  final EmergencyModel? emergencyModel;
  final UserModel? userModel;
  ShownotiEmergency({Key? key, this.emergencyModel, this.userModel})
      : super(key: key);

  @override
  State<ShownotiEmergency> createState() => _ShownotiEmergencyState();
}

class _ShownotiEmergencyState extends State<ShownotiEmergency>
    with SingleTickerProviderStateMixin {
  EmergencyModel? emergencyModel;
  UserModel? userModel;
  String? rec_emer;
  String? status;
  List<String> pathPic = [];
  DateTime? date;

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyModel = widget.emergencyModel;
    date = DateTime.parse(widget.emergencyModel!.E_date);
    userModel = widget.userModel;
    convertStringToArray();
    processEditToMySQL(rec_emer: rec_emer, status: status);
    controller = AnimationController(
      vsync: this,
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, MyConstant.routeDriverServer);
        controller.reset();
      }
    });
  }

  @override
  void dispone() {
    controller.dispose();
    super.dispose();
  }

  Future<Null> processEditToMySQL({
    String? rec_emer,
    String? status,
  }) async {
    String? code;
    String path =
        '${MyConstant.domain}/emer_projectnew/api/getEmerWhereCode.php?isAdd=true&code=$code';
    await Dio().get(path).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String rec_emer = preferences.getString('Name')!;
      String type = preferences.getString('type')!;
      print('rec_emer ==> $rec_emer');
      if (value.toString() == 'null') {
        if (status == '${status}') {
          String apiEditData =
              '${MyConstant.domain}/emer_projectnew/api/editEmergency.php?isAdd=true&eid=${emergencyModel!.EID}&status=$status&rec_emer=$rec_emer';
          await Dio().get(apiEditData).then((value) async {
            if (value.toString() == 'true') {
              notificationToStd(code);
              normalDialog1(context);
            } else {
              print('อัพเดตไม่สำเร็จ');
            }
          });
        }
      }
    });
  }

  Future<Null> normalDialog1(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/images/done.json',
              width: 120,
              height: 120,
              repeat: false,
              controller: controller,
              onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'ยืนยันการแจ้งเหตุฉุกเฉิน\nเรียบร้อยแล้ว',
                style: GoogleFonts.prompt(fontSize: 18),
                textAlign: TextAlign.center,
              )),
              subtitle: Center(
                  child: Text(
                '',
                style: GoogleFonts.prompt(fontSize: 18),
              )),
            ),
          ],
        ),
      ),
    );
  }

  void convertStringToArray() {
    String string = emergencyModel!.Pic;
    //string = string.substring(1, string.length -1);
    List<String> strings = string.split(',');
    for (var item in strings) {
      pathPic.add(item.trim());
    }
    // print('## pathImage ==> $pathPic');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้อมูลการแจ้งเหตุ',
          style: GoogleFonts.prompt(),
        ),
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
                  buildText5(),
                  buildText2(),
                  buildText3(),
                  buildText4(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton2(),
                        buildButton1(),
                        buildButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildButton2() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        onPressed: () {
          String? phone = emergencyModel!.Phone;
          launch('tel: ${phone}');
        },
        style: MyConstant().myButtonStyle8(),
        child: Text(
          '       โทรด่วน      ',
          style: GoogleFonts.prompt(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Container buildButton1() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            status = 'T';
            rec_emer = '$rec_emer';
          });
          processEditToMySQL(rec_emer: rec_emer, status: status);
        },
        style: MyConstant().myButtonStyle6(),
        child: Text(
          'ยืนยันการแจ้งเหตุ',
          style: GoogleFonts.prompt(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Container buildButton() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            status = 'F';
            rec_emer = '$rec_emer';
          });
          processEditToMySQL(rec_emer: rec_emer, status: status);
        },
        style: MyConstant().myButtonStyle1(),
        child: Text(
          '    แจ้งเหตุเท็จ    ',
          style: GoogleFonts.prompt(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
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
        child: Row(
          children: [
            Text(
              'เบอร์โทร :  ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowTitle(
                title: '${emergencyModel!.Phone}',
                textStyle: MyConstant().h8Style()),
          ],
        ),
      ),
    );
  }

  Container buildText3() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Text(
              'ผู้แจ้งเหตุ :  ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowTitle(
                title: '${emergencyModel!.Send_emer}',
                textStyle: MyConstant().h8Style()),
          ],
        ),
      ),
    );
  }

  Container buildText2() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(children: [
            Text(
              'ตำแหน่ง : ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowTitle(
                title: '${emergencyModel!.Location}' == 'null'
                    ? ' - '
                    : '${emergencyModel!.Location}',
                textStyle: MyConstant().h8Style()),
          ]),
        ));
  }

  Container buildText5() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Text(
              'เวลาที่แจ้งเหตุ :  ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowTitle(
                title:
                    '${date!.hour.toString().padLeft(2, '0')} : ${date!.minute.toString().padLeft(2, '0')} น.',
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
        child: Row(
          children: [
            Text(
              'วันที่แจ้งเหตุ :  ',
              style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowTitle(
                title:
                    '${date!.day} ${allMonth[date!.month - 1]} ${date!.year + 543}',
                textStyle: MyConstant().h8Style()),
          ],
        ),
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
              style: GoogleFonts.prompt(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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

  Widget buildImage(BoxConstraints constraints) {
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

  Future<Null> notificationToStd(type) async {
    String urlFindToken =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereType.php?isAdd=true&type=$type';
    await Dio().get(urlFindToken).then((value) {
      var result = json.decode(value.data);
      print('result ==> ${result.toString()}');
      for (var json in result) {
        UserModel model = UserModel.fromMap(json);
        var tokenStd = model.Token;
        print('tokenStd ===> $tokenStd');

        String title = 'ข้อความแจ้งเตือนใหม่';
        String body = 'ยืนยันการแจ้งเหตุแล้ว';

        String urlSendToken =
            '${MyConstant.domain}/emer_projectnew/api/apiNotification.php?isAdd=true&token=$tokenStd&title=$title&body=$body';

        sendNotificationToDriver(urlSendToken);
      }
    });
  }

  Future<Null> sendNotificationToDriver(String urlSendToken) async {
    await Dio().get(urlSendToken).then((value) {});
  }
}
