import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/HomePage/ModulePage.dart';
import 'package:FlutterAnimations/counting.dart';
import 'package:FlutterAnimations/dbprovider.dart';
import 'package:FlutterAnimations/drawpath.dart';
import 'package:FlutterAnimations/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'Auth/Login.dart';

class FeildDetails extends StatefulWidget {
  int text1;
  File path;
  String check;

  FeildDetails({Key key, @required this.text1, this.path, this.check}) : super(key: key);

  @override
  _FeildDetails createState() => _FeildDetails();
}

class _FeildDetails extends State<FeildDetails> {
  TextEditingController sowTime = TextEditingController();
  TextEditingController seedCropStatus = TextEditingController();
  TextEditingController adjoiningCrop = TextEditingController();
  TextEditingController earthization = TextEditingController();
  TextEditingController Isolation = TextEditingController();
  TextEditingController FarmLocation = TextEditingController();
  TextEditingController harvestDate = TextEditingController();

  TextEditingController cropStandard = TextEditingController();
  TextEditingController cropCondition = TextEditingController();
  TextEditingController areaInspected = TextEditingController();
  TextEditingController areaRejected = TextEditingController();
  TextEditingController netareaCertified = TextEditingController();
  TextEditingController canceledArea = TextEditingController();
  TextEditingController averageYield = TextEditingController();
  TextEditingController totalYield = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController offtype = TextEditingController();
  TextEditingController locp = TextEditingController();
  TextEditingController ows = TextEditingController();
  TextEditingController diseased = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController percentage = TextEditingController();
  TextEditingController total = TextEditingController();
  BorderRadius radius = BorderRadius.circular(20);
  final DbManager dbManager = new DbManager();
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  List<DataRow> _rowList = [];
  List<Counting> _rowList1 = [];
  Counting _counting;
  List<dynamic> _list;
  File _image;
  File _inspectionLandImage;
  File _photoWithGrover;
  String mapImage, photoWithGrover, inspectionLandImage;
  var visibilty = false;
  int upload = 0;
  int inpection = 1;
  int grover = 2;
  int index;
  String check;
  String sowingMonth;
  String previousCrop;
  String adjacentCrop;
  String cropStage;
  String sowingWeek;
  String dateOfHarvest = "Likely date of harvest:";
  File path;
  List<Model> modelList;
  String dropdownValue = 'Select Stage';

  List<String> spinnerItems = [
    'Select Stage',
    'Flowering',
    'Sowing',
    'Preharvesting',
    'Vacant Land'
  ];


