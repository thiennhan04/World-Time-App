import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listviewbuilder/page/choose_location.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String time = "";
  String location = "";
  // @override
  // void initState() {
  //   super.initState();
  //   text = "pass 1";
  // }
  @override
  Widget build(BuildContext context) {
    String x1 = "";
    //note chỗ này về nhà sợt
    data=ModalRoute.of(context)?.settings?.arguments as Map;
    // print(data);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                        time = data['time'];
                        location = data['location'];
                      });
                    }
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                      'Edit Location'
                  )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    location == "" ? data['location'] : location,
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0
                    ),
                  ),
                ],
              ),
              Text(
                location == "" ? data['time'] : time,
                style: TextStyle(
                  fontSize: 66.0,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
