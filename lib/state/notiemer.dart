import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/state/show_notiemer.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class showNotiEmer extends StatefulWidget {
  showNotiEmer({Key? key}) : super(key: key);

  @override
  State<showNotiEmer> createState() => _showNotiEmerState();
}

class _showNotiEmerState extends State<showNotiEmer> {
  bool load = true;
  bool? haveData;
  List<EmergencyModel> emergencyModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAPI();
  }

  Future<Null> readAPI() async {
    String urlAPI = '${MyConstant.domain}/emer_projectnew/api/getEmergency.php';
    await Dio().get(urlAPI).then((value) {
      //print ('value ==> $value');

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
          print('name firstaid ==> ${model.E_name}');

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
        title: Text('การแจ้งเตือน'),
        backgroundColor: MyConstant.bg2,
      ),
      body: load
          ? ShowProgress()
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
      itemBuilder: (context, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, left: 20),
            width: constraints.maxWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: ShowTitle(
                      title: '${emergencyModels[index].E_name}  ',
                      textStyle: MyConstant().h8Style()),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShownotiEmergency(
                            emergencyModel: emergencyModels[index]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ShowTitle(
                      title: '${emergencyModels[index].E_date}',
                      textStyle: MyConstant().h8Style()),
                )
                // ShowTitle(
                //     title:
                //         '${emergencyModels[index].E_name} . ${emergencyModels[index].E_date}',
                //     textStyle: MyConstant().h8Style()),
                // IconButton(
                //   onPressed: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ShownotiEmergency(emergencyModel: emergencyModels[index]),
                //       )),
                //   icon: Icon(
                //     Icons.remove_red_eye_rounded,
                //     size: 30,
                //  ),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
