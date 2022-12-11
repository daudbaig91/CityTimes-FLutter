import 'package:flutter/material.dart';
import 'package:testapp/servcies/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";
  void setTime() async{
    WorldTime data = WorldTime(location: "Berlin", flag:"germany.png", url:"Europe/Berlin");
    await data.getData();
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, "/home",arguments:{
      "location" : data,
    });
  }

  @override
  void initState(){
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child : SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

