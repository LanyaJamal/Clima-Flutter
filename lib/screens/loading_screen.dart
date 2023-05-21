// import 'dart:convert';
// import 'dart:developer';
// import 'dart:html';

// import 'package:clima/Location.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:clima/Location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const APiKey = "d1b45fdd28649f7cdba46647cfc79036";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void GetLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtide);
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.low);
    // print(position);
  }

  void getPer() async {
    LocationPermission permission = await Geolocator.requestPermission();
    // print(permission.name);
  }

  @override
  void initState() {
    getPer();
    getdata();
    super.initState();
  }

  void getdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=d1b45fdd28649f7cdba46647cfc79036'));

    //  print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);
      double teampriture = decodedata['main']['temp'];
      int condition = decodedata["weather"][0]["id"];
      String cityname = decodedata["name"];
      print(teampriture);
      print(condition);
      print(cityname);

      // var longtuide = jsonDecode(data)['coord']['lon'];
      // inspect(longtuide);

      // var WeatherDescription = jsonDecode(data)["weather"][0]["main"];
      //  weather[0].main
      // inspect(WeatherDescription);

/*
  var data = jsonDecode(response.body);
      inspect(data);
      */
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    // getPer();
    // GetLocation();
    getdata();
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: () {
            getdata();
            // GetLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
