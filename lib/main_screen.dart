import 'package:calorie_tracker/final_screen.dart';
import 'package:flutter/material.dart';

Gender? _gender = Gender.Male;
String dropdownValue = 'Basal Metabolic Rate (BMR)';
TextEditingController enterAge = new TextEditingController();
TextEditingController enterHeight = new TextEditingController();
TextEditingController enterWeight = new TextEditingController();
String sAge = "";
String sHeight = "";
String sWeight = "";
double BMR = 0;
double calories = 0;
int age = 0;
int height = 0;
int weight = 0;
bool isMale = true;
bool isFemale = false;
bool isBMR = false;
bool isSedentary = false;
bool isLight = false;
bool isModerate = false;
bool isActive = false;
bool isVeryActive = false;
bool isExtraActive = false;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

enum Gender { Male, Female }

class _MainScreenState extends State<MainScreen> {
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
                Row(
                  children: [
                    Text(
                      "Select Your Gender",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                ListTile(
                  title: const Text('Male'),
                  leading: Radio<Gender>(
                    value: Gender.Male,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        isMale = true;
                        isFemale = false;
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio<Gender>(
                    value: Gender.Female,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        isMale = false;
                        isFemale = true;
                        _gender = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Input your age: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  controller: enterAge,
                  // maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your age",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Input your Height in cm: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  controller: enterHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your height in cm",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Input your Weight in kg: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  controller: enterWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your weight in kg",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Select your Activity:  ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Basal Metabolic Rate (BMR)',
                    'Sedentary (Little or No Exercise)',
                    'Light (1-3 times exercise/week)',
                    'Moderate (4-5 times exercise/week)',
                    'Active (daily exercise)',
                    'Very Active (intense daily exercise)',
                    'Extra Active (very intense daily exercise)',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: Text('Proceed'),
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
                      sAge = enterAge.text;
                      sWeight = enterWeight.text;
                      sHeight = enterHeight.text;
                      age = int.parse(sAge);
                      weight = int.parse(sWeight);
                      height = int.parse(sHeight);
                    });

                    if (isMale) {
                      setState(() {
                        BMR = 88.362 +
                            (13.397 * weight) +
                            (4.799 * height) -
                            (5.677 * age);
                      });
                      if (dropdownValue.length == 33) {
                        setState(() {
                          calories = BMR * 1.2;
                        });
                      } else if (dropdownValue.length == 31) {
                        setState(() {
                          calories = BMR * 1.375;
                        });
                      } else if (dropdownValue.length == 34) {
                        setState(() {
                          calories = BMR * 1.464;
                        });
                      } else if (dropdownValue.length == 23) {
                        setState(() {
                          calories = BMR * 1.55;
                        });
                      } else if (dropdownValue.length == 36) {
                        setState(() {
                          calories = BMR * 1.724;
                        });
                      } else if (dropdownValue.length == 42) {
                        setState(() {
                          calories = BMR * 1.899;
                        });
                      }
                    }
                    if (isFemale) {
                      setState(() {
                        BMR = 447.593 +
                            (9.247 * weight) +
                            (3.098 * height) -
                            (4.330 * age);
                      });
                      if (dropdownValue.length == 33) {
                        setState(() {
                          calories = BMR * 1.2;
                        });
                      } else if (dropdownValue.length == 31) {
                        setState(() {
                          calories = BMR * 1.375;
                        });
                      } else if (dropdownValue.length == 34) {
                        setState(() {
                          calories = BMR * 1.464;
                        });
                      } else if (dropdownValue.length == 23) {
                        setState(() {
                          calories = BMR * 1.55;
                        });
                      } else if (dropdownValue.length == 36) {
                        setState(() {
                          calories = BMR * 1.724;
                        });
                      } else if (dropdownValue.length == 42) {
                        setState(() {
                          calories = BMR * 1.899;
                        });
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FinalScreen()),
                    );
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
