import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StdServer extends StatefulWidget {
  const StdServer({Key? key}) : super(key: key);

  @override
  _StdServerState createState() => _StdServerState();
}

class _StdServerState extends State<StdServer> {
  int indexWidget = 0;
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
        backgroundColor: MyConstant.bg2,
      ),
      body: Form(
        child: ListView(
          children: [
            buildButtomEmer(context),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButtomHospital(context),
                    buildButtomTelemer(context),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: buildButtomContact(context),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                buildHead(),
                menuEmergency(),
                menuAidemer(),
                menuTelemer(),
                menuContact(),
                ShowSignOut(),
              ],
            ),
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
        accountEmail:
            Text(userModel == null ? 'Phone ?' : userModel!.Username));
  }

  ListTile menuEmergency() {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, MyConstant.routeEmergent),
      leading: FaIcon(
        FontAwesomeIcons.ambulance,
        size: 30,
      ),
      title: ShowTitle(
        title: 'แจ้งเหตุฉุกเฉิน',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  ListTile menuAidemer() {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, MyConstant.routeShowAidpage),
      leading: Icon(
        Icons.local_hospital,
        size: 38,
      ),
      title: ShowTitle(
        title: 'การปฐมพยาบาลเบื้องต้น',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  ListTile menuTelemer() {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, MyConstant.routeShowTelemerpage),
      leading: Icon(
        Icons.phone_in_talk_rounded,
        size: 38,
      ),
      title: ShowTitle(
        title: 'เบอร์โทรฉุกเฉิน',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  ListTile menuContact() {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, MyConstant.routeShowContactpage),
      leading: Icon(
        Icons.quick_contacts_dialer,
        size: 38,
      ),
      title: ShowTitle(
        title: 'ติดต่อเรา',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  Row buildButtomEmer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 200.0,
          child: SizedBox.fromSize(
              size: Size(200, 200), // button width and height
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, MyConstant.routeEmergent),
                    child: Column(
                      children: <Widget>[
                        ShowImage(path: MyConstant.butemer),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

Row buildButtomHospital(BuildContext context) {
  return Row(
    children: [
      Container(
          height: 170.0,
          child: SizedBox.fromSize(
              size: Size(170, 170), // button width and height
              child: Material(
                  child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, MyConstant.routeShowAidpage),
                      child: Column(
                        children: <Widget>[
                          ShowImage(path: MyConstant.hospial),
                        ],
                      ))))),
    ],
  );
}

Container buildButtomTelemer(BuildContext context) {
  return Container(
      height: 170.0,
      child: SizedBox.fromSize(
          size: Size(170, 170), // button width and height
          child: Material(
              child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, MyConstant.routeShowTelemerpage),
                  child: Column(
                    children: <Widget>[
                      ShowImage(path: MyConstant.telemer),
                    ],
                  )))));
}

Row buildButtomContact(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          margin: EdgeInsets.only(top: 20),
          height: 170.0,
          child: SizedBox.fromSize(
              size: Size(170, 170), // button width and height
              child: Material(
                  child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, MyConstant.routeShowContactpage),
                      child: Column(
                        children: <Widget>[
                          ShowImage(path: MyConstant.contact),
                        ],
                      ))))),
    ],
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
