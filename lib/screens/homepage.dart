
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibgyor/components/instruction.dart';
import 'package:vibgyor/components/popup.dart';
import 'package:vibgyor/methods/getUser.dart';
import 'package:vibgyor/screens/loginscreen.dart';
import 'package:vibgyor/utils/utilities.dart';

class HomePage extends StatefulWidget {
  final userCreds;
  const HomePage(List this.userCreds, { Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),

    child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 8),
        child: Stack(
          children: [

            // Top Welcome Row and icon
            Column(
              children: [
                SizedBox(height: height/25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)
                              ),
                            ),

                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(widget.userCreds[0].photoUrl)
                                )
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome Back!",style: TextStyle(color: Colors.black54,fontSize: 15, fontWeight: FontWeight.w700),),
                            Text(widget.userCreds[0].fullName,
                              style: TextStyle(color: Colors.black87,fontSize: 17, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                   
                    IconButton(
                      onPressed: ()async{
                        if(await logOutUser())
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => LoginPage())
                        );
                        else 
                        showSnackBar("something went wrong at our end.", context);
                      }, 
                      icon: Icon(Icons.more_vert, color: Colors.black,)
                    )
                  ],
                ),
                // Center(child: Text(widget.userCreds.user.toString()),),
              ],
            ),


            // Bottom Navigation bar
           Padding(
             padding: const EdgeInsets.only(left:8.0, right: 18, bottom: 8),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children:[
                    Expanded(
                      child: Card(
                        // color: Colors.white,
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 30,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                IconButton(
                                  onPressed: (){
                                    showAlert(context);
                                  }, 
                                  icon: Icon(Icons.grid_3x3_outlined,color: Colors.black,)
                                ),


                                FloatingActionButton(
                                  onPressed: ()=> handlePopUP(1),
                                  child: Icon(Icons.add),
                                  backgroundColor: Color(0xFF7B51D3),
                                ),

                                IconButton(
                                  onPressed: () => handlePopUP(0), 
                                  icon: Icon(Icons.wallpaper_rounded,color: Colors.black,)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ),

                SizedBox(height: 10,)
              ],
             ),
           )

          ],
        ),
      ),
    )
    );
  }

  handlePopUP(int i, ) async{
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context, 
      builder: (context){
        return Popup(
          child: Instruction(i)
        );
      }
    );
  }
  
}