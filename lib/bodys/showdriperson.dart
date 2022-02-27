import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDripersons extends StatefulWidget {
  final UserModel userModel;
  ShowDripersons({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShowDripersons> createState() => _ShowDripersonsState();
}

class _ShowDripersonsState extends State<ShowDripersons> {
  UserModel? userModel;
  bool statusRedEye = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
    userModel = widget.userModel;
  }

  Future<Null> refreshUserModel() async {
    print('refreshUserModel Work');
    String apiGetUserWhereUID =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=${userModel!.UID}';
    await Dio().get(apiGetUserWhereUID).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          findUser();
        });
      }
    });
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString('UID')!;

    String apiGetUser =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
    await Dio().get(apiGetUser).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          nameController.text = userModel!.Name;
          usernameController.text = userModel!.Username;
          phoneController.text = userModel!.Phone;
          passwordController.text = userModel!.Password;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: constraints.maxWidth * 0.4,
                  height: constraints.maxHeight * 0.25,
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('${MyConstant.domain}${userModel!.image}'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45),
                  child: ShowTitle(
                      title: 'ชื่อ - นามสกุล',
                      textStyle: MyConstant().h8Style()),
                ),
              ],
            ),
            Container(
                width: constraints.maxWidth * 0.8,
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: GoogleFonts.prompt(),
                  readOnly: true,
                  controller: nameController,
                  decoration: InputDecoration(
                      // hintText: '${userModel!.Name}',
                      helperStyle: GoogleFonts.prompt(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyConstant.gray),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyConstant.gray),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.grey),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: ShowTitle(
                      title: 'ชื่อผู้ใช้', textStyle: MyConstant().h8Style()),
                ),
              ],
            ),
            Container(
                width: constraints.maxWidth * 0.8,
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: GoogleFonts.prompt(),
                  readOnly: true,
                  controller: usernameController,
                  decoration: InputDecoration(
                      // hintText: '${userModel!.Username}',
                      hintStyle: GoogleFonts.prompt(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyConstant.gray),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyConstant.gray),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.grey),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: ShowTitle(
                      title: 'เบอร์โทรศัพท์',
                      textStyle: MyConstant().h8Style()),
                ),
              ],
            ),
            Container(
                width: constraints.maxWidth * 0.8,
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: GoogleFonts.prompt(),
                  readOnly: true,
                  controller: phoneController,
                  decoration: InputDecoration(
                      // hintText: '${userModel!.Phone}',
                      hintStyle: GoogleFonts.prompt(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyConstant.gray),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyConstant.gray),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.grey),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45),
                  child: ShowTitle(
                      title: 'รหัสผ่าน', textStyle: MyConstant().h8Style()),
                ),
              ],
            ),
            Container(
                width: constraints.maxWidth * 0.8,
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: GoogleFonts.prompt(),
                  readOnly: true,
                  obscureText: statusRedEye,
                  controller: passwordController,
                  decoration: InputDecoration(
                      // hintText: '${userModel!.Password}',
                      hintStyle: GoogleFonts.prompt(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyConstant.gray),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyConstant.gray),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.grey),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                        context, MyConstant.routeEditprofileDriver)
                    .then((value) => refreshUserModel()),
                style: MyConstant().myButtonStyle5(),
                child: Text(
                  'แก้ไขข้อมูล',
                  style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
