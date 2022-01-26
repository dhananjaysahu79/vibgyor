import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibgyor/screens/setupupload.dart';
import 'package:vibgyor/screens/wallpaperPage.dart';
import 'package:vibgyor/utils/utilities.dart';

class Instruction extends StatelessWidget {
  final index;
  const Instruction(this.index ,{ Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(CupertinoIcons.bitcoin_circle, size: 50,),
        SizedBox(height: 20,),
        Text(instruction[index]['heading'], 
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1.   ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(instruction[index]['desc1'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2.  ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(instruction[index]['desc2'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              SizedBox(height:50,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF7B51D3))
                ),
                onPressed:()=> 
                 Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => 
                  instruction[index]['heading'] == "Wallpapers" ? WallpaperPage(): SetupFormPage()
                  )
                ), 
                child: Container(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(instruction[index]['btntext'],style: TextStyle(
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
        
      ],
    );
  }
}