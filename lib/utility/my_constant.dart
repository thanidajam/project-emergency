import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Gerneral
  static String appName = 'Welcome To Appication';
  static String appName1 = 'Rmutt Emergency Notification';
  static String appName2 = 'นักศึกษา/บุคคลากร';
  static String appName3 = 'พนักงานขับรถพยาบาล';
  static String domain = 'http://291c-183-89-147-216.ngrok.io';

  //Route
  static String routeUser = '/user';
  static String routeEmergent = '/emergent';
  static String routeStdServer = '/stdServer';
  static String routeDriverServer = '/driverServer';
  static String routeShowAidpage = '/showAidpage';
  static String routeShowTelemerpage = '/showTelemerpage';
  static String routeShowContactpage = '/showContactpage';
  static String routeShowTelemerpage2 = '/showTelemerpage2';
  static String routeShowTelemerpage3 = '/showTelemerpage3';
  static String routeShowTelemerpage4 = '/showTelemerpage4';
  static String routeShowAidpagefull = '/showAidpagefull';
  static String routeAddUser = '/addUser';
  static String routeshowNotiEmer = '/showNotiEmer';
  static String routeshownotiEmergency = '/showNotiEmergency';
  static String routeshowNotiEmergen = '/showNotiEmergen';
  static String routeShowDataEmer = '/showDataEmer';
  static String routeEditprofileDriver = '/editprofileDriver';

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
  static Color gray = Color(0xFFCFD8DC);
  static Color bg1 = Color(0xfffce4ec);
  static Color bg2 = Color(0xffef5350);
  static Color bg3 = Color(0xFF64DD17);
  static Color bg4 = Color(0xFFFF7043);
  static Color bg5 = Color(0xFFFFD54F);
  static Color bg6 = Color(0xFF2E7D32);
  static Color bg7 = Color(0xFFECEFF1);
  static Color bg8 = Color(0xFF263238);
  static Color kPrimaryColor = Color.fromARGB(255, 245, 199, 253);
  static Color kPrimaryLightColor = Color(0xFFF1E6FF);

  //Style
  TextStyle h1Style() => GoogleFonts.prompt(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => GoogleFonts.prompt(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => GoogleFonts.prompt(
        fontSize: 16,
        color: primary,
        fontWeight: FontWeight.bold,
      );

  TextStyle h4Style() => GoogleFonts.prompt(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h5Style() => GoogleFonts.prompt(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h6Style() => GoogleFonts.prompt(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h7Style() => GoogleFonts.prompt(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h8Style() => GoogleFonts.prompt(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h9Style() => GoogleFonts.prompt(
        fontSize: 20,
        color: primary,
        fontWeight: FontWeight.bold,
      );

  TextStyle h10Style() => GoogleFonts.prompt(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h11Style() => GoogleFonts.prompt(
        fontSize: 18,
        color: bg8,
        fontWeight: FontWeight.normal,
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

  ButtonStyle myButtonStyle2() => ElevatedButton.styleFrom(
        primary: MyConstant.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle myButtonStyle3() => ElevatedButton.styleFrom(
        primary: MyConstant.bg3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle myButtonStyle4() => ElevatedButton.styleFrom(
        primary: MyConstant.bg4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle myButtonStyle5() => ElevatedButton.styleFrom(
        primary: MyConstant.bg5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle myButtonStyle6() => ElevatedButton.styleFrom(
        primary: MyConstant.bg6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle myButtonStyle7() => ElevatedButton.styleFrom(
        primary: MyConstant.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
}
