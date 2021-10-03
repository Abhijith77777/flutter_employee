import 'package:employeedirectory/pages/employeedetails.dart';
import 'package:employeedirectory/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

 @override
  void initState() {
    fetchData();
    super.initState();
  }

  List employee=[];

  Future<void> fetchData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString('data');

      if(data == null){
        fetchDataFromAPI();
      } else{
        setState(() {
          employee = json.decode(data);        
        });
      }

  }

  Future<void> fetchDataFromAPI() async {
    print("hi");
    String data;
    var url="http://www.mocky.io/v2/5d565297300000680030a986";
    var response= await http.get(Uri.parse(url));
    if(response.statusCode==200){
      data = response.body;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('data', data);
      setState(() {
        employee= json.decode(response.body);        
      });
      print(employee);
    }    
  }

  @override
  Widget build(BuildContext context) {
  //  double screenWidth = MediaQuery.of(context).size.width;
  //   double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Center(
          child: Text(
            "Employee Directory"
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){              
            },
          )
        ],
      ),
      body: employee == null || employee.isEmpty ?
        loadingWidget() :
        dataWidget()
    );
  }

  Widget loadingWidget(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget dataWidget(){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: employee.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeDetails()));
              },
              child: Card(
                child: ListTile(
                  title: Text(
                    employee[index]['name']
                  ),
                  subtitle:Text(
                    employee[index]['company'] == null || employee[index]['company']['name'] == null ?
                    "Not Available" :
                    employee[index]['company']['name'] 
                  ),
                  leading: employee[index]['profile_image'] == null ?
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/image.png'
                      ),
                    ),
                  ) : 
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        employee[index]['profile_image']
                      ),
                    ),
                  )
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}