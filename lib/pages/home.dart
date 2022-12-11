import 'package:flutter/material.dart';
import 'package:testapp/servcies/world_time.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  WorldTime wt = WorldTime(location: "", flag: "", url: "");
  @override
  Widget build(BuildContext context) {

    wt = wt.location!="" ? wt : (ModalRoute.of(context)!.settings.arguments as Map)["location"];
    print(wt.time.toString());

    String image = wt.isday ? "day.png" : "night.png";
    Color textColor = wt.isday ? Colors.indigo : Colors.greenAccent;
    return Scaffold(
      body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$image"),

            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 120,),
            TextButton.icon(
              label: Text("Edit Location"),
              onPressed: () async{
                dynamic result = await Navigator.pushNamed(context, "/location");
                setState(() {
                  wt = result;
                });
                },
              icon: Icon(Icons.location_city),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  wt.location,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              wt.time,
              style: TextStyle(
                color: textColor,
                fontSize: 66.0,
              ),
            ),
          ],
        ),
      ),

      ),
    );
  }
}