  List<String> months = [
    'Select Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> monthsToShow = [];
  List<String> cropMaster = [
    "Select Crop",
    "Wheat",
    "Wheat",
    "Maize",
    "Maize",
    "Bajra",
    "Arbi",
    "Gram (Chana)",
    "Cotton",
    "Bhindi",
    "Bitter Gourd",
    "Bitter Gourd",
    "Bottle Gourd",
    "Bottle Gourd",
    "Brinjal",
    "Cauliflower",
    "Chikoo",
    "Chikoo",
    "Chilli",
    "Cucurbits",
    "Pumpkin",
    "Ginger (Adrak)",
    "Guava",
    "Ground Nut",
    "Guar",
    "Jowar",
    "Leafy vegetables",
    "Leafy vegetables",
    "Musk Melon",
    "Mustard",
    "Papaya",
    "Peach",
    "Pear",
    "Arhar",
    "Barley",
    "Toria (Mustard)",
    "Turmeric (Haldi)",
    "Water Melon",
    "Carrot",
    "Brinjal",
    "Grapes",
    "Barseem",
    "Til",
    "Kinnow",
    "Amla",
    "Arbi",
    "Sunflower",
    "Plum",
    "Bhindi",
    "Capsicum",
    "Onion"
  ];

  List<String> cropMasterId = [
    "1",
    "2",
    "2",
    "3",
    "4",
    "5",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "20",
    "22",
    "22",
    "23",
    "25",
    "25",
    "29",
    "31",
    "32",
    "33",
    "35",
    "37",
    "37",
    "41",
    "42",
    "45",
    "46",
    "47",
    "49",
    "50",
    "55",
    "56",
    "57",
    "62",
    "66",
    "68",
    "82",
    "83",
    "86",
    "90",
    "91",
    "92",
    "93",
    "123",
    "127",
    "143"
  ];
  List<String> week = ['Select Stage Week', '1st', '2nd', '3rd', '4th', '5th'];

  int currentMonth;

  @override
  void initState() {
    // TODO: implement initState

    currentMonth = getMonth();
    monthsToShow.add(months[currentMonth - 2]);
    monthsToShow.add(months[currentMonth - 1]);
    monthsToShow.add(months[currentMonth]);
    monthsToShow.add(months[currentMonth + 1]);
    monthsToShow.add(months[currentMonth + 2]);
    sowingMonth=months[currentMonth];
    sowingWeek=week[0];
    previousCrop=cropMaster[0];
    adjacentCrop=cropMaster[0];
    cropStage=cropMaster[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   //debugger();
    index = widget.text1;
    path = widget.path;
    check = widget.check;

    var data = json.decode(Constants.pref.getString("mobile"));
    List<dynamic> listData = data['RESPONSE'][index]['FarmerLandDetail'];
    //   //debugger();

    String LocationDetail = listData[0]['LocationDetail'];
    String LandDetail = listData[0]['LandDetail'];
    // String SeedAllotedArea = listData[0]['SeedAllotedArea'];
    String SeedAllotedArea = "";
    String CropName = listData[0]['CropName'];

    /// String ClassofSeed = listData[0]['ClassofSeed'];
    String ClassofSeed = "";
    String SeedVariety = listData[0]['SeedVariety'];
//   // debugger();

//    if (check == "2") {
//      imgFromCamera1(path);
//    }

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorGlobal.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
//                     padding: EdgeInsets.only(left: 2, right: 0, top: 0,bottom: 2),
//                        decoration: BoxDecoration(
//                          color: ColorGlobal.whiteColor,
//                          borderRadius: BorderRadius.only(
//                              topLeft: Radius.circular(8.0),
//                              bottomLeft: Radius.circular(8.0),
//                              bottomRight: Radius.circular(8.0),
//                              topRight: Radius.circular(8.0)),
//                          boxShadow: <BoxShadow>[
//                            BoxShadow(
//                              color: Colors.grey.withOpacity(0.3),
//                              spreadRadius: 1,
//                              blurRadius: 20,
//
//                              // changes position of shadow
//                            ),
//                          ],
//                        ),

                  child: Column(children: [
                Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
//

                  steps: <Step>[
                    Step(
                      title: new Text(
                        'Area Map',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      content: Container(
                          child: Column(
                        children: [
                          Material(
                              child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(0, 10),
                                                blurRadius: 5),
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 22,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: FlatButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return DrawPath();
                                                  }));
                                                },
                                                child: Text(
                                                  "Create Graph",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: FlatButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await _showPicker1(context, 0);
                                                },
                                                child: Text(
                                                  "Upload Image",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
//                                                child: Image.asset('assets/Icon/add_photo.png',
//                                                    width: 110.0, height: 110.0),

                                  child: Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: _image !=
                                            null
                                            ? FileImage(
                                            _image)
                                            : AssetImage(
                                                    'assets/Icon/graph.jpg')
                                                as ImageProvider,
                                      ),
                                    ),
                                  )),
                            ),
                          )),
                          TextField(
                            controller: cropStandard,
                            decoration: InputDecoration(
                              labelText: 'Whether crop confirms standards?',
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: cropCondition,
                            decoration: InputDecoration(
                              labelText: 'Crop Condition',
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: areaInspected,
                                  decoration: InputDecoration(
                                    labelText: 'Inpected Area',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: areaRejected,
                                decoration: InputDecoration(
                                  labelText: 'Cancelled area',
                                ),
                              )),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: netareaCertified,
                                  decoration: InputDecoration(
                                    labelText: 'Net Area Certified',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: averageYield,
                                decoration: InputDecoration(
                                  labelText: 'Average yeild',
                                ),
                              )),
                            ],
                          ),



