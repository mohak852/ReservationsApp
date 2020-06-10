import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/model/db_helper.dart';
import 'package:login_app/model/model.dart';
import 'package:login_app/service/Textfield.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'Dashboard_page.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {

  TextEditingController _username = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dateTime = TextEditingController();

  Widget _userName() {
    return  BeautyTextfield(
      controller: _username,
      width: double.maxFinite, //REQUIRED
      height: 60, //REQUIRED
      accentColor: Colors.white, // On Focus Color
      textColor: Colors.purple, //Text Color
      backgroundColor: Colors.deepPurple, //Not Focused Color
      textBaseline: TextBaseline.alphabetic,
      autocorrect: false,
      autofocus: false,
      enabled: true, // Textfield enabled
      focusNode: FocusNode(),
      fontFamily: 'Righteous', //Text Fontfamily
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w200,
      minLines: 1,
      maxLines: 2,
      wordSpacing: 2,
      margin: EdgeInsets.all(10),
      cornerRadius: BorderRadius.all(Radius.circular(15)),
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text, //REQUIRED
      placeholder: "Enter your Username",
      isShadow: true,
      obscureText: false,
      prefixIcon: Icon(Icons.accessibility), //REQUIRED
      suffixIcon: Icon(Icons.remove_red_eye),
      onClickSuffix: () {

      },
      onTap: () {
        print('Click');
      },
    );
  }
  Widget _MobileNumber(){
    return  BeautyTextfield(
      controller: _phonenumber,
      width: double.maxFinite, //REQUIRED
      height: 60, //REQUIRED
      accentColor: Colors.white, // On Focus Color
      textColor: Colors.purple, //Text Color
      backgroundColor: Colors.deepPurple, //Not Focused Color
      textBaseline: TextBaseline.alphabetic,
      autocorrect: false,
      autofocus: false,
      enabled: true, // Textfield enabled
      focusNode: FocusNode(),
      fontFamily: 'Righteous', //Text Fontfamily
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w200,
      minLines: 1,
      maxLines: 2,
      wordSpacing: 2,
      margin: EdgeInsets.all(10),
      cornerRadius: BorderRadius.all(Radius.circular(15)),
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text, //REQUIRED
      placeholder: "+91 12345-67891",
      isShadow: true,
      obscureText: false,
      prefixIcon: Icon(MaterialIcons.phone), //REQUIRED
      suffixIcon: Icon(Icons.remove_red_eye),
      onClickSuffix: () {

      },
      onTap: () {
        print('Click');
      },

    );
  }

  Widget _emailId(){
    return  BeautyTextfield(
      controller: _email,
      width: double.maxFinite, //REQUIRED
      height: 60, //REQUIRED
      accentColor: Colors.white, // On Focus Color
      textColor: Colors.purple, //Text Color
      backgroundColor: Colors.deepPurple, //Not Focused Color
      textBaseline: TextBaseline.alphabetic,
      autocorrect: false,
      autofocus: false,
      enabled: true, // Textfield enabled
      focusNode: FocusNode(),
      fontFamily: 'Righteous', //Text Fontfamily
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w200,
      minLines: 1,
      maxLines: 2,
      wordSpacing: 2,
      margin: EdgeInsets.all(10),
      cornerRadius: BorderRadius.all(Radius.circular(15)),
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text, //REQUIRED
      placeholder: "Enter your Email",
      isShadow: true,
      obscureText: false,
      prefixIcon: Icon(MaterialIcons.email), //REQUIRED
      suffixIcon: Icon(Icons.remove_red_eye),
      onClickSuffix: () {},
      onTap: () {
        print('Click');
      },

    );
  }
  var myFormat = DateFormat('d-MM-yyyy');
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  Widget _datePicker(){
    return  BeautyTextfield(
      controller: _dateTime,
      width: double.maxFinite, //REQUIRED
      height: 60, //REQUIRED
      accentColor: Colors.white, // On Focus Color
      textColor: Colors.purple, //Text Color
      backgroundColor: Colors.deepPurple, //Not Focused Color
      textBaseline: TextBaseline.alphabetic,
      autocorrect: false,
      autofocus: false,
      enabled: true, // Textfield enabled
      focusNode: FocusNode(),
      fontFamily: 'Righteous', //Text Fontfamily
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w200,
      minLines: 1,
      maxLines: 2,
      wordSpacing: 2,
      margin: EdgeInsets.all(10),
      cornerRadius: BorderRadius.all(Radius.circular(15)),
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text, //REQUIRED
      placeholder: "${DateTime.now()}",
      isShadow: true,
      obscureText: false,
      prefixIcon: Icon(Icons.calendar_today), //REQUIRED
      suffixIcon: Icon(Icons.remove_red_eye),
      onClickSuffix: () {
        _selectDate(context);
      },
      onTap: () {
        _selectDate(context);
      },

    );
  }
  Widget _saveButton(){
    return Container(
      height: 50.0,
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                _saveButtonClk();
                print("Save button Presed");
              },
              child: Text("Save",style: TextStyle(
                  fontFamily: 'DMMono',
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 25.0
              ),),
            ),
          ],
        ),
      ),
    );
  }
  final dbHelper = DatabaseHelper.instance;

  void _saveButtonClk() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: _username.text,
      DatabaseHelper.columnMobileNumber: _phonenumber.text,
      DatabaseHelper.columnEmailId: _email.text,
      DatabaseHelper.columnDOB: DateFormat("yyyy-MM-dd hh:mm:ss").format(selectedDate),
    };
    print(_username.text);
    final id = await dbHelper.insert(row);
    print(DateFormat("dd-MM-yyyy").format(selectedDate));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>DashboardPage()));
    print("Inserted Record id: $id");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
          Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "New", style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      )),
                      TextSpan(text: "\n"),
                      TextSpan(text: "Registration", style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.1,
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.all(10.0),
                height: 500.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black38,
//                spreadRadius: 10.0,
                    offset: Offset(5, -5)
                  )],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                  _userName(),
                  _MobileNumber(),
                  _emailId(),
                  _datePicker(),
                  SizedBox(height: 10.0,),
                  _saveButton(),
                  ],
                ),
              ),
            ],
          ),
        )
          ],
      ),
    ),
      ),
    );
  }
}