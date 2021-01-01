import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationSms  = "";
  void getCurrentLocation() async{
  var position  = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  var lastPosition  = await Geolocator.getLastKnownPosition();
  print(lastPosition);
  
  setState(() {
    locationSms = "$position.latitude, $position.longitude";
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocationSend"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Get user Location",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: (){
                getCurrentLocation();
              },
              child: Text("Get Current Location"),
            )
          ],
        ),
      ),
    );
  }
}
