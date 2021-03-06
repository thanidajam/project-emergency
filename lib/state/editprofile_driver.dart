import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:emer_projectnew/bodys/showdriperson.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/utility/my_dialog.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditprofileDriver extends StatefulWidget {
  EditprofileDriver({Key? key}) : super(key: key);

  @override
  State<EditprofileDriver> createState() => _EditprofileDriverState();
}

class _EditprofileDriverState extends State<EditprofileDriver> {
  UserModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? file;
  bool statusRedEye = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString('UID')!;

    String apiGetUser =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
    await Dio().get(apiGetUser).then((value) {
      print('value from API ==> $value');

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
      appBar: AppBar(
        title: Text('??????????????????????????????????????????????????????', style: GoogleFonts.prompt(),),
        backgroundColor: MyConstant.bg2,
      ),
      body: LayoutBuilder(
          builder: (context, constraints) => GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        buildImage(constraints),
                        buildTitle('???????????? - ?????????????????????'),
                        buildName(constraints),
                        buildTitle('??????????????????????????????'),
                        buildUsername(constraints),
                        buildTitle('???????????????????????????????????????'),
                        buildPhone(constraints),
                        buildTitle('???????????????????????????????????????'),
                        buildNewpassword(constraints),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton(),
                              SizedBox(width: 30),
                              buildButton1(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  Future<Null> processEditProfileDriver() async {
    print('processEditProfileDriver Work');

    MyDialog().showProgressDialog(context);

    if (formKey.currentState!.validate()) {
      if (file == null) {
        print('User Current Image');
        editValueToMySQL(userModel!.image);
      } else {
        print('User New Image');
        String apiSaveImage =
            '${MyConstant.domain}/emer_projectnew/api/savefileUser.php';

        List<String> nameImage = userModel!.image.split('/');
        String nameFile = nameImage[nameImage.length - 1];
        nameFile = '${Random().nextInt(100)}$nameFile';

        print('User New Image nameFile ==>> $nameFile');

        Map<String, dynamic> map = {};
        map['file'] =
            await MultipartFile.fromFile(file!.path, filename: nameFile);
        FormData formData = FormData.fromMap(map);
        await Dio().post(apiSaveImage, data: formData).then((value) {
          print('Upload Success');
          String pathImage = '/emer_projectnew/api/user/$nameFile';
          editValueToMySQL(pathImage);
        });
      }
    }
  }

  Future<Null> editValueToMySQL(String pathImage) async {
    print('pathImage ==> $pathImage');
    String apiEditProfile =
        '${MyConstant.domain}/emer_projectnew/api/editProfileDriverWhereUID.php?isAdd=true&uid=${userModel!.UID}&name=${nameController.text}&username=${usernameController.text}&phone=${phoneController.text}&password=${passwordController.text}&image=$pathImage';
    await Dio().get(apiEditProfile).then((value) => Navigator.pop(context),);
  }

  Future<Null> createImage({ImageSource? source}) async {
    try {
      var result = await ImagePicker().getImage(
        source: source!,
        maxWidth: 200,
        maxHeight: 200,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Container buildPicker() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose profile photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () => createImage(source: ImageSource.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () => createImage(source: ImageSource.gallery),
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Center buildImage(BoxConstraints constraints) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: userModel == null
          ? ShowProgress()
          : Stack(
              children: [
                userModel!.image == null
                    ? ShowImage(path: MyConstant.avatar)
                    : file == null
                        ? buildImageNetwork()
                        : Image.file(file!),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => buildPicker()),
                        );
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 30,
                      ),
                    ))
              ],
            ),
    ));
  }

  CircleAvatar buildImageNetwork() {
    return CircleAvatar(
        radius: 80,
        backgroundImage:
            NetworkImage('${MyConstant.domain}${userModel!.image}'));
  }

  Padding buildButton1() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: MyConstant().myButtonStyle1(),
          child: Text(
            '??????????????????',
            style: GoogleFonts.prompt(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          )),
    );
  }

  Padding buildButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
          onPressed: () => processEditProfileDriver(),
          style: MyConstant().myButtonStyle6(),
          child: Text(
            '??????????????????',
            style: GoogleFonts.prompt(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          )),
    );
  }

  Row buildNewpassword(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: constraints.maxWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: TextFormField(
              style: GoogleFonts.prompt(),
              validator: (value) {
                if (value!.isEmpty) {
                  return '???????????????????????????????????????????????????????????????';
                } else {
                  return null;
                }
              },
              controller: passwordController,
              obscureText: statusRedEye,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: constraints.maxWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: TextFormField(
              style: GoogleFonts.prompt(),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return '??????????????????????????????????????????????????????????????????';
                } else {
                  return null;
                }
              },
              controller: phoneController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUsername(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: constraints.maxWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: TextFormField(
              style: GoogleFonts.prompt(),
              validator: (value) {
                if (value!.isEmpty) {
                  return '?????????????????????????????????????????????????????????';
                } else {
                  return null;
                }
              },
              controller: usernameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
        ),
      ],
    );
  }

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: constraints.maxWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: TextFormField(
              style: GoogleFonts.prompt(),
              readOnly: true,
              controller: nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyConstant.gray),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyConstant.gray),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowTitle(title: title, textStyle: MyConstant().h8Style()),
        ],
      ),
    );
  }
}
