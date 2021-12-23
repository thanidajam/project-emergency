import 'package:cached_network_image/cached_network_image.dart';
import 'package:emer_projectnew/models/firstaid_model.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:flutter/material.dart';

class ShowAidpagefull extends StatefulWidget {
  final FirstaidModel? firstaidModel;
  const ShowAidpagefull({Key? key, this.firstaidModel}) : super(key: key);

  @override
  _ShowAidpagefullState createState() => _ShowAidpagefullState();
}

class _ShowAidpagefullState extends State<ShowAidpagefull> {
  FirstaidModel? firstaidModel;
  List<String> pathImage = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstaidModel = widget.firstaidModel;
    //print('## image from mySQL ==> ${firstaidModel!.Media}');
    convertStringToArray();
  }

  void convertStringToArray() {
    String string = firstaidModel!.Media;
    //string = string.substring(1, string.length -1);
    List<String> strings = string.split(',');
    for (var item in strings) {
      pathImage.add(item.trim());
    }
    print('## pathImage ==> $pathImage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstaidModel!.Title),
        backgroundColor: MyConstant.bg2,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [buildImage(constraints), 
                         buildText()],
            ),
          ),
        ),
      ),
    );
  }

  Container buildText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ShowTitle(
            title: '${firstaidModel!.Text}', textStyle: MyConstant().h8Style()),
      ),
    );
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: constraints.maxWidth * 0.5,
            padding: EdgeInsets.only(top: 20),
            child: CachedNetworkImage(
              imageUrl:
                  '${MyConstant.domain}/emer_projectnew/assets/pic/firstaid/${firstaidModel!.Media}',
              placeholder: (context, url) => ShowProgress(),
            ),
          ),
        ],
      ),
    );
  }
}
