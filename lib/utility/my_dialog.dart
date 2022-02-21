import 'dart:io';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_imgae.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h5Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h6Style(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: ListTile(
          title: Center(child: Text(title, style: TextStyle(fontSize: 18))),
          subtitle:
              Center(child: Text(message, style: TextStyle(fontSize: 18))),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: TextStyle(fontSize: 18)))
        ],
      ),
    );
  }

  Future<Null> normalDialog1(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Column(
          children: [
            Image.asset(
              'assets/images/ambulance.png',
              width: 70,
              height: 70,
            ),
            ListTile(
              title: Center(
                  child: Text(
                title,
                style: TextStyle(fontSize: 18),
              )),
              subtitle: Center(
                  child: Text(
                message,
                style: TextStyle(fontSize: 18),
              )),
            ),
          ],
        ),
        children: [
          TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, MyConstant.routeStdServer),
              child: Text('ตกลง', style: TextStyle(fontSize: 18)))
        ],
      ),
    );
  }

  Future<Null> normalDialog2(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Column(
          children: [
            Image.asset(
              'assets/images/ambulance.png',
              width: 70,
              height: 70,
            ),
            ListTile(
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              subtitle: Center(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ตกลง', style: TextStyle(fontSize: 18)))
        ],
      ),
    );
  }

  void showProgressDialog(BuildContext context) {}
}
