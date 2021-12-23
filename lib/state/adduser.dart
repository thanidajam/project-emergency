import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String? typeUser;
  String image = '';
  File? file;
  final formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Row buildCode(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: codeController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Code :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildUsername(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Username :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Password :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Name :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Email :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลด้วยค่ะ';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h4Style(),
              labelText: 'Phone :',
              prefixIcon: Icon(Icons.people_outline),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            buildCreateuser(),
          ],
          title: Text('เพิ่มข้อมูล'),
          backgroundColor: MyConstant.bg2,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              buildTitle('ข้อมูลทั่วไป'),
              buildCode(size),
              buildUsername(size),
              buildPassword(size),
              buildName(size),
              buildPhone(size),
              buildEmail(size),
              buildTitle('ประเภทของ user'),
              buildRadioS(size),
              buildRadioD(size),
              buildRadioA(size),
              buildTitle('รูปภาพ'),
              buildAvatar(size),
            ],
          ),
        ));
  }

  IconButton buildCreateuser() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (typeUser == null) {
            print('Non Choose Type user');
            MyDialog().normalDialog(context, 'ยังไม่ได้เลือกชนิดของ user',
                'กรุณาเลือกชนิดของ user');
          } else {
            print('Process insert to database');
            uploadImageAndInsertData();
          }
        }
      },
      icon: Icon(Icons.notifications),
    );
  }

  Future<Null> uploadImageAndInsertData() async {
    String code = codeController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String name = nameController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    print(
        '## code = $code, username = $username, password = $password, name = $name, phone = $phone, email = $email');
    String path =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUser.php?isAdd=true&username=$username';
    await Dio().get(path).then((value) async {
      print('## value ==>> $value');
      if (value.toString() == 'null') {
        print('## user OK');

        if (file == null) {
          //No Avatar
          processInsertMySQL(
              code: code,
              username: username,
              password: password,
              name: name,
              phone: phone,
              email: email);
        } else {
          //Have Avatar
          print('## process upload avatar');
          String apiSavefileUser =
              '${MyConstant.domain}/emer_projectnew/api/savefileUser.php';
          int i = Random().nextInt(100000);
          String nameimage = 'image$i.jpg';
          Map<String, dynamic> map = Map();
          map['file'] =
              await MultipartFile.fromFile(file!.path, filename: nameimage);
          FormData data = FormData.fromMap(map);
          await Dio().post(apiSavefileUser, data: data).then((value) {
            image = '/emer_projectnew/api/user/$nameimage';
            processInsertMySQL(
                code: code,
                username: username,
                password: password,
                name: name,
                phone: phone,
                email: email);
          });
        }
      } else {
        MyDialog().normalDialog(context, 'User false ?', 'Please Change User');
      }
    });
  }

  Future<Null> processInsertMySQL(
      {String? code,
      String? username,
      String? password,
      String? name,
      String? phone,
      String? email}) async {
    print('## processInsertMySQL Work and Avatar ==> $image');
    String apiInsertUser =
        '${MyConstant.domain}/emer_projectnew/api/insertUser.php?isAdd=true&code=$code&username=$username&password=$password&name=$name&email=$email&phone=$phone&type=$typeUser&image=$image';
    await Dio().get(apiInsertUser).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog().normalDialog(
            context, 'Create new user flase!!', 'Plase Try Again');
      }
    });
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      // ignore: deprecated_member_use
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? ShowImage(path: MyConstant.avatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
          ),
        ),
      ],
    );
  }

  Row buildRadioS(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'S',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'นักศึกษา/บุคคลากร',
              textStyle: MyConstant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioD(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'D',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'คนขับรถพยาบาล',
              textStyle: MyConstant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioA(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'A',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'แอดมิน',
              textStyle: MyConstant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h3Style(),
      ),
    );
  }
}
