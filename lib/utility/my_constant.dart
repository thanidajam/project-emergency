import 'package:flutter/material.dart';

class MyConstant {
  
  // Gerneral
  static String appName = 'Welcome To Appication';
  static String appName1 = 'Rmutt Emergency Notification';
  static String appName2 = 'นักศึกษา/บุคคลากร';
  static String appName3 = 'พนักงานขับรถพยาบาล';
  static String domain = 'http://aefb-203-158-248-18.ngrok.io';

  //Route
  static String routeUser = '/user';
  static String routeEmergent = '/emergent';
  static String routeStdServer = '/stdServer';
  static String routeDriverServer = '/driverServer';
  static String routeShowAidpage = '/showAidpage';
  static String routeShowTelemerpage = '/showTelemerpage';
  static String routeShowContactpage = '/showContactpage';
  static String routeShowDriperson = '/showDriperson';
  static String routeShowTelemerpage2 = '/showTelemerpage2';
  static String routeShowTelemerpage3 = '/showTelemerpage3';
  static String routeShowTelemerpage4 = '/showTelemerpage4';
  static String routeShowAidpagefull = '/showAidpagefull';
  static String routeAddUser = '/addUser';


  //Image
  static String image = 'assets/images/ambulance.png';
  static String image1 = 'assets/images/bg.png';
  static String camera = 'assets/images/image.png';
  static String butemer = 'assets/images/butemer.png';
  static String hospial = 'assets/images/hospital.png';
  static String telemer = 'assets/images/telemer.png';
  static String contact = 'assets/images/contact.png';
  static String avatar = 'assets/images/avata.png';

  //Color
  static Color primary = Color(0xff003300);
  static Color dark = Color(0xff212121);
  static Color light = Color(0xff4c8c4a);
  static Color white = Color(0xffffffff);
  static Color bg1 = Color(0xfffce4ec);
  static Color bg2 = Color(0xffef5350);

  //Style
  TextStyle h1Style() => TextStyle(
    fontSize: 24,
    color: dark,
    fontWeight: FontWeight.bold,
  );

  TextStyle h2Style() => TextStyle(
    fontSize: 20,
    color: dark,
    fontWeight: FontWeight.w700,
  );

  TextStyle h3Style() => TextStyle(
    fontSize: 16,
    color: primary,
    fontWeight: FontWeight.bold,
  );

  TextStyle h4Style() => TextStyle(
    fontSize: 16,
    color: dark,
    fontWeight: FontWeight.normal,
  );

  TextStyle h5Style() => TextStyle(
    fontSize: 16,
    color: dark,
    fontWeight: FontWeight.w700,
  );

    TextStyle h6Style() => TextStyle(
    fontSize: 14,
    color: dark,
    fontWeight: FontWeight.normal,
  );

  TextStyle h7Style() => TextStyle(
    fontSize: 20,
    color: dark,
    fontWeight: FontWeight.normal,
  );

    TextStyle h8Style() => TextStyle(
    fontSize: 18,
    color: dark,
    fontWeight: FontWeight.normal,
  );

    TextStyle h9Style() => TextStyle(
    fontSize: 20,
    color: primary,
    fontWeight: FontWeight.bold,
  );

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
                    primary: MyConstant.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                    );

  ButtonStyle myButtonStyle1() => ElevatedButton.styleFrom(
                    primary: MyConstant.bg2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                    );

}