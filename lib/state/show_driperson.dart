import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowDriperson extends StatefulWidget {
  const ShowDriperson({Key? key,}) : super(key: key);

  @override
  _ShowDripersonState createState() => _ShowDripersonState();
}

class _ShowDripersonState extends State<ShowDriperson> {
  UserModel? userModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: MyConstant.bg2,
      ),
    );
  }
}
