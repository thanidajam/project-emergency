import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/animation/FadeAnimation.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      FadeAnimation(
        1.5,
        Container(
            margin: EdgeInsets.only(bottom: 55),
            width: size * 0.58,
            child: ShowImage(path: MyConstant.login)),
      )
    ],
  );
}

Widget buildAppName() {
  return Column(
    children: [
      FadeAnimation(
        1.7,
        Text(
          'Rmutt Emergency Notification',
          style: GoogleFonts.prompt(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      )
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
          image: AssetImage('assets/images/bg_emer.png'),
          fit: BoxFit.fill,
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
                buildEmergent(),
                buildLogin(size),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Row buildEmergent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            MyDialog().normalDialog2(context, '',
                'กรุณานำบัตรนักศึกษาหรือบัตรประชาชน ติดต่อที่สำนักส่งเสริมวิชาการและงานทะเบียน ชั้น 1');
          },
          child: Padding(
              padding: const EdgeInsets.only(right: 35, top: 3),
              child: FadeAnimation(
                1.7,
                Text(
                  'ลืมรหัสผ่าน',
                  style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeAnimation(
          1.9,
          Container(
            padding: EdgeInsets.only(top: 10),
            width: size * 0.4,
            height: size * 0.15,
            child: ElevatedButton(
              style: MyConstant().myButtonStyle7(),
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
                style: GoogleFonts.prompt(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
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
        FadeAnimation(
          1.7,
          Container(
              margin: EdgeInsets.only(top: 50),
              width: size * 0.8,
              child: TextFormField(
                style: GoogleFonts.prompt(),
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
                    hintStyle: GoogleFonts.prompt(),
                    prefixIcon: Icon(
                      Icons.perm_identity,
                      color: MyConstant.dark,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyConstant.dark, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.dark, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              )),
        )
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeAnimation(
          1.8,
          Container(
              margin: EdgeInsets.only(top: 20),
              width: size * 0.8,
              child: TextFormField(
                style: GoogleFonts.prompt(),
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
                    hintStyle: GoogleFonts.prompt(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: MyConstant.dark,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyConstant.dark, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.dark, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              )),
        )
      ],
    );
  }
}
