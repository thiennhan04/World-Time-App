import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'America/Cayenne', location: 'London', flag: 'greece.png'),
    WorldTime(url: 'America/Chicago', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Cairo', flag: 'greece.png'),
    WorldTime(url: 'Asia/Bishkek', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Ho_Chi_Minh', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Hovd', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    print("-----------${instance.url}");
    await instance.getTime();
    print("-----------${instance.time}");
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDayTime,
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
    centerTitle: true,
    elevation: 0,
    ),
      body: ListView.builder(
          itemCount:locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          },
      ),
    );
  }
}