                          TextField(
                            controller: totalYield,
                            decoration: InputDecoration(
                              labelText: 'Total yield ',
                            ),
                          ),

                          TextField(
                            controller: remarks,
                            decoration: InputDecoration(
                              labelText: 'Remarks ',
                            ),
                          ),
//                                    SizedBox(height: 12,),
//                                    ElevatedButton(
//
//                                      onPressed: () {},
//                                      child: Padding(
//                                        padding: const EdgeInsets.fromLTRB(0,12,0,12),
//                                        child: Text('Save Data',style: TextStyle(fontSize: 20,color: ColorGlobal.colorPrimary,fontWeight: FontWeight.w900),),
//                                      ),
//                                      style: ElevatedButton.styleFrom(primary: Color(0xFFEEF1F3),shape: StadiumBorder(),),
//                                    ),
                        ],
                      )),
                    ),
                    Step(
                      title: new Text(
                        'Farmer Land Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      content: Container(

//                                decoration: BoxDecoration(
//                                  color: ColorGlobal.whiteColor,
//                                  boxShadow: [
//                                    BoxShadow(
//                                      color: Colors.grey.withOpacity(0.2),
//                                      spreadRadius: 1,
//                                      blurRadius: 20,
//                                      // changes position of shadow
//                                    ),
//                                  ],
//                                  borderRadius: BorderRadius.all(Radius.circular(11)),
//                                ),

                          child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Location Detail:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Expanded(
                                  child: Text(
                                LocationDetail,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Land Detail:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                LandDetail,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Seed Alloted Area:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                SeedAllotedArea,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Crop Name:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                CropName,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Class of Seed:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                ClassofSeed,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Seed Variety:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                SeedVariety,
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                            ],
                          ),


//                          TextField(
//                            controller: harvestDate,
//                            maxLength: 3,
//                            keyboardType: TextInputType.number,
//                            decoration: InputDecoration(
//                                labelText: 'Likely date of harvest',
//                                counterText: ""),
//                          ),
                          TextField(
                            controller: FarmLocation,
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Farm Location/Landmark ',
                                counterText: ""),
                          ),
                          SizedBox(height: 16,),
                          GestureDetector(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                    setState(() {
                                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                                      final String formatted = formatter.format(date);
                                      dateOfHarvest= formatted.toString();
                                    });

                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                            },
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  dateOfHarvest, style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: ColorGlobal.darkerText,
                                ),)),
                                Expanded(
                                    child: Image.asset(
                                      'assets/Icon/calendar.png',
                                      fit: BoxFit.scaleDown, // this is the solution for border
                                      width: 28.0,
                                      height: 24.0,
                                    )
                                )],
                            ),
                          ),
                          TextField(
                            controller: earthization,
                            maxLength: 13,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Earthization', counterText: ""),
                          ),


                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Sowing Month:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: sowingMonth,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                      sowingMonth = data;
                                    });
                                  },
                                  items: monthsToShow
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              )
                            ],
                          ),  Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Sowing Week:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: sowingWeek,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                      sowingWeek = data;
                                    });
                                  },
                                  items: week
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              )
                            ],
                          ),


                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Previous Crop:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: previousCrop,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                     // debugger();
                                      previousCrop = data;
                                    });
                                  },
                                  items: cropMaster
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              )
                            ],
                          ),
                          TextField(
                            controller: Isolation,
                            maxLength: 13,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Isolation ', counterText: ""),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Stage Of Crop:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: cropStage,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                      cropStage = data;
                                    });
                                  },
                                  items: cropMaster
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Crop condition of seed:',
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: ColorGlobal.darkerText,
                                ),
                              )),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: cropStage,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                      cropStage = data;
                                    });
                                  },
                                  items: cropMaster
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Adjacent crop:',
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  underline: SizedBox(),
                                  value: adjacentCrop,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                  onChanged: (String data) {
                                    setState(() {
                                      adjacentCrop = data;
                                    });
                                  },
                                  items: cropMaster
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              )
                            ],
                          ),

                        ],
                      )),
                    ),
                    Step(
                      title: new Text(
                        'Counting of fields',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      content: SafeArea(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: offtype,
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Off-Type', counterText: ""),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: locp,
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'L.O.C.P.', counterText: ""),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: ows,
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'O.W.S.', counterText: ""),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: diseased,
                                    maxLength: 16,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        labelText: 'Diseased', counterText: ""),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      iconSize: 38,
                                      onPressed: () {
                                        _addRow();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Visibility(
                              visible: visibilty,
                              child: Container(
                                child: ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    children: <Widget>[
                                      DataTable(
                                          horizontalMargin: 0,
                                          columnSpacing: 10,
                                          columns: [
                                            DataColumn(
                                                label: Text('S.No.',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ColorGlobal.fontName,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      letterSpacing: -0.1,
                                                      color: ColorGlobal
                                                          .colorPrimary,
                                                    ))),
                                            DataColumn(
                                                label: Text('Off-Type',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ColorGlobal.fontName,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      letterSpacing: -0.1,
                                                      color: ColorGlobal
                                                          .colorPrimary,
                                                    ))),
                                            DataColumn(
                                                label: Text('L.O.C.P',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ColorGlobal.fontName,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      letterSpacing: -0.1,
                                                      color: ColorGlobal
                                                          .colorPrimary,
                                                    ))),
                                            DataColumn(
                                                label: Text('O.W.S',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ColorGlobal.fontName,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      letterSpacing: -0.1,
                                                      color: ColorGlobal
                                                          .colorPrimary,
                                                    ))),
                                            DataColumn(
                                                label: Text('Diseased',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ColorGlobal.fontName,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      letterSpacing: -0.1,
                                                      color: ColorGlobal
                                                          .colorPrimary,
                                                    ))),
                                          ],
                                          rows: _rowList),
                                    ]),
                              ),
                            ),
                            Visibility(
                              visible: visibilty,
                              child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Total",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Expanded(
                                            child: TextField(
                                              controller: total,
                                              decoration: InputDecoration(
                                                labelText: '',
                                              ),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: total,
                                              decoration: InputDecoration(
                                                labelText: '',
                                              ),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: total,
                                              decoration: InputDecoration(
                                                labelText: '',
                                              ),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: total,
                                              decoration: InputDecoration(
                                                labelText: '',
                                              ),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: new Text(
                        'Other Information',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      content: Container(

//                                decoration: BoxDecoration(
//                                  color: ColorGlobal.whiteColor,
//                                  boxShadow: [
//                                    BoxShadow(
//                                      color: Colors.grey.withOpacity(0.2),
//                                      spreadRadius: 1,
//                                      blurRadius: 20,
//                                      // changes position of shadow
//                                    ),
//                                  ],
//                                  borderRadius: BorderRadius.all(Radius.circular(11)),
//                                ),

                          child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Inspection Land Photo",
                                  style: TextStyle(
                                    fontFamily: ColorGlobal.fontName,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: ColorGlobal.darkerText,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Material(
                                    child: GestureDetector(
                                        onTap: () => _showPicker(context, 1),
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: _inspectionLandImage !=
                                                      null
                                                  ? FileImage(
                                                      _inspectionLandImage)
                                                  : AssetImage(
                                                          'assets/Icon/land.jpg')
                                                      as ImageProvider,
                                            ),
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "selfie With Grover",
                                style: TextStyle(
                                  fontFamily: ColorGlobal.fontName,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: ColorGlobal.darkerText,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Material(
                                  child: GestureDetector(
                                onTap: () => _showPicker(context, 2),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: _photoWithGrover != null
                                          ? FileImage(_photoWithGrover)
                                          : AssetImage('assets/Icon/grover.jpg')
                                              as ImageProvider,
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          )),
                        ],
                      )),
                    ),
                  ],
                ),
              ])),
              SizedBox(
                height: 6,
              ),

