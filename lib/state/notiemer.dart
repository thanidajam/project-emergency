import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/show_notiemer.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class showNotiEmer extends StatefulWidget {
  final EmergencyModel emergencyModel;
  showNotiEmer({Key? key, required this.emergencyModel}) : super(key: key);

  @override
  State<showNotiEmer> createState() => _showNotiEmerState();
}

class _showNotiEmerState extends State<showNotiEmer> {
  bool load = true;
  bool? haveData;
  List<EmergencyModel> emergencyModels = [];
  EmergencyModel? emergencyModel;
  DateTime? date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAPI();
    date = DateTime.parse(widget.emergencyModel.E_date);
  }

  Future<Null> readAPI() async {
    String urlAPI =
        '${MyConstant.domain}/emer_projectnew/api/getEmerWhereStatusn.php?isAdd=true&status=n';
    await Dio().get(urlAPI).then((value) {
      if (value.toString() == 'null') {
        //No data
        setState(() {
          haveData = false;
        });
      } else {
        //Have data
        var result = json.decode(value.data);
        //print('result = $result');
        for (var item in result) {
          // print('item ==> $item');
          EmergencyModel model = EmergencyModel.fromMap(item);
          // print('name emergency ==> ${model.E_name}');

          setState(() {
            load = false;
            haveData = true;
            emergencyModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'การแจ้งเตือน',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: MyConstant.bg2,
      ),
      body: load
          ? Text('')
          : haveData!
              ? LayoutBuilder(
                  builder: (context, constraints) => buildListView(constraints),
                )
              : ShowTitle(
                  title: 'ไม่มีแจ้งเตือน', textStyle: MyConstant().h4Style()),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: emergencyModels.length,
      itemBuilder: (context, index) => Card(
        color: Colors.blueGrey[50],
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShownotiEmergency(emergencyModel: emergencyModels[index]),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: constraints.maxWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 5, left: 10),
                            child: Icon(
                              Icons.notifications_active,
                              size: 35,
                              color: Colors.redAccent,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ShowTitle(
                                    title: '${emergencyModels[index].E_type}' ==
                                            'B'
                                        ? 'รถล้ม , รถชน'
                                        : '${emergencyModels[index].E_type}' ==
                                                'A'
                                            ? 'หมดสติ'
                                            : '${emergencyModels[index].E_type}' ==
                                                    'n'
                                                ? 'ไม่ระบุประเภทอุบัติเหตุ'
                                                : '${emergencyModels[index].E_type}' ==
                                                        'C'
                                                    ? '${emergencyModels[index].E_name}'
                                                    : '${emergencyModels[index].E_name}' ==
                                                            ' '
                                                        ? 'ไม่ระบุประเภทอุบัติเหตุ'
                                                        : '${emergencyModels[index].E_type}',
                                    textStyle: MyConstant().h8Style()),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ShowTitle(
                                    title:
                                        '${date!.day} ${allMonth[date!.month - 1]} ${date!.year + 543} \n${date!.hour.toString().padLeft(2, '0')} : ${date!.minute.toString().padLeft(2, '0')} น.',
                                    textStyle: MyConstant().h4Style()),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
