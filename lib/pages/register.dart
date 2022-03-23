

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop_app/pages/widget/customTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  XFile? imageXfile;
  Position? position;
  List<Placemark>? placemarks;
  getCurrentLocation() async{
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    position = newPosition;
    placemarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude
    );
  }
  final ImagePicker _picker = ImagePicker();
  Future<void> _getImage()async {
    imageXfile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXfile;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children:  [
          SizedBox(height: 10,),
         InkWell(
           onTap: (){
             _getImage();
           },
           child: CircleAvatar(
             radius: MediaQuery.of(context).size.width * 0.20,
             backgroundImage: imageXfile == null ? null : FileImage(File(imageXfile!.path)
             ),
             child: imageXfile == null ? Icon(
                 Icons.add_photo_alternate,
               size: MediaQuery.of(context).size.width * 0.20,
               color: Colors.grey,
             ) : null,
           ),
         ),
          /*CustomTextField(
            controller: anyController,
            data: Icons.phone,
            hintText: 'Phone',
            isObsecre: true,
            enabled: false,
          ),
          CustomTextField(
            controller: anyController,
            data: Icons.lock,
            hintText: 'Phone',
            isObsecre: false,
            enabled: false,
          ),*/
          Form(
            key: _formKey,
              child: Column(
                children: [
                    CustomTextField(
                    controller: personController,
                    data: Icons.person,
                    hintText: 'Name',
                    isObsecre: false,
                    //enabled: false,
                ),
                  CustomTextField(
                  controller: emailController,
                  data: Icons.email,
                  hintText: 'Email',
                  isObsecre: false,
                  //enabled: false,
                ),
                  CustomTextField(
                    controller: passwordController,
                    data: Icons.lock,
                    hintText: ' Password ',
                    isObsecre: true,
                    //enabled: false,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    data: Icons.lock,
                    hintText: 'Confirm Password',
                    isObsecre: true,
                    //enabled: false,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    data: Icons.phone,
                    hintText: 'Phone',
                    isObsecre: false,
                    //enabled: false,
                  ),
                  CustomTextField(
                    controller: locationController,
                    data: Icons.my_location,
                    hintText: 'Cafe / Restaurant Address',
                    isObsecre: false,
                    enabled: false,
                    //enabled: false,
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        label: const Text(
                          'Get my current Location',
                          style: TextStyle(color: Colors.white),
                        ),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.amberAccent,
                      ),
                      onPressed: () =>print('click'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)
                      )
                    ),
                    ),
                  )
                ],
              )
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan,
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10)
            ), onPressed: () =>print('click'),
          )
        ],
      ),
    );
  }
}
