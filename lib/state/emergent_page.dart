import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Emergent extends StatefulWidget {
  const Emergent({Key? key}) : super(key: key);

  @override
  _EmergentState createState() => _EmergentState();
}

class _EmergentState extends State<Emergent>
    with SingleTickerProviderStateMixin {
  String? typeEmer;
  String picEmergency = '';
  File? file;
  double? lat, lng;
  UserModel? userModel;
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController e_nameController = TextEditingController();
  TextEditingController e_dateController = TextEditingController();

  late AnimationController controller;

  String? valueChoose;
  List listItem = [
    "ตึกสำนักงานอธิการบดี",
    "หอประชุมมทร.ธัญบุรี",
    "โรงอาหารกลาง",
    "ตึกคณะวิศวกรรมศาสตร์",
    "ตึกคณะศิลปกรรมศาสตร์",
    "ตึกคณะพยาบาลศาสตร์",
    "กองอำนวยการ",
    "ตึกคณะครุศาตร์อุตสาหกรรม",
    "คณะบริหารธุรกิจ",
    "ตึกคณะเทคโนโลยีคหกรรมศาสตร์",
    "คณะศิลปศาสตร์",
    "ตึกคณะสถาปัตยกรรมศาสตร์",
    "ตึกภาควิชานาฎดุริยางคศิลป์",
    "ตึกคณะวิทยาศาตร์และเทคโนโลยี",
    "ตึกคณะเทคโนโลยีสื่อสารมวลชน",
    "อาคารเรียนรวม 13 ชั้น",
    "อาคารหอพักนักศึกษา",
    "อาคารหอพักอาจารย์",
    "สระว่ายน้ำ",
  ];

  @override
  void initState() {
    super.initState();
    checkPermission();
    controller = AnimationController(
      vsync: this,
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, MyConstant.routeStdServer);
        controller.reset();
      }
    });
  }

  @override
  void dispone() {
    controller.dispose();
    super.dispose();
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          //Find Latlng
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          //Find LatLng
          findLatLng();
        }
      }
    } else {
      print('Service Location Close');
      MyDialog().alertLocationService(
          context, 'ไม่มีการเข้าถึงตำแหน่ง', 'กรุณาเปิดตำแหน่งที่ตั้งของคุณ');
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLng ==> work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat = $lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: size * 0.8,
            child: TextFormField(
              style: GoogleFonts.prompt(),
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกเบอร์โทรศัพท์';
                } else {}
              },
              decoration: InputDecoration(
                  hintText: 'กรอกเบอร์โทรศัพท์',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            )),
      ],
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: size * 0.8,
            child: TextFormField(
              style: GoogleFonts.prompt(),
              controller: e_nameController,
              decoration: InputDecoration(
                  hintText: 'กรอกข้อมูลอุบัติเหตุเพิ่มเติม',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            )),
      ],
    );
  }

  Padding buildLocation(double size) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: DropdownButton(
            hint: Text("เลือกตำแหน่งที่เกิดเหตุ"),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            underline: SizedBox(),
            style: GoogleFonts.prompt(
              color: Colors.black,
              fontSize: 16,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue as String?;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(
                  valueItem,
                  style: GoogleFonts.prompt(),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แจ้งเหตุฉุกเฉิน',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: MyConstant.bg2,
      ),
      body: Form(
        key: formKey,
        child: ListView(padding: EdgeInsets.all(16), children: [
          buildMap(),
          buildTitle('ตำแหน่ง'),
          buildLocation(size),
          buildTitle('ประเภทอุบัติเหตุ'),
          buildRadioType1(),
          buildRadioType2(),
          buildRadioType3(),
          buildTitle('ชื่ออุบัติเหตุ'),
          buildName(size),
          buildTitle2('เบอร์โทรศัพท์  *'),
          buildPhone(size),
          buildTitle('ถ่ายรูป'),
          buildAvatar(size),
          buildButton(size),
        ]),
      ),
    );
  }

  Set<Marker> setMarker() => <Marker>{
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'คุณอยู่ที่นี่', snippet: 'Lat = $lat, Lng = $lng'),
        ),
      };

  Widget buildMap() => Container(
        width: double.infinity,
        height: 200,
        child: lat == null
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16,
                ),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ),
      );

  Row buildButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          width: size * 0.5,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle1(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (typeEmer == null) print('Insert to Database');
                uploadImageAndInsertData();
              }
            },
            child: Text(
              'เรียกรถพยาบาล',
              style: GoogleFonts.prompt(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> uploadImageAndInsertData() async {
    String e_name = e_nameController.text;
    String phone = phoneController.text;
    String e_date = e_dateController.text;

    print('## name = $e_name , phone = $phone');

    String path =
        '${MyConstant.domain}/emer_projectnew/api/getEmergencyWhereEmer.php?isAdd=true&phone=$phone';
    await Dio().get(path).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String send_emer = preferences.getString('Name')!;
      String code = preferences.getString('Code')!;
      print('## name_send ==>> $send_emer');
      if (value.toString() == 'null') {
        print('## แจ้งเหตุสำเร็จ');

        if (file == null) {
          //No avatar
          processInsertMySQL(
            e_name: e_name,
            e_date: e_date,
            phone: phone,
            code: code,
            send_emer: send_emer,
          );
        } else {
          //Have avatar
          print('## process Upload picEmergency');
          String apiSaveEmergency =
              '${MyConstant.domain}/emer_projectnew/api/saveEmergency.php';
          int i = Random().nextInt(100000);
          String nameEmergency = 'emergency$i.jpg';
          Map<String, dynamic> map = Map();
          map['file'] =
              await MultipartFile.fromFile(file!.path, filename: nameEmergency);
          FormData data = FormData.fromMap(map);
          await Dio().post(apiSaveEmergency, data: data).then((value) {
            picEmergency = '/emer_projectnew/api/emergency/$nameEmergency';
            processInsertMySQL(
              e_name: e_name,
              e_date: e_date,
              phone: phone,
              code: code,
              send_emer: send_emer,
            );
          });
        }
      } else {
        MyDialog()
            .normalDialog(context, 'แจ้งเหตุไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง');
      }
    });
  }

  Future<Null> processInsertMySQL(
      {String? e_name,
      String? e_date,
      String? phone,
      String? status,
      String? code,
      String? send_emer,
      String? rec_emer}) async {
    print('## processInsertMySQL Work and picEmergency ==>> $picEmergency , ');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String TypeUser = preferences.getString('type')!;

    String apiInsertEmergency =
        '${MyConstant.domain}/emer_projectnew/api/insertEmergency.php?isAdd=true&e_type=$typeEmer&e_name=$e_name&e_date=$e_date&pic=$picEmergency&lat=$lat&lng=$lng&location=$valueChoose&phone=$phone&status=$status&code=$code&send_emer=$send_emer&rec_emer=$rec_emer';
    await Dio().get(apiInsertEmergency).then((value) {
      if (value.toString() == 'true') {
        notificationToDriver(TypeUser);
        MyDialog().normalDialog1(context, 'การแจ้งเหตุฉุกเฉินสำเร็จ', 'กรุณารอสักครู่');
      } else {
        MyDialog()
            .normalDialog(context, 'แจ้งเหตุไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง');
      }
    });
  }

  // Future<Null> normalDialog1(BuildContext context) async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) => Dialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Lottie.asset(
  //             'assets/images/done.json',
  //             width: 120,
  //             height: 120,
  //             repeat: false,
  //             controller: controller,
  //             onLoaded: (composition) {
  //               controller.duration = composition.duration;
  //               controller.forward();
  //             },
  //           ),
  //           ListTile(
  //             title: Center(
  //                 child: Text(
  //               'การแจ้งเหตุฉุกเฉินสำเร็จ',
  //               style: GoogleFonts.prompt(fontSize: 18),
  //             )),
  //             subtitle: Center(
  //                 child: Text(
  //               'กรุณารอสักครู่',
  //               style: GoogleFonts.prompt(fontSize: 18),
  //             )),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      // ignore: deprecated_member_use
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
        print('$file');
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.3,
          child: file == null
              ? ShowImage(path: MyConstant.camera)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 30,
          ),
        ),
      ],
    );
  }

  RadioListTile<String> buildRadioType1() {
    return RadioListTile(
      value: 'A',
      groupValue: typeEmer,
      toggleable: true,
      onChanged: (value) {
        setState(() {
          typeEmer = value;
        });
      },
      title: ShowTitle(title: 'หมดสติ', textStyle: MyConstant().h4Style()),
    );
  }

  RadioListTile<String> buildRadioType2() {
    return RadioListTile(
      value: 'B',
      groupValue: typeEmer,
      toggleable: true,
      onChanged: (value) {
        setState(() {
          typeEmer = value;
        });
      },
      title:
          ShowTitle(title: 'รถล้ม , รถชน', textStyle: MyConstant().h4Style()),
    );
  }

  RadioListTile<String> buildRadioType3() {
    return RadioListTile(
      value: 'C',
      groupValue: typeEmer,
      toggleable: true,
      onChanged: (value) {
        setState(() {
          typeEmer = value;
        });
      },
      title: ShowTitle(title: 'อื่น ๆ', textStyle: MyConstant().h4Style()),
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h5Style(),
      ),
    );
  }

  Container buildTitle2(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h5Style(),
      ),
    );
  }

  Future<Null> notificationToDriver(String TypeUser) async {
    String urlFindToken =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUsername.php?isAdd=true&type=$TypeUser';
    await Dio().get(urlFindToken).then((value) {
      var result = json.decode(value.data);
      print('result ==> ${result.toString()}');
      for (var json in result) {
        UserModel model = UserModel.fromMap(json);
        var tokenDriver = model.Token;
        print('tokenDriver ===> $tokenDriver');

        String title = 'มีการแจ้งเหตุฉุกเฉิน';
        String body = 'มีการแจ้งเหตุฉุกเฉินจากผู้ใช้';

        String urlSendToken =
            '${MyConstant.domain}/emer_projectnew/api/apiNotification.php?isAdd=true&token=$tokenDriver&title=$title&body=$body';

        sendNotificationToDriver(urlSendToken);
      }
    });
  }

  Future<Null> sendNotificationToDriver(String urlSendToken) async {
    await Dio().get(urlSendToken).then((value) {});
  }
}
