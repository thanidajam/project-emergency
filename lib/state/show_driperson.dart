import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/user.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowDriperson extends StatefulWidget {
  final UserModel? userModel;
  const ShowDriperson({Key? key, required this.userModel}) : super(key: key);

  @override
  _ShowDripersonState createState() => _ShowDripersonState();
}

class _ShowDripersonState extends State<ShowDriperson> {
  UserModel? userModel;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   userModel = widget.userModel;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: MyConstant.bg2,
      ),
      // body: Column(
      //   children: [
      //     ShowTitle(title: 'ชื่อ - นามสกุล', textStyle: MyConstant().h8Style()),
      //     ShowTitle(title: userModel!.Name, textStyle: MyConstant().h8Style()),
      //   ],
      // ),
    );
  }
}
