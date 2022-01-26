import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:vibgyor/components/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibgyor/utils/utilities.dart';
import 'package:vibgyor/methods/submitSetup.dart';

class SetupFormPage extends StatefulWidget {
  const SetupFormPage({ Key? key }) : super(key: key);

  @override
  _SetupFormPageState createState() => _SetupFormPageState();
}

class _SetupFormPageState extends State<SetupFormPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController launcherNameController = TextEditingController();
  TextEditingController launcherPlaystoreController = TextEditingController();

  TextEditingController widgetNameController = TextEditingController();
  TextEditingController widgetNumberController = TextEditingController();
  TextEditingController widgetPlaystoreController = TextEditingController();

  TextEditingController extraWidgetNameController1 = TextEditingController();
  TextEditingController extraWidgetNumberController1 = TextEditingController();
  TextEditingController extraWidgetPlaystoreController1 = TextEditingController();

  TextEditingController extraWidgetNameController2 = TextEditingController();
  TextEditingController extraWidgetNumberController2 = TextEditingController();
  TextEditingController extraWidgetPlaystoreController2 = TextEditingController();

  TextEditingController iconNameController = TextEditingController();
  TextEditingController iconPlaystoreController = TextEditingController();

  TextEditingController wallpaperAppNameController = TextEditingController();
  TextEditingController backupFileController = TextEditingController();

  final maxWidget = 2;

  


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),

    child:Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text("Setup Form",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: height/2 + 15,
                      width: width/2 + 15,
                      decoration: BoxDecoration(
                        color: Color(0xFF01042F),
                        borderRadius: BorderRadius.circular(20)
                      ),
                        child: Container(
                          alignment: Alignment.center,
                          height: height/2,
                          width: width/2,
                          decoration: BoxDecoration(
                            color: _imgFile == null ? Colors.white: Color(0xFF01042F),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              _imgFile == null ? Container(): Container(
                                height: height/2,
                                width: width/2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(_imgFile)
                                  )
                                ),
                                ),
                              InkWell(
                                onTap: pickImage,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add, 
                                      color: Colors.black,
                                      size: 50,
                                    ),
                              
                                    Text(
                                      "Upload Screenshot",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )
                              
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
          
               SizedBox(height: 50,),
               
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Launcher Details",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
          
                // Launcher Name Field
                CustomTextField(
                  controller: launcherNameController,
                  hintText: "Launcher Name"
                ),
                CustomTextField(
                  controller: launcherPlaystoreController,
                  hintText: "Launcher's Playstore Link"
                ),
                
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Widget Details",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
          
                // Widget Name Field
                CustomTextField(
                  controller: widgetNameController,
                  hintText: "Widget Name. eg.Vanilla kWGT"
                ),
                CustomTextField(
                  controller: widgetNumberController,
                  hintText: "Widget Number, if possible"
                ),
                CustomTextField(
                  controller: widgetPlaystoreController,
                  hintText: "Widget's Playstore Link"
                ),
                
               ..._moreWidgetsField(),
                
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    setState(() {
                      _widgetCount += 1;
                    });
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xFF7B51D3),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.add)
                      ),
                      SizedBox(width: 5,),
                      Text("Add more widget fields", 
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                ),
          
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("IconPack Details",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                CustomTextField(
                  controller: iconNameController,
                  hintText: "IconPack Name"
                ),
                CustomTextField(
                  controller: iconPlaystoreController,
                  hintText: "IconPack Playstore Link"
                ),
          
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Wallpaper",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                CustomTextField(
                  controller: wallpaperAppNameController,
                  hintText: "Wallpaper app or gdrive link"
                ),
                CustomTextField(
                  controller: backupFileController,
                  hintText: "Backup gdrive link"
                ),
          
                SizedBox(height: 30),
          


               TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF7B51D3))
                ),
                onPressed:()=> submitForm(),
                //  Navigator.push(
                //   context, 
                //   MaterialPageRoute(builder: (context) => 
                //   instruction[index]['heading'] == "Wallpapers" ? WallpaperPage(): SetupFormPage()
                //   )
                // ), 
                child: Container(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Submit',style: TextStyle(
                          letterSpacing: 1,fontSize: 19, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    )
   );
  }
  
  int _widgetCount = 0;
  _moreWidgetsField(){

    List widgetList = [];

    for(int i = 1; i <= _widgetCount && i <= maxWidget; i++){
      widgetList.add(
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20,),
              Row(
                children: [
                  Text("Widget Details",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _widgetCount -= 1;
                      });
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.remove, color: Colors.white,)
                    ),
                  )
                ],
              ),

              // Widget Name Field
              CustomTextField(
                controller: _widgetCount == 1 ? extraWidgetNameController1: extraWidgetNameController2,
                hintText: "Widget Name. eg.Vanilla kWGT"
              ),
              CustomTextField(
                controller: _widgetCount == 1 ? extraWidgetNameController1: extraWidgetNameController2,
                hintText: "Widget Number, if possible"
              ),
              CustomTextField(
                controller: _widgetCount == 1 ? extraWidgetNameController1: extraWidgetNameController2,
                hintText: "Widget's Playstore Link"
              ),
           ],
         )
      );
    }

    return widgetList;
  }


  var _imgFile;
  Future pickImage() async{
    final selected = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState((){
      if(selected != null){
        _imgFile = File(selected.path);
      }
      else if(_imgFile == null){
        showSnackBar("Please Select a image file.", context);
      }
    });
  }


  Future submitForm() async {
    var screenShotLink = await uploadImage(_imgFile);
    if (screenShotLink == ''){
      showSnackBar("Something went wrong at our end.", context);
    }
    else{
    Map<String, String> launcher = {
      'name' : launcherNameController.text,
      'playstore': launcherPlaystoreController.text
    };
  
    List<Map<String, String>> widgets = [];
    if(widgetNameController.text != ''){
      Map<String, String> widget1= {
        'name' : widgetNameController.text
      };
      if(widgetNumberController.text != '') widget1['number'] = widgetNumberController.text;
      if(widgetPlaystoreController.text != '') widget1['playstore'] = widgetPlaystoreController.text;
      widgets.add(widget1);
    }

    if(extraWidgetNameController1.text != ''){
      Map<String, String> widget1= {
        'name' : extraWidgetNameController1.text
      };
      if(extraWidgetNumberController1.text != '') widget1['number'] = extraWidgetNumberController1.text;
      if(extraWidgetPlaystoreController1.text != '') widget1['playstore'] = extraWidgetPlaystoreController1.text;
      widgets.add(widget1);
    }

    if(extraWidgetNameController2.text != ''){
      Map<String, String> widget1= {
        'name' : extraWidgetNameController2.text
      };
      if(extraWidgetNumberController2.text != '') widget1['number'] = extraWidgetNumberController2.text;
      if(extraWidgetPlaystoreController2.text != '') widget1['playstore'] = extraWidgetPlaystoreController2.text;
      widgets.add(widget1);
    }


    Map<String, String> iconpack = {
      'name' : iconNameController.text,
      'playstore': iconPlaystoreController.text
    };
    
    String wallpaper = wallpaperAppNameController.text;
    String backup = backupFileController.text;

    var data = SetupData(screenShotLink,launcher, widgets, iconpack, wallpaper, backup);
    print(data);
    
    showAlert(context);
    }
  }

}


class SetupData{
  String imgLink;
  Map<String, String> launcher;
  List<Map<String, String>> widgets;
  Map<String, String> iconpack;
  String wallpaper;
  String backup;
  SetupData(this.imgLink,this.launcher, this.widgets,this.iconpack,this.wallpaper,this.backup);
}

// Launcher name
// Screenshot
// Widget Name and number
// Iconpack
// Backup file if any
// Other details if any
// Wallpaper app link or drive link