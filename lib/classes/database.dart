import 'dart:io'; // Used by File
import 'dart:convert'; // Used by json

import 'package:path_provider/path_provider.dart'; // Filesystem locations

class DatabaseFileRoutines {
  // get device document directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // gets the local file needed
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  // checks if the file exits
  // if no, create a new file
  // then read the file
  Future<String> readWorkouts() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeWorkouts('{"workouts": []}');
      }
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("error readTrainings: $e");
      return "";
    }
  }

  // creates a new file and writes to it
  Future<File> writeWorkouts(String json) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$json');
  }

  // To read and parse from JSON data - databaseFromJson(jsonString);
  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  // To save and parse to JSON Data - databaseToJson(jsonString);
  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}

class Database {
  List<Workout> workouts;

  Database({
    this.workouts,
  });

  // retrieve and map the JSON objects to a List of exercises
  factory Database.fromJson(Map<String, dynamic> json) => Database(
        workouts: List<Workout>.from(
          json["workout"].map(
            (x) => Workout.fromJson(x),
          ),
        ),
      );

  // convert list of exercises to json
  Map<String, dynamic> toJson() => {
        "workout": List<dynamic>.from(
          workouts.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Workout {
  String id;
  String name;
  List<Exercise> exercises;

  Workout({
    this.id,
    this.name,
    this.exercises,
  });

  // retrieve and convert the JSON object to a exercise class
  factory Workout.fromJson(Map<String, dynamic> json) { 
    var list = json["exercises"] as List;
    List<Exercise> exerciseList = list.map((e) => Exercise.fromJson(e)).toList();
    return Workout(
        id: json["id"],
        name: json["name"],
        exercises: exerciseList,
      );
  }

  //  convert the exercise class to a JSON object
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "exercises": exercises,
      };
}

class WorkoutEdit {
  String action;
  Workout workout;

  WorkoutEdit({this.action, this.workout});
}

class Exercise {
  String id;
  String name;
  String sets;

  Exercise({
    this.id,
    this.name,
    this.sets
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    name: json["name"],
    sets: json["sets"],
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sets": sets,
      };
}