import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/firstaid_model.dart';
import 'package:emer_projectnew/state/show_aidpagefull.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowAidpage extends StatefulWidget {
  const ShowAidpage({Key? key}) : super(key: key);

  @override
  _ShowAidpageState createState() => _ShowAidpageState();
}

class _ShowAidpageState extends State<ShowAidpage> {
  bool load = true;
  bool? haveData;
  List<FirstaidModel> firstaidModels = [];

  @override
  void initState() {
    super.initState();
    readAPI();
  }

  Future<Null> readAPI() async {
    String urlAPI = '${MyConstant.domain}/emer_projectnew/api/getFirstaid.php';
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
          FirstaidModel model = FirstaidModel.fromMap(item);
          print('name firstaid ==> ${model.Title}');

          setState(() {
            load = false;
            haveData = true;
            firstaidModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การปฐมพยาบาลเบื้องต้น'),
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
      itemCount: firstaidModels.length,
      itemBuilder: (context, index) => Card(
        color: Colors.deepOrange[50],
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 20),
              width: constraints.maxWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowTitle(
                          title:
                              '${firstaidModels[index].FID} . ${firstaidModels[index].Title}',
                          textStyle: MyConstant().h8Style()),
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowAidpagefull(
                                firstaidModel: firstaidModels[index],
                              ),
                            )),
                        icon: Icon(
                          Icons.remove_red_eye_rounded,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
