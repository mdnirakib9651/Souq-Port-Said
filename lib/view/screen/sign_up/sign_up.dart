import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/registration_model/registration_model.dart';
import 'package:souq_port_said/data/provider/auth%20provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../signin_in/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var _formkey = GlobalKey<FormState>();

bool isPassVasiable = true;
bool isConPassVasiable = true;
final TextEditingController firstNameController=TextEditingController();
final TextEditingController lastNameController=TextEditingController();
final TextEditingController emailController=TextEditingController();
final TextEditingController phoneController=TextEditingController();
final TextEditingController addressController=TextEditingController();
final TextEditingController postController=TextEditingController();
final TextEditingController districtController=TextEditingController();
final TextEditingController passController=TextEditingController();
final TextEditingController conPassController=TextEditingController();


class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var cw=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
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
                        //--------------------->>>>>>>>> First Name TextField <<<<<<<<--------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                hintText: "First Name",
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
                            controller: firstNameController,
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
                        //--------------------->>>>>>>>> Last Name TextField <<<<<<<<--------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                              hintText: "Last Name",
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Last Name can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        // ---------------------->>>>>>> Email TextField <<<<<<<<<<------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "E-mail can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        // ---------------------->>>>>>> Phone TextField <<<<<<<<<<------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone, color: ColorResources.black, size: 25,),
                              hintText: "Phone Number",
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Phone Number can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        //--------------------->>>>>>>>> Name TextField <<<<<<<<--------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.location_on, color: ColorResources.black, size: 25,),
                              hintText: "Your Address",
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Address can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        //--------------------->>>>>>>>> Post Code TextField <<<<<<<<--------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: postController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.post_add, color: ColorResources.black, size: 25,),
                              hintText: "Post Code",
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Post Code can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        //--------------------->>>>>>>>> District TextField <<<<<<<<--------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            controller: districtController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.post_add, color: ColorResources.black, size: 25,),
                              hintText: "District Id",
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
                            validator: (value) {
                              if(value!.isEmpty){
                                return "District can't be empty";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        // ---------------------->>>>>>> Password TextField <<<<<<<<<<------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            obscureText: isPassVasiable ? true : false,
                            decoration: InputDecoration(
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
                                prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    onPressed: (){
                                      setState(() {
                                        isPassVasiable = !isPassVasiable;
                                      });
                                    },
                                    icon: Icon(isPassVasiable ? Icons.visibility_off : Icons.visibility, color: ColorResources.black,)),
                            ),
                            controller: passController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty || value.isEmpty){
                                return "Password can't be empty";
                              } else if(value.length < 8){
                                return "Password must be 8 characters";
                              }
                              else if(value!=passController.text){
                                return "Password should be matched";
                              }
                              return null;
                            },
                            style: ubuntuRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                        // ---------------------->>>>>>> Confirm Password TextField <<<<<<<<<<------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: TextFormField(
                            obscureText: isConPassVasiable ? true : false,
                            decoration: InputDecoration(
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
                                prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    onPressed: (){
                                      setState(() {
                                        isConPassVasiable = !isConPassVasiable;
                                      });
                                    },
                                    icon: Icon(isConPassVasiable ? Icons.visibility_off : Icons.visibility, color: ColorResources.black,)),
                            ),
                            controller: conPassController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty || value.isEmpty){
                                return "Password can't be empty";
                              } else if(value.length < 8){
                                return "Password must be 8 characters";
                              }
                              else if(value!=passController.text){
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                            if(_formkey.currentState!.validate()){
                              RegistrationModel reg = RegistrationModel(
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  mobile: phoneController.text.trim(),
                                  address: addressController.text.trim(),
                                  postCode: int.parse(postController.text.trim()),
                                  districtId: int.parse(districtController.text.trim()),
                                  password: passController.text.trim(),
                              );
                              Provider.of<AuthProvider>(context, listen: false).getRegister(context, reg, setState);
                            } else{
                              EasyLoading.showError("Not Valid");
                            }
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationBarScreen(),));
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
                const SizedBox(height: 50,),
              ],
            ),
          ),
        )

    );
  }
}