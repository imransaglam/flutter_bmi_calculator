import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatefulWidget {
  final String note;
  final String photo;
  final double result;
  Result({required this.note,required this.result,required this.photo});
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(left:15,right:15),
        child: Column(
          children: [
            SizedBox(height:100),
            Container(
              width: 500,
              height: 450,
              decoration: BoxDecoration(
                color:Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Your BMI is",style: TextStyle(color:Color(0xff383838),fontSize:30,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("${widget.result.toStringAsFixed(1)}",style: TextStyle(color:Color(0xff51C797),fontSize:40,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("${widget.note}",style: TextStyle(color:Color(0xff383838),fontSize:20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 40,),
                    Container(width:200,
                    height: 200, 
                    child: Image.asset(widget.photo,fit: BoxFit.cover,)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 150),
            GestureDetector(
              onTap: (() {
                setState(() {
                  Navigator.pop(context);
                });
              }),
              child: Container(
                    padding: EdgeInsets.only(top: 5, left: 140),
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff468FF8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.rotate_left_rounded,color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(
                          "Start over",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),     
                        ),
                      ],
                    ),
                  ),
            ),   
          ],
        )),
      ),
    );
  }
}