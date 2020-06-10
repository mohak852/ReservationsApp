import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/model/db_helper.dart';
import 'package:sqflite/sqflite.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final dbHelper = DatabaseHelper.instance;
  List weightList = [];
  String currWeightUnit = " kg";
  @override
  void initState() {
    initPrefs();
    super.initState();
  }
  TextEditingController _alertDialog = TextEditingController();
  void initPrefs() async {
    weightList = await dbHelper.queryAllRows();
    print(weightList);
    print(weightList.length);
    setState(() {});
  }
  showAlertDialog1(BuildContext context,indice) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _updateName(indice);
        setState(() {
          updateList();
          Navigator.of(context).pushReplacementNamed('/HistoryPage');
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update Fields"),
      content: TextField(
        controller: _alertDialog,
      ),
      actions: <Widget>[
        okButton

      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialog2(BuildContext context,indice) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _updateEmail(indice);
        setState(() {
          updateList();
          Navigator.of(context).pushReplacementNamed('/HistoryPage');
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update Fields"),
      content: TextField(
        controller: _alertDialog,
      ),
      actions: <Widget>[
        okButton
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialog3(BuildContext context,indice) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _updatephoneNumber(indice);
        setState(() {
          updateList();
          Navigator.of(context).pushReplacementNamed('/HistoryPage');
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update Fields"),
      content: TextField(
        controller: _alertDialog,
      ),
      actions: <Widget>[
        okButton
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialog4(BuildContext context,indice) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _updatedate(indice);
        setState(() {
          updateList();
          Navigator.of(context).pushReplacementNamed('/HistoryPage');
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update Fields"),
      content: TextField(
        controller: _alertDialog,
        decoration: InputDecoration(
          hintText: "DD-MM-YYYY",

        ),
      ),
      actions: <Widget>[
        okButton

      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  _updateName(indice) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : _alertDialog.text
    };
    // We'll update the first row just as an example
    int id = weightList[indice]["_id"];
    // do the update and get the number of affected rows
    int updateCount = await db.update(
        DatabaseHelper.table,
        row,
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [id]);
    // show the results: print all rows in the db
    print(await db.query(DatabaseHelper.table));
    print(updateCount);
  }
  _updatephoneNumber(indice) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnMobileNumber : _alertDialog.text
    };
    // We'll update the first row just as an example
    int id = weightList[indice]["_id"];
    // do the update and get the number of affected rows
    int updateCount = await db.update(
        DatabaseHelper.table,
        row,
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [id]);
    // show the results: print all rows in the db
    print(await db.query(DatabaseHelper.table));
    print(updateCount);
  }
  _updateEmail(indice) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnEmailId : _alertDialog.text
    };
    // We'll update the first row just as an example
    int id = weightList[indice]["_id"];
    // do the update and get the number of affected rows
    int updateCount = await db.update(
        DatabaseHelper.table,
        row,
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [id]);
    // show the results: print all rows in the db
    print(await db.query(DatabaseHelper.table));
    print(updateCount);
  }
  _updatedate(indice) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnDOB : _alertDialog.text
    };
    // We'll update the first row just as an example
    int id = weightList[indice]["_id"];
    // do the update and get the number of affected rows
    int updateCount = await db.update(
        DatabaseHelper.table,
        row,
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [id]);
    // show the results: print all rows in the db
    print(await db.query(DatabaseHelper.table));
    print(updateCount);
  }
  void updateList() async {
    weightList = await dbHelper.queryAllRows();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        padding: EdgeInsets.only(top: 50.0,left: 10.0,right: 10.0,bottom: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weightList.length,
          itemBuilder: (BuildContext context, indice) {
            DateTime parsedTime = DateTime.parse(weightList[indice]["dob"]);
            String name = weightList[indice]["name"].toString();
            String email = weightList[indice]["email"].toString();
            String mobile = weightList[indice]["mob"].toString();
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 3),
                      spreadRadius: 2.0,
                    )],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Username: " + name,style: TextStyle(
                            fontFamily: 'DMMono',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),),
                          SizedBox(width: 190.0,),
                          GestureDetector(
                            onTap: (){
                              showAlertDialog1(context, indice);
                            },
                              child: Icon(Icons.edit,color: Colors.white,),),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: <Widget>[
                          Text("Email: " + email,style: TextStyle(
                            fontFamily: 'DMMono',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),),
                          SizedBox(width: 106.0,),
                          GestureDetector(
                            onTap: (){
                              showAlertDialog2(context, indice);
                            },
                            child: Icon(Icons.edit,color: Colors.white,),),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: <Widget>[
                          Text("Mobile: +" + mobile,style: TextStyle(
                            fontFamily: 'DMMono',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),),
                          SizedBox(width: 140.0,),
                          GestureDetector(
                            onTap: (){
                              showAlertDialog3(context, indice);
                            },
                            child: Icon(Icons.edit,color: Colors.white,),),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: <Widget>[
                          Text("Date Of Birth: " + DateFormat("dd-MM-yyyy").format(parsedTime),style: TextStyle(
                            fontFamily: 'DMMono',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),),
                          SizedBox(width: 148.0,),
                          GestureDetector(
                            onTap: (){
                              showAlertDialog4(context, indice);
                            },
                            child: Icon(Icons.edit,color: Colors.white,),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () async {
                                print("Deleted item successfully:  ${weightList[indice]['_id'].toString()}");
                                int rowsDeleted = await dbHelper.delete(weightList[indice]['_id']);
                                // print("deleted $rowsDeleted row(s): row ${log['_id']}");
                                print("Deleted item successfully:");
                                setState(() {
                                  updateList();
                                });
                              },
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
              ],
            );
          },
        ),
      ),
    );
  }
}
