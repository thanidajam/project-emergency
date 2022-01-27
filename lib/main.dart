import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/adduser.dart';
import 'package:emer_projectnew/state/notiemer.dart';
import 'package:emer_projectnew/state/show_aidpage.dart';
import 'package:emer_projectnew/state/show_aidpagefull.dart';
import 'package:emer_projectnew/state/show_contactpage.dart';
import 'package:emer_projectnew/state/show_driperson.dart';
import 'package:emer_projectnew/state/show_notiemer.dart';
import 'package:emer_projectnew/state/show_telemerpage.dart';
import 'package:emer_projectnew/state/show_telemerpage2.dart';
import 'package:emer_projectnew/state/show_telemerpage3.dart';
import 'package:emer_projectnew/state/show_telemerpage4.dart';
import 'package:flutter/material.dart';
import 'package:emer_projectnew/state/user.dart';
import 'package:emer_projectnew/state/std_page.dart';
import 'package:emer_projectnew/state/driver_page.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/state/emergent_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


final Map<String, WidgetBuilder> map = {
  '/user': (BuildContext context) => User(),
  '/emergent' : (BuildContext context) => Emergent(),
  '/stdServer': (BuildContext context) => StdServer(),
  '/driverServer': (BuildContext context) => DriverServer(),
  '/showAidpage': (BuildContext context) => ShowAidpage(),
  '/showTelemerpage': (BuildContext context) => ShowTelemerpage(),
  '/showContactpage': (BuildContext context) => ShowContactpage(),
  '/showDriperson': (BuildContext context) => ShowDriperson(),
  '/showTelemerpage2': (BuildContext context) => ShowTelemerPage2(),
  '/showTelemerpage3': (BuildContext context) => ShowTelemerPage3(),
  '/showTelemerpage4': (BuildContext context) => ShowTelemerPage4(),
  '/showAidpagefull': (BuildContext context) => ShowAidpagefull(),
  '/addUser' : (BuildContext context) => AddUser(),
  '/showNotiEmer' :(BuildContext context) => showNotiEmer(),
  '/showNotiEmergency' :(BuildContext context) => ShownotiEmergency(),
  
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  print('### type ==> $type');
  if (type?.isEmpty??true) {
    initlalRoute = MyConstant.routeUser;
    runApp(MyApp());
  } else {
    switch (type) {
      case 'S' :
        initlalRoute = MyConstant.routeStdServer; 
        runApp(MyApp());
        break;
      case 'D' :
        initlalRoute = MyConstant.routeDriverServer; 
        runApp(MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
