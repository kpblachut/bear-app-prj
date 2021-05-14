import 'package:bear_prj/widgets/custom_text_fields.dart';
import 'package:bear_prj/widgets/single_rep_list_tile.dart';
import 'package:flutter/material.dart';

class ExerciseWidget extends StatefulWidget {
  const ExerciseWidget({Key key, this.parentHeight}) : super(key: key);

  final Function() parentHeight;

  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  int _sets;
  double _height;
  
  
    @override
    void initState() { 
      super.initState();
      _sets = 2;
      _height = 71 + (_sets.toDouble() * 60);
    }
  
    void addSet(){
      setState(() {
        _sets += 1;
        _height = 71 + (_sets.toDouble() * 60);
        widget.parentHeight();
      });
    }
  
    void removeSet(){
      setState(() {
        if (_sets > 1){
          _sets -= 1;
          _height = 71 + (_sets.toDouble() * 60);
        }
      });
    }
  
    @override
    Widget build(BuildContext context) {
      return Container(
        height: _height,
        child: Card(
          elevation: 0,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CustomTextFieldWithoutBorder(hintText: "Exercise name", fontSize: 20,),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _sets,
                  itemBuilder: (context, index) {
                    if (index == 0){
                      return ExerciseLabelRow();
                    }
                    return SingleSetListTile(index: index); 
                  }
                ),
              ),
              FlatButton(
                child: Center(child: Text("Add set", style: TextStyle(color: Colors.white, fontSize: 18.0),),),
                onPressed: () => addSet(),
              ),
              // Remove set Button currently no used
              // FlatButton(
              //   child: Center(child: Text("Remove set", style: TextStyle(color: Colors.white),),),
              //   onPressed: () => removeSet(),
              // )
            ],
          ),
        ),
      );
    }
  }
  
  class _WorkoutPageState {
}

class ExerciseLabelRow extends StatelessWidget {
  const ExerciseLabelRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Text('Set', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
        ),
        Spacer(flex: 1,),
        Flexible(
          flex: 4,
          child: Text('Weight', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
        ),
        Spacer(flex: 1,),
        Flexible(
          flex: 4,
          child: Text('Repetitions', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
        ),
        Spacer(flex: 2,),
      ],
    );
  }
}