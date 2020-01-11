import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/providers/weather_provider.dart';
import 'package:wather_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
          backgroundColor: Color(0xfff2274A5),
        ),
        body: SafeArea(
          child: Consumer<WeatherProvider>(builder: (context, model, child) {
            return model.allData == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            child: Container(
                              color: Color(0xfff2274A5),
                              height: 300.0,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    model.allData.location.region,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    '${model.allData.current.temperature}°',
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                  Text(
                                    model
                                        .allData.current.weatherDescriptions[0],
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                            clipper: MyClipper(),
                          ),
                          Positioned(
                            left: 100.0,
                            right: 100.0,
                            top: 10.0,
                            child: Image.network(
                              model.allData.current.isDay == 'yes'
                                  ? 'http://icon-park.com/imagefiles/simple_weather_icons_sunny.png'
                                  : 'https://dejpknyizje2n.cloudfront.net/marketplace/products/crescent-moon-icon-sticker-1544043862.2615688.png',
                              height: 50.0,
                            ),
                          )
                        ],
                      ),
                      infoWidget('humidity.png', 'Humidity',
                          '${model.allData.current.humidity}%'),
                      Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                      ),
                      infoWidget('wind.png', 'Wind speed',
                          '${model.allData.current.windSpeed} k/h'),
                      Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                      ),
                      infoWidget('wind-dir.png', 'Wind direction',
                          model.allData.current.windDir),
                      Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                      ),
                      infoWidget('cloud.png', 'Cloud cover',
                          '${model.allData.current.cloudcover}%'),
                      Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                      ),
                      infoWidget('prus.png', 'Pressure',
                          '${model.allData.current.pressure} MB'),
                    ],
                  );
          }),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
