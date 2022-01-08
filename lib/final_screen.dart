import 'package:calorie_tracker/main_screen.dart';
import 'package:flutter/material.dart';

TextEditingController enterCalories = new TextEditingController();
TextEditingController enterFood = new TextEditingController();
String sEnterCalories = "";
int ienterCalories = 0;
int finalCalories = 0;
String sfinalCalories = finalCalories.toString();
int iBMR = BMR.toInt();
String sBMR = iBMR.toString();
int iCalories = calories.toInt();
String sCalories = iCalories.toString();
bool isVisible = false;

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

enum Gender { Male, Female }

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calorie Tracker",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Your BMR: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sBMR + " Calories/day",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Daily Calories Required : ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sCalories + " Calories/day",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Activity: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$dropdownValue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Name of Food: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  controller: enterFood,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Name of Food",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Amount of Calories: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  controller: enterCalories,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Calories of the Food",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Calories Required : ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Text(
                        sfinalCalories + " Calories",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                  child: Text('Calculate'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.deepPurple,
                      onSurface: Colors.grey,
                      textStyle: TextStyle(fontSize: 18),
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  onPressed: () {
                    setState(() {
                      sEnterCalories = enterCalories.text;
                      ienterCalories = int.parse(sEnterCalories);
                      finalCalories = iCalories - ienterCalories;
                      sfinalCalories = finalCalories.toString();
                      isVisible = true;
                    });
                    setState(() {
                      enterAge.clear();
                      enterHeight.clear();
                      enterWeight.clear();
                      sAge = "";
                      sHeight = "";
                      sWeight = "";
                      BMR = 0;
                      calories = 0;
                      age = 0;
                      height = 0;
                      weight = 0;
                      isMale = true;
                      isFemale = false;
                      bool isBMR = false;
                      isSedentary = false;
                      isLight = false;
                      isModerate = false;
                      isActive = false;
                      isVeryActive = false;
                      isExtraActive = false;
                      enterCalories.clear();
                      enterFood.clear();
                      String sEnterCalories = "";
                      int ienterCalories = 0;
                      int finalCalories = 0;
                      String sfinalCalories = "";
                      int iBMR = 0;
                      String sBMR = "";
                      int iCalories = 0;
                      String sCalories = "";
                      bool isVisible = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
