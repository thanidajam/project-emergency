import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: MyConstant.bg1,
          body: PageLogin(),
        ),
      ),
    );
  }
}

Widget buildImage(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.only(top: 25, bottom: 10),
          width: size * 0.4,
          child: ShowImage(path: MyConstant.image)),
    ],
  );
}

Widget buildAppName() {
  return Column(
    children: [
      ShowTitle(
        title: MyConstant.appName,
        textStyle: MyConstant().h1Style(),
      ),
      SizedBox(
        height: 5,
      ),
      ShowTitle(
        title: MyConstant.appName1,
        textStyle: MyConstant().h1Style(),
      ),
    ],
  );
}

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                buildAppName(),
                buildUser(size),
                buildPassword(size),
                buildLogin(size),
                buildEmergent(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Row buildEmergent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              MyDialog().normalDialog2(context, 'ลืมรหัสผ่าน',
                  'กรุณานำบัตรนักศึกษาหรือบัตรประชาชน ติดต่อที่สำนักส่งเสริมวิชาการและงานทะเบียน ชั้น 1');
            },
            child: Text(
              'ลืมรหัสผ่าน',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          width: size * 0.3,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String username = usernameController.text;
                String password = passwordController.text;
                print('username = $username, password = $password');
                checkUser(username: username, password: password);
              }
            },
            child: Text(
              'เข้าสู่ระบบ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> checkUser({String? username, String? password}) async {
    String apiCheckUser =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUser.php?isAdd=true&username=$username';
    await Dio().get(apiCheckUser).then((value) async {
      // print('## value for API ==>> $value');
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ตรวจสอบข้อมูล',
            'กรุณาระบุชื่อผู้ใช้งาน และรหัสผ่านให้ถูกต้อง');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.Password) {
            //success user
            String type = model.Type;
            print('## user success in Type ==> $type');

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('type', type);
            preferences.setString('UID', model.UID);
            preferences.setString('Name', model.Name);
            preferences.setString('Phone', model.Phone);
            preferences.setString('Code', model.Code);
            preferences.setString('image', model.image);
            preferences.setString('Username', model.Username);
            preferences.setString('token', model.Token);
            preferences.setString('Code', model.Code);

            switch (type) {
              case 'S':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeStdServer, (route) => false);
                break;
              case 'D':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeDriverServer, (route) => false);
                break;
              default:
            }
          } else {
            //user false
            MyDialog().normalDialog(context, 'ตรวจสอบข้อมูล',
                'รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง');
          }
        }
      }
    });
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 50),
            width: size * 0.8,
            child: TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกชื่อผู้ใช้/รหัสนักศึกษา';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: 'ชื่อผู้ใช้/รหัสนักศึกษา มีขีด (-)',
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: MyConstant.dark,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.white),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            )),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: size * 0.8,
            child: TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกรหัสผ่าน';
                } else {
                  return null;
                }
              },
              obscureText: statusRedEye,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        statusRedEye = !statusRedEye;
                      });
                    },
                    icon: statusRedEye
                        ? Icon(
                            Icons.remove_red_eye,
                            color: MyConstant.dark,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: MyConstant.dark,
                          ),
                  ),
                  hintText: 'รหัสผ่าน',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: MyConstant.dark,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.white),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            )),
      ],
    );
  }
}
