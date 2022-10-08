import 'package:bmi_flutter_project/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String? _choosingGender;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _height = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  double _result = 0;
  String note = " ";
  String photo = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                "Let's Calculate",
                style: TextStyle(
                    color: Color(0xff6B6B6B),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "your current BMI",
                style: TextStyle(
                    color: Color(0xff6B6B6B),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),
              Text(
                "You can find out whether you are",
                style: TextStyle(
                    color: Color(0xffadadad),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "overweight,underweight or ideal weight.",
                style: TextStyle(
                    color: Color(0xffadadad),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _choosingGender = "Female";
                      });
                    },
                    child: Container(
                        width: 109,
                        height: 50,
                        padding: EdgeInsets.only(top: 15, left: 35),
                        decoration: BoxDecoration(
                            color: _choosingGender == "Female"
                                ? Color(0xff323335)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffE1E1E1))),
                        child: Text(
                          "Female",
                          style: TextStyle(
                              color: Color(0xff787878),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _choosingGender = "Male";
                      });
                    },
                    child: Container(
                        width: 109,
                        height: 50,
                        padding: EdgeInsets.only(top: 15, left: 45),
                        decoration: BoxDecoration(
                            color: _choosingGender == "Male"
                                ? Color(0xff323335)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffE1E1E1))),
                        child: Text(
                          "Male",
                          style: TextStyle(
                              color: Color(0xff787878),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _choosingGender = "Other";
                      });
                    },
                    child: Container(
                        width: 109,
                        height: 50,
                        padding: EdgeInsets.only(top: 15, left: 40),
                        decoration: BoxDecoration(
                            color: _choosingGender == "Other"
                                ? Color(0xff323335)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffE1E1E1))),
                        child: Text(
                          "Other",
                          style: TextStyle(
                              color: Color(0xff787878),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 40),
              TextFormField(
                 inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter your age";
                  } else {
                    return null;
                  }
                }),
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  labelText: "Age",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter your height";
                  } else if (double.parse(_height.text) <= 101 ||
                      double.parse(_height.text) >= 251) {
                    return "You should enter your height between 100 and 250  ";
                  } 
                  else {
                    return null;
                  }
                }),
                controller: _height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  labelText: "Height",
                  suffixText: "cm",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                 inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter your weight";
                  } else if (double.parse(_weight.text) <= 29 ||
                      double.parse(_weight.text) >= 251) {
                    return "You should enter your weight between 30 kg and 250 kg  ";
                  } else {
                    return null;
                  }
                }),
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  labelText: "Weight",
                  suffixText: "kg",
                ),
              ),
              SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: () {
                  if (formGlobalKey.currentState!.validate()) {
                    print("height değeri: " + _height.text);
                    print("weight değeri: " + _weight.text);

                    _result = double.parse(_weight.text) /
                        ((double.parse(_height.text) *
                            double.parse(_height.text))) *
                        10000;

                    print(" result değeri: " + _result.toString());
                    if (_result <= 18.5) {
                      note = "You are underweighted";
                      photo = "assets/underweighted.png";
                    } else if (_result > 18.6 && _result <= 24.9) {
                      note = "You are totaly fit";
                      photo = "assets/fit.png";
                    } else if (_result >= 25 && _result <= 29.9) {
                      note = "You are overweighted";
                      photo = "assets/overweighted.png";
                    } else if (_result >= 30 && _result <= 34.9) {
                      note = "You are obesed";
                      photo = "assets/obesity.png";
                    } else if (_result >= 35) {
                      note = "You are extremely obesed";
                      photo = "assets/extremlyobesed.png";
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Result(
                                photo: photo,
                                note: note.toString(),
                                result: _result.toDouble()))));
                    // use the information provided
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 120),
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff468FF8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
