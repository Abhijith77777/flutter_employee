// ignore_for_file: dead_code

import 'dart:convert';

import 'package:employeedirectory/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EmployeeDetails extends StatefulWidget {
  Map employee;
  EmployeeDetails({required this.employee});

  

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState(employee: employee);
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  Map employee; 
  _EmployeeDetailsState({required this.employee});

  @override
  Widget build(BuildContext context) {

    print(employee);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Employee Details')),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              color: appBarColor,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: Container(
                      height: screenHeight * 0.15,
                      width: screenHeight *0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenHeight * 0.1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.015),
                        child: Image(
                          image: NetworkImage(employee['profile_image'])
                        ),
                      )
                    )
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: Text(
                      employee['name'] ?? "Not available",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    child: Text(
                      employee['company']['name'] ?? "Not AVailable",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                      ),
                    )
                  ),
                  
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.01),
                      Center(
                        child: Text(
                          "Details",
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.05),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "User Name : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    employee['username'] ?? "Not available",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: Text(
                                      employee['email'] ?? "Not available",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.7,
                                    child: Text(
                                      employee['phone'] ?? "Not available",
                                      style: TextStyle(
                                        color: blackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Website : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    employee['website'] ?? "Not available",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        employee['address']['street'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        employee['address']['suite'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        employee['address']['city'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),Text(
                                        employee['address']['zipcode'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Company : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        employee['company']['name'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        employee['company']['catchPhrase'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        employee['company']['bs'] ?? "Not available",
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}