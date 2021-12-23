import 'package:flutter/material.dart';

class ShowProgress extends StatefulWidget {
  const ShowProgress({ Key? key }) : super(key: key);

  @override
  _ShowProgressState createState() => _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        
      ),
    );
  }
}