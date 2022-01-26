import 'package:flutter/material.dart';

List instruction = [
  {
    'heading' : 'Wallpapers',
    'desc1': 'All our wallpapers are crowdsourced.',
    'desc2': 'We respect copyrights, If someone wallpapers are displayed here without credits and they want us to remove it. You can report the same in next page.',
    'btntext': 'Continue to Wallpapers'
  },
  {
    'heading' : 'Setup Submission',
    'desc1': "Before moving ahead collect setup's screenshot, playstore link of wallpaper app, widgets. Field marked as * are mandatory.",
    'desc2': 'All submitted setup will be manually checked by the admin, if somehow your setup is rejected, a feedback will be provided.',
    'btntext': 'Continue for Submission'
  }
];

showSnackBar(String message, context){
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        elevation: 5,
        margin: EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(message),
    )
  );
}

GlobalKey<State> _dialogKey = GlobalKey<State>();

showAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        key: _dialogKey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          height:  350,
          child: Column(
            children: [
              Image.asset("assets/Images/modal.gif",fit: BoxFit.cover,),
              Text('UPLOADING...', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      )
  );
}