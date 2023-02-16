import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../dashboard/navigationbar_screen.dart';
import '../sign_up/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

var _formkey = GlobalKey<FormState>();
final TextEditingController mailController=TextEditingController();
final TextEditingController passController=TextEditingController();


class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    var cw=MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(Images.splashLogo), height: 90, width: 100,),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                child: RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Welcome to", style: ubuntuSemiBold.copyWith(color: Colors.white,
                          fontSize: Dimensions.fontSizeExtraLarge)),
                      TextSpan(text: " SouQ portsaid", style: ubuntuRegularBold.copyWith(color: Colors.orange,
                          fontSize: Dimensions.fontSizeExtraLarge)),
                    ]

                )),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraExtraSmall),
                child: Text("Sign In to Continue", style: ubuntuRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),),
              ),
              const SizedBox(height: 25,),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                            vertical: Dimensions.paddingSizeExtraSmall),
                        child: Container(
                          height: 50,
                          width: cw,
                          decoration: BoxDecoration(
                              color: ColorResources.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email, color: ColorResources.black, size: 25,),
                                hintText: "Your Email",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            controller: mailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value!.length==null || value.isEmpty){
                                return "E-mail can't be empty";
                              }
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                            vertical: Dimensions.paddingSizeExtraSmall),
                        child: Container(
                          height: 50,
                          width: cw,
                          decoration: BoxDecoration(color: ColorResources.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                hintText: "Password",
                                hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black),
                                contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                            controller: passController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.length==null || value.isEmpty){
                                return "Password can't be empty";
                              } else if(value.length<6){
                                return "Password must be 6 characters";
                              }
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                            vertical: Dimensions.paddingSizeExtraExtraSmall),
                        child: InkWell(onTap: () {
                          if(_formkey.currentState!.validate()) {
                            setState(() {
                              mailController.clear();
                              passController.clear();
                            });
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationBarScreen(),));
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
                              child: Text("Sign In", style: ubuntuSemiBold.copyWith(color: Colors.white,
                                  fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraExtraSmall),
                child: TextButton(onPressed: () {

                }, child: Text("Forgot Password?", style: ubuntuSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                    color: Colors.orange),)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Dont you have an account?", style: ubuntuRegular.copyWith(color: Colors.blueGrey,
                            fontSize: Dimensions.fontSizeLarge)),
                      ]

                  )),
                  TextButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                    },
                    child: Text( "Register", style: ubuntuSemiBold.copyWith(color: Colors.orange,
                      fontSize: Dimensions.fontSizeExtraLarge)),)

                ],
              ),
            ],
          ),

        )

    );
  }
}