//                  Expanded(
//
//                       child: Stepper(
//                      type: stepperType,
//                      physics: ScrollPhysics(),
//                      currentStep: _currentStep,
//                      onStepTapped: (step) => tapped(step),
//                      onStepContinue:  continued,
//                      onStepCancel: cancel,
//                      steps: <Step>[
//
//    ])
//     ),

//                GestureDetector(
//                  onTap: () async {
//                    //debugger();
//                    Model model = new Model(
//                        fruitName: "300", quantity: "cropCondition.text");
//                    dbManager.insertModel(model);
//
//                    //debugger();
//                    Future<List<Model>> list = dbManager.getModelList();
//                  await print(list);
//                    //debugger();
//                    setState(() {
//                      //debugger();
//
////                      Fluttertoast.showToast(
////                          msg: "Invalid----"+dbManager.openDb().,
////                          toastLength: Toast.LENGTH_SHORT,
////                          gravity: ToastGravity.BOTTOM,
////                          timeInSecForIosWeb: 2,
////                          backgroundColor: Colors.red,
////                          textColor: Colors.white,
////                          fontSize: 16.0
////                      );
//
//                    });
//                  }, // handle your image tap here
//                  child: Image.asset(
//                    'assets/Icon/sync.png',
//                    fit: BoxFit.cover, // this is the solution for border
//                    width: 52.0,
//                    height: 70.0,
//                  )
//                ),
            ],
          ),
        ),
      ),
    );
  }

  void _addRow() {
    // Built in Flutter Method.
    setState(() {
      visibilty = true;
      int count = _rowList.length;
      count = count + 1;
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(
          Text(
            (count.toString()),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Text(
            offtype.text,
            style: TextStyle(color: Colors.black),
          ),
        ),
        DataCell(
          Text(
            locp.text,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        DataCell(
          Text(
            ows.text,
            style: TextStyle(color: Colors.black),
          ),
        ),
        DataCell(
          Text(
            diseased.text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ]));

      _counting = Counting(
        SNo: index.toString(),
        No: count,
        offType: offtype.text,
        LOCP: locp.text,
        OWS: ows.text,
        DISEASED: diseased.text,
        CreateUser: diseased.text,
      );
    });
    // print(_counting.toJson());
//    //debugger();
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : saveToLocal();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  _showPicker(context, int s) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
//                  new ListTile(
//                      leading: new Icon(Icons.photo_library),
//                      title: new Text('Photo Library'),
//                      onTap: () {
//                        _imgFromGallery(s);
//                        Navigator.pop(context);
//                        //
//                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera(s);
                      Navigator.pop(context);
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _showPicker1(context, int s) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(s);
                        Navigator.pop(context);
                        //
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera(s);
                      Navigator.pop(context);
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  imgFromCamera(int inpection) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    File imageResized = await FlutterNativeImage.compressImage(image.path,
        quality: 100, targetWidth: 120, targetHeight: 120);
    List<int> imageBytes = imageResized.readAsBytesSync();
   // debugger();
    setState(() {
      if (inpection == 0) {
        _image = image;
        mapImage = base64Encode(imageBytes);
      } else if (inpection == 1) {
        _inspectionLandImage = image;
        inspectionLandImage = base64Encode(imageBytes);
      } else {
        _photoWithGrover = image;
        photoWithGrover = base64Encode(imageBytes);
      }
    });
  }

//  imgFromCamera1(File path1) async {
//   // debugger();
//    List<int> imageBytes;
//    File image = path1.path;
//    debugger();
//    try {
//      File imageResized = await FlutterNativeImage.compressImage(path1.path,
//              quality: 100, targetWidth: 120, targetHeight: 120);
//    imageBytes = imageResized.readAsBytesSync();
//
//    } catch (e) {
//      print(e);
//    }
//    debugger();
//    setState(() {
//      _image = image;
//      mapImage = base64Encode(imageBytes);
//    });
//  }

  Future<void> saveToLocal() async {
    //debugger();
    // ;
    var m2 = jsonEncode(_counting);
    Map<String, dynamic> model21 = _counting.toJson();
//
    String m3 = jsonEncode(m2);
    // Map<String, dynamic> list = m2;
    var b = "[" + m2 + "]";
    var bq = json.decode(m3.toString());
    String b1 = (b);
//   // debugger();
    String b2 = jsonDecode(b1).toString();
    String m4 = jsonEncode(b2);
    print(jsonDecode(b1));
//   // debugger();
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print(b2);
    //var b= json.decode(b1);

//    String b = b1.trim();
    // String b1 = json.decode(m3);
    //debugger();
    // String b=b1;

    Model model = new Model(
        sNo: index,
        farmerID: "cropCondition.text",
        timeForSow: sowTime.text,
        likelydateOfHarvest: harvestDate.text,
        farmLocation: FarmLocation.text,
        isolation: Isolation.text,
        earthization: earthization.text,
        adjoiningCropCondition: adjoiningCrop.text,
        seedCropStatus: seedCropStatus.text,
        cropStandards: cropStandard.text,
        cropCondition: cropCondition.text,
        inspectedArea: areaInspected.text,
        canceledArea: canceledArea.text,
        netAreaCertified: netareaCertified.text,
        avgYeild: averageYield.text,
        totalYield: totalYield.text,
        remarks: remarks.text,
        total: total.text,
        percentage: percentage.text,
        name: name.text,
        counting: b1,
        mapImage: mapImage,
        inspectionLandImage: inspectionLandImage,
        photoWithGrover: photoWithGrover,
        CreateUser: "photoWithGrover");
    //debugger();
    dbManager.insertModel(model);
//    List<Map<String,dynamic>> model2  =(await dbManager.getModelList());
//    print("ppppppppp");
//   print(await model2);
//
//    var m = jsonEncode(model2);
//    var m1 = jsonEncode(m);
//    m = m.replaceAll("=", ":");
//    final pattern = RegExp('\s+');
//    m = m.replaceAll("\\/", "om");
//    m = m.replaceAll("\\\\", "");
//    print("nnnnn");
//    print(m);
    //debugger();
    Fluttertoast.showToast(
        msg: "Data Saved Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ModulePage();
    }));
    //   print("getting from table");
    //debugger();
    //  List<Model> model2  =(await dbManager.getModelList());
    //  String m = jsonEncode(model2);
    //debugger();
    // String m=model1.toString().replaceAll("=", "");
    //   print(await dbManager.getModelList());
    //debugger();
  }

  _imgFromGallery(int inpection) async {
    ImageSource source;
    //debugger();
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    //debugger();
    // var photo = await ImagePicker.pickImage(source: source);
    //debugger();
    source = ImageSource.gallery;
    //debugger();
    File imageResized = await FlutterNativeImage.compressImage(image.path,
        quality: 100, targetWidth: 120, targetHeight: 120);
    List<int> imageBytes = imageResized.readAsBytesSync();

    //debugger();
    setState(() {
      if (inpection == 0) {
        _image = image;
        mapImage = base64Encode(imageBytes);
      } else if (inpection == 1) {
        _inspectionLandImage = image;
        inspectionLandImage = base64Encode(imageBytes);
      } else {
        _photoWithGrover = image;
        photoWithGrover = base64Encode(imageBytes);
      }
    });
  }

  int getMonth() {
    var now = new DateTime.now();
    int current_mon = now.month;
    print("monthhhhhhhhhhhhh");
    return current_mon - 1;
  }
}
