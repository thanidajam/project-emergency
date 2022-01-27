import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDriperson extends StatefulWidget {
  const  ShowDriperson({Key? key}) :super(key: key);

  @override
  _ShowDripersonState createState() => _ShowDripersonState();
}

class _ShowDripersonState extends State<ShowDriperson> {
  List<Widget>widgets = [];
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushUserModel();
  }

  Future<Null> pushUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString('UID')!;

    print('uid login ==> $uid');
    String apiGetUserWhereUID = '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
    await Dio().get(apiGetUserWhereUID).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: MyConstant.bg2,
      ),
      body: Column(
        children: [
          ShowTitle(title: 'ชื่อ - นามสกุล', textStyle: MyConstant().h8Style()),
          ShowTitle(title: userModel!.Name, textStyle: MyConstant().h8Style()),
        ],
      ),
    );
  }
}
