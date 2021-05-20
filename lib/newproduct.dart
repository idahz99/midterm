import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:midtermstiw2044myshop/main.dart';
 
void main() => runApp(Newproduct());
 
class Newproduct extends StatefulWidget {
  @override
  _NewproductState createState() => _NewproductState();
}

class _NewproductState extends State<Newproduct> {
 File _image;
 final _picker = ImagePicker();
 Future getImageformcamera() async{
final PickedFile image = await _picker.getImage (source:ImageSource.camera,
maxHeight: 300,
 maxWidth: 300,
);
 
 setState(() {
   _image = image as File;
 });
 }

 Future getImagefromgallaery() async{
final PickedFile image = await _picker.getImage (source:ImageSource.gallery,
maxHeight: 300,
maxWidth: 300,
);
 setState(() {
   _image = image as File;
 });
 }

 String pathAsset = 'assets/images/empty.png';
   
  TextEditingController _productname = new TextEditingController();
  TextEditingController _producttype = new TextEditingController();
  TextEditingController _productquantity = new TextEditingController();
    TextEditingController _productprice = new TextEditingController();
  _NewproductState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              
                              
                             GestureDetector(
                    onTap: () => {_uploadproduct()},
                                        child: Container(
                                              decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: _image == null
                                                    ? AssetImage(pathAsset)
                                                    : FileImage(_image),
                                                fit: BoxFit.scaleDown,
                                              ),
                                              ),
                                        ),
                                        ),
                              SizedBox(height:10),
                                    TextField(
                                controller: _productname,
                                decoration: new InputDecoration(
                                hintText: 'Productname'),
                              ),
                              ],
                               
                              
                            ),
                          ),
                        ),
                      );
                      }
                    
                     
Future<void> _uploadproduct() async {
  String productname = _productname .text.toString();
   String producttype = _producttype.text.toString();
   String productprice = _productprice.text.toString();
   String productquantity = _productquantity.text.toString();
 
    String base64Image = base64Encode( _image.readAsBytesSync());
       http.post(
        Uri.parse( "/crimsonwebs.coml/s269349/myshop/php/newproduct.php"),
        body: {
                   "encoded_string": base64Image,
                   "productname": productname,
                   "producttype": producttype,
                   "productquantity": productquantity,
                   "productprice": productprice

        }).then((response) {
     
      print(response.body);
      if (response.body == "success") {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange[100],
            textColor: Colors.white,
            fontSize: 15.0);
        setState(() {
          _image = null;
        
        },);
    
       
}
}
  ); 
        
}
}

