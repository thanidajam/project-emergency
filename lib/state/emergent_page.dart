import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Emergent extends StatefulWidget {
  const Emergent({Key? key}) : super(key: key);

  @override
  _EmergentState createState() => _EmergentState();
}

class _EmergentState extends State<Emergent> {
  String? typeEmer;
  String picEmergency = '';
  File? file;
  double? lat, lng;
  UserModel? userModel;
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController e_nameController = TextEditingController();
  TextEditingController e_dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
    //loadValueFromAPI();
  }

  // Future<Null> loadValueFromAPI() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String uid = preferences.getString('UID')!;

  //   String apiGetUserWhereUID =
  //       '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
  //   await Dio().get(apiGetUserWhereUID).then((value) {
  //         for (var item in json.decode(value.data)) {
  //           UserModel model = UserModel.fromMap(item);
  //           print('UID ==> ${model.UID}');
  //         }
  //       });
  // }

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
      MyDialog().alertLocationService(context, 'Location Service ปิดอยู่',
          'กรุณาเปิด Location Service ด้วยนะคะ');
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

  Row buildOther(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: size * 0.8,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกข้อมูลด้วยนะคะ';
                } else {}
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.white),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[400]),
            )),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: size * 0.8,
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกเบอร์โทรศัพท์ด้วยนะคะ';
                } else {}
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.white),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[350]),
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
              controller: e_nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.white),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[350]),
            )),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('แจ้งเหตุฉุกเฉิน'),
        backgroundColor: MyConstant.bg2,
      ),
      body: Form(
        key: formKey,
        child: ListView(padding: EdgeInsets.all(16), children: [
          buildMap(),
          buildTitle('ประเภทอุบัติเหตุ'),
          buildRadioType1(),
          buildRadioType2(),
          buildRadioType3(),
          // buildTitle('โปรดระบุ'),
          // buildOther(size),
          buildTitle('ชื่ออุบัติเหตุ'),
          buildName(size),
          buildTitle2('เบอร์โทรศัพท์'),
          buildPhone(size),
          buildTitle('ถ่ายรูป'),
          buildAvatar(size),
          buildButton(size),
        ]),
      ),
    );
  }

  Set<Marker> setMarker() => <Marker>[
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'คุณอยู่ที่นี่', snippet: 'Lat = $lat, Lng = $lng'),
        ),
      ].toSet();

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
          width: size * 0.4,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle1(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (typeEmer == null) {
                  print('กรุณาเลือกประเภทอุบติเหตุ');
                } else {
                  print('Insert to Database');
                  uploadImageAndInsertData();
                }
              }
            },
            child: Text(
              'เรียกรถพยาบาล',
              style: TextStyle(
                color: Colors.black,
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
      print('## value ==>> $value');
      if (value.toString() == 'null') {
        print('## แจ้งเหตุสำเร็จ');

        if (file == null) {
          //No avatar
          processInsertMySQL(
            e_name: e_name,
            e_date: e_date,
            phone: phone,

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
      String? rec_emer}) async {
    print(
        '## processInsertMySQL Work and picEmergency ==>> $picEmergency , ');
    String apiInsertEmergency =
        '${MyConstant.domain}/emer_projectnew/api/insertEmergency.php?isAdd=true&e_type=$typeEmer&e_name=$e_name&e_date=$e_date&pic=$picEmergency&phone=$phone&lat=$lat&lng=$lng&status=$status&rec_emer=$rec_emer';
    await Dio().get(apiInsertEmergency).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog()
            .normalDialog(context, 'แจ้งเหตุไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง');
      }
    });
  }

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
      value: 'หมดสติ',
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
      value: 'รถล้ม , รถชน',
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
      value: 'อื่น ๆ',
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
}
