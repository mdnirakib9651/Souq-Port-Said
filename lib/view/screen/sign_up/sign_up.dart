import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../dashboard/navigationbar_screen.dart';
import '../signin_in/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var _formkey = GlobalKey<FormState>();

final TextEditingController _nameController=TextEditingController();
final TextEditingController _mailController=TextEditingController();
final TextEditingController _passController=TextEditingController();
final TextEditingController _conPassController=TextEditingController();


class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var cw=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage(Images.splashLogo), height: 90, width: 100,),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  child: RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Lets Get Started", style: ubuntuSemiBold.copyWith(color: Colors.white,
                            fontSize: Dimensions.fontSizeExtraLarge)),
                      ]

                  )),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraExtraSmall),
                  child: Text("Create a new account", style: ubuntuRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),),
                ),
                const SizedBox(height: 25,),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                hintText: "Full Name",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                fillColor: ColorResources.white,
                                filled: true,
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Name can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email, color: ColorResources.black, size: 25,),
                                hintText: "Your Email",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                fillColor: ColorResources.white,
                                filled: true,
                            ),
                            controller: _mailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "E-mail can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                hintText: "Password",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                fillColor: ColorResources.white,
                                filled: true,
                            ),
                            controller: _passController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty || value.isEmpty){
                                return "Password can't be empty";
                              } else if(value.length<6){
                                return "Password must be 6 characters";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                hintText: "Confirm Password",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                fillColor: ColorResources.white,
                                filled: true,
                            ),
                            controller: _conPassController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty || value.isEmpty){
                                return "Password can't be empty";
                              } else if(value.length < 6){
                                return "Password must be 6 characters";
                              }
                              else if(value!=_passController.text){
                                return "Password should be matched";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraExtraSmall),
                          child: InkWell(
                            onTap: () {
                            if(_formkey.currentState!.validate()){
                              setState(() {
                                _nameController.clear();
                                _mailController.clear();
                                _passController.clear();
                                _conPassController.clear();
                              });
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationBarScreen(),));
                          },
                            child: Container(
                              width: cw,
                              decoration: BoxDecoration(
                                  color: ColorResources.iconNextFavourite,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                                child: Text("Sign Up", style: ubuntuSemiBold.copyWith(color: Colors.white,
                                    fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center,),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "Have an account?", style: ubuntuRegular.copyWith(color: Colors.blueGrey,
                              fontSize: Dimensions.fontSizeLarge)),
                        ]

                    )),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
                    }, child: Text( "Sign In", style: ubuntuSemiBold.copyWith(color: Colors.orange,
                        fontSize: Dimensions.fontSizeExtraLarge)),)

                  ],
                ),
              ],
            ),
          ),

        )

    );
  }
}