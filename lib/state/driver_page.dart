import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/show_driperson.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverServer extends StatefulWidget {
  const DriverServer({Key? key}) : super(key: key);

  @override
  _DriverServerState createState() => _DriverServerState();
}

class _DriverServerState extends State<DriverServer> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserModel();
  }

  Future<Null> findUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString('UID')!;

    print('## id Logined ==> $uid');
    String apiGetUserWhereUID =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
    await Dio().get(apiGetUserWhereUID).then((value) {
      print('value ==> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('## name logined = ${userModel!.Name}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
        title: Text('ประวัติการแจ้งเหตุ'),
        backgroundColor: MyConstant.bg2,
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                buildHead(),
                menuDataperson(context),
                ShowSignOut(),
              ],
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader buildHead() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: MyConstant.bg2),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('${MyConstant.domain}${userModel?.image}'),
      ),
      accountName: Text(userModel == null ? 'Name ?' : userModel!.Name),
      accountEmail: Text(userModel == null ? 'Phone ?' : userModel!.Phone),
    );
  }
}

ListTile menuDataperson(context) {
  return ListTile(
    onTap: () => Navigator.pushNamed(context, MyConstant.routeShowDriperson),
    leading: Icon(
      Icons.portrait,
      size: 38,
    ),
    title: ShowTitle(title: 'ข้อมูลส่วนตัว', textStyle: MyConstant().h7Style()),
  );
}

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeUser, (route) => false));
          },
          leading: Icon(
            Icons.phonelink_erase_rounded,
            size: 36,
          ),
          title: ShowTitle(
            title: 'ออกจากระบบ',
            textStyle: MyConstant().h7Style(),
          ),
        ),
      ],
    );
  }
}
