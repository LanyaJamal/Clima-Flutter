import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const APiKey = "d1b45fdd28649f7cdba46647cfc79036";
const openWeatherMapUrl =
    'https://api.openweathermap.org/data/2.5/weather?lat=';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getPer() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherData,
      );
    }));
  }

  // void getdata() async {
  //   // get location
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.bestForNavigation,
  //   );

  //   print(position.latitude);
  //   print(position.longitude);

  //   // get weather by location
  //   http.Response response = await http.get(
  //     Uri.parse(
  //     '$openWeatherMapUrl ${position.latitude}&lon=${position.longitude}&appid=$APiKey&units=metric',
  //     ),
  //   );

  //   inspect(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var decodedata = jsonDecode(data);
  //     double teampriture = decodedata['main']['temp'];
  //     int condition = decodedata["weather"][0]["id"];
  //     String cityname = decodedata["name"];
  //     print(teampriture);
  //     print(condition);
  //     print(cityname);

  //     var longtuide = jsonDecode(data)['coord']['lon'];
  //     inspect(longtuide);

  //     var WeatherDescription = jsonDecode(data)["weather"][0]["main"];
  //    //  weather[0].main
  //     inspect(WeatherDescription);
  //     Navigator.push(context, MaterialPageRoute(builder: (context){
  //       return LocationScreen(locationweather: decodedata,);
  //     }));

  // // var data = jsonDecode(response.body);
  // //     inspect(data);

  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(
        size: 100,
        color: Colors.grey.shade400,
        ),
        // CupertinoButton(
        //   onPressed: () {
        //     ePrint("day");
        //     getdata();
        //   },
        //   child: Text('Get slaw'),
        // ),
      ),
    );
  }
}
