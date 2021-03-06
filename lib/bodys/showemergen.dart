import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/animation/FadeAnimation.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/show_dataemer.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowEmergen extends StatefulWidget {
  EmergencyModel? emergencyModel;
  ShowEmergen({Key? key, this.emergencyModel}) : super(key: key);

  @override
  _ShowEmergenState createState() => _ShowEmergenState();
}

class _ShowEmergenState extends State<ShowEmergen> {
  bool load = true;
  bool? haveData;
  List<EmergencyModel> emergencyModels = [];
  EmergencyModel? emergencyModel;
  DateTime? date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    String? status;
    String urlData =
        '${MyConstant.domain}/emer_projectnew/api/getEmergencyWhereStatus.php?isAdd=true&status=$status';
    await Dio().get(urlData).then((value) {
      if (value.toString() == 'null') {
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
      body: load
          ? Text('')
          : haveData!
              ? LayoutBuilder(
                  builder: (context, constraints) => buildListView(constraints),
                )
              : ShowTitle(title: 'No data', textStyle: MyConstant().h4Style()),
    );
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
        itemCount: emergencyModels.length,
        itemBuilder: (context, index) => FadeAnimation(
              (0.8 + index) / 4,
              Card(
                color: Colors.blueGrey[50],
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDataEmer(
                              emergencyModel: emergencyModels[index]))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
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
                                        Icons.medical_services,
                                        size: 40,
                                        color: Colors.redAccent,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ShowTitle(
                                            title: '${emergencyModels[index].E_type}' ==
                                                    'B'
                                                ? '??????????????? , ????????????'
                                                : '${emergencyModels[index].E_type}' ==
                                                        'C'
                                                    ? '${emergencyModels[index].E_name}'
                                                    : '${emergencyModels[index].E_type}' ==
                                                            'A'
                                                        ? '??????????????????'
                                                        : '${emergencyModels[index].E_type}' ==
                                                                'n'
                                                            ? '?????????????????????????????????????????????????????????????????????'
                                                            : '${emergencyModels[index].E_type}',
                                            textStyle: MyConstant().h10Style()),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ShowTitle(
                                            title: emergencyModels[index].E_date,
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
            ));
  }
}
