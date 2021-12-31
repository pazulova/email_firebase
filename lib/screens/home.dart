
// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'package:email_firebase/domain/workouts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text('MaxFit'), leading: const Icon(Icons.fitness_center),
      ),
      body: WorkOutesList(),
        ),
    );
  }
}

class WorkOutesList extends StatelessWidget {
 final workouts = <Workout>[
   Workout(title: 'Text1',outhor: 'Max1', description: 'Test Workout1', level: 'Beginner'),
   Workout(title: 'Text2',outhor: 'Max2', description: 'Test Workout2', level: 'Intermediate'),
   Workout(title: 'Text3',outhor: 'Max3', description: 'Test Workout3', level: 'Advenced'),
   Workout(title: 'Text4',outhor: 'Max4', description: 'Test Workout4', level: 'Beginner'),
   Workout(title: 'Text5',outhor: 'Max5', description: 'Test Workout5', level: 'Intermediate'),
 ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i){
          return Card(
            elevation: 2.0,
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Container(
              decoration: const BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
              
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: Container(padding: const EdgeInsets.only(right: 12),
                child: Icon(Icons.fitness_center,
                color: Theme.of(context).textTheme.headline6.color
                ),
                decoration: const BoxDecoration(
                  border: const Border(right: BorderSide(width: 5, color: Colors.white24))
                ),
                ),
                title: Text(workouts[i].title, 
                style: TextStyle(color: Theme.of(context).textTheme.headline6.color
                ),
               ),
               // ignore: prefer_const_constructors
               trailing: Icon(Icons.keyboard_arrow_right),
               subtitle: subtitle(context, workouts[i]),
              ),
              ),
          );
        }
      )
      )
    );
  }
}
  subtitle(BuildContext context, Workout workout) {
    var color =Colors.grey;
    double indicatorLevel = 0;
    switch(workout.level){
case 'Beginner' :
color = Colors.green;
indicatorLevel = 0.33;
break;
case 'Intermediate' :
color = Colors.yellow;
indicatorLevel = 0.66;
break;
case 'Advanced' :
color = Colors.red;
indicatorLevel = 1;
break;

    }
return Row(
  children: <Widget>[
    Expanded(
      flex: 1,
      child: LinearProgressIndicator(
backgroundColor: Colors.white,
value: indicatorLevel,
valueColor: AlwaysStoppedAnimation(color),
      ),
      ),
      const SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(workout.level,))
  ],
  );
  }

