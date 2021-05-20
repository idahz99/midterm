import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'newproduct.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _listproducts;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Column(
          children: [
            _listproducts ==null
             ?Flexible( child : Center (child:Text("No products")))
             : Flexible   (
                          child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
                
                 
               
                    ),
            ),
            //  List.generate(_listproducts.length, (index) {
        // return Padding ();
       // }
          ],
              ),
          floatingActionButton:FloatingActionButton(
           shape : RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15),
               ),
                child: Icon(Icons.add),
               backgroundColor:Colors.black,
               onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Newproduct()),);
  
},
 ),          
          
         ),
            );
          
      
  }

void _loadproduct(){
 http.post(
        Uri.parse("/crimsonwebs.coml/s269349/myshop/php/loadingproducts.php"),
        body: {
               }).then((response) {
      if (response.body == "nodata") {
            return;
      } else {
        var jsondata = json.decode(response.body);
        _listproducts = jsondata["products"];
         setState(() {});
        print(_listproducts);
      }
    });
  }

}