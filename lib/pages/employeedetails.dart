// ignore_for_file: dead_code

import 'package:employeedirectory/themes/colors.dart';
import 'package:flutter/material.dart';


class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({ Key? key }) : super(key: key);

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Repository Details')),
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
                          image: AssetImage("assets/images/image.png")
                        ),
                      )
                    )
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: Text(
                      // name ?? "Not available",
                      "Name",
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
                      "Company Name"
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
                                    "Name : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    // fullName ?? "Not available",
                                    "FullName",
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
                                    "Description : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: Text(
                                      // details ?? "Not available",
                                      "Details",
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
                                    "URL : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.7,
                                    child: Text(
                                      // url ?? "Not available",
                                      "URLsfs",
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
                                    "Language : ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    // language ?? "Not available",
                                    "Language",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                    ),
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