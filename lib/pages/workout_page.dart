import 'package:bear_prj/classes/database.dart';
import 'package:bear_prj/widgets/custom_text_fields.dart';
import 'package:bear_prj/widgets/exercise_widget.dart';
import 'package:flutter/material.dart';

 
class WorkoutPage extends StatefulWidget {
  final bool add;
  final int index;
  final WorkoutEdit workoutEdit;

  const WorkoutPage({Key key, this.add, this.index, this.workoutEdit})
    : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  WorkoutEdit _workoutEdit;
  int _excercises;
  double _height;
  String _title;

  @override
  void initState() { 
    super.initState();
    _excercises = 1;
    _height =60 + _excercises.toDouble() * 300;
    _title = widget.add ? 'Add' : 'Edit';
    _workoutEdit = WorkoutEdit(action: 'Cancel', workout: widget.workoutEdit.workout);
    _workoutEdit.workout = widget.workoutEdit.workout;
  }

  void addExerciese(){
    setState(() {
      _excercises += 1;
      _height += 200;
    });
  }

  void addSet(){
      setState(() {
        _height += 60;
      });
    }

  void removeExerciese(){
    setState(() {
      if (_excercises < 0){
        _excercises -= 1;
        _height = _excercises.toDouble() * 300;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _height,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFieldWithoutBorder(hintText: "My Workout Routine", fontSize: 24,),
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _excercises,
                    itemBuilder: (context, index) {
                      return ExerciseWidget(parentHeight: addSet,);
                    },
                  )
                ),
                FlatButton(
                  onPressed: () => addExerciese(),
                  child: Text("Add excersice", style: TextStyle(color: Colors.white, fontSize: 18.0))
                ),
                FlatButton(
                  onPressed: () => removeExerciese(),
                  child: Text("Remove excersice", style: TextStyle(color: Colors.white))
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

