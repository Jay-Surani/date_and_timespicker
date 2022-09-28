import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: dtpicker(),));
}

class dtpicker extends StatefulWidget {
  const dtpicker({Key? key}) : super(key: key);

  @override
  State<dtpicker> createState() => _dtpickerState();
}

class _dtpickerState extends State<dtpicker> {
  final Uri _url = Uri.parse('https://flutter.dev');

  DateTime seleteddate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dtpicker"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {
              final DateTime?selectdate = await showDatePicker(context: context,
                  initialDate: seleteddate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2023));
              if (seleteddate!=selectdate&&selectdate!=null) {
                setState(() {
                  seleteddate=selectdate;
                });
                
                
              }
            }, child: Text("Date & Time")),
            Text("${seleteddate.day}-${seleteddate.month}-${seleteddate.year}"),

            ElevatedButton(onPressed: () {
              _launchUrl();


            }, child:Text("Shere")),
            
IconButton(onPressed: () {
  Share.share('check out my website https://example.com');
}, icon:Icon(Icons.send))

          ],

        ),

      ),


    );
  }Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
