import 'package:bear_prj/pages/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:bear_prj/classes/database.dart';


class TrainingsListPage extends StatefulWidget {
  @override
  _TrainingsListPageState createState() => _TrainingsListPageState();
}

class _TrainingsListPageState extends State<TrainingsListPage> {
  Database _database;

  Future<List<Workout>> _loadWorkouts() async{
    await DatabaseFileRoutines().readWorkouts().then((journalsJson) {
      _database = DatabaseFileRoutines().databaseFromJson(journalsJson);
      _database.workouts.sort((comp1, comp2) => comp2.name.compareTo(comp1.name));
    });
    return _database.workouts;
  }

  void _addOrEditWorkout({bool add, int index, Workout journal}) async {
    WorkoutEdit _workoutEdit = WorkoutEdit(action: '', workout: journal);
    _workoutEdit = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          add: add,
          index: index,
          workoutEdit: _workoutEdit,
        ),
        fullscreenDialog: true
      ),
    );
    switch (_workoutEdit.action) {
      case 'Save':
        if (add) {
          setState(() {
            _database.workouts.add(_workoutEdit.workout);
          });
        } else {
          setState(() {
            _database.workouts[index] = _workoutEdit.workout;
          });
        }
        DatabaseFileRoutines().writeWorkouts(DatabaseFileRoutines().databaseToJson(_database));
        break;
      case 'Cancel':
        break;
      default:
        break;
    }
  }

  void _openWorkoutPage({BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => WorkoutPage() 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 5,),
                    Icon(Icons.add, color: Colors.white,),
                    Spacer(flex: 1,),
                    Text("Create empty Workout", style: Theme.of(context).textTheme.body1,),
                    Spacer(flex: 5,)
                  ],
                ),
                onPressed: () => _openWorkoutPage(context: context, fullscreenDialog: false),
              ),
              Divider(color: Colors.grey[400],),
            ],
          ),
        ),
      )
    );
  }
}