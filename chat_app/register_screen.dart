import 'package:app_1/chat_app/chat_screen.dart';
import 'package:app_1/chat_app/register_cubit/cubit.dart';
import 'package:app_1/chat_app/register_cubit/states.dart';
import 'package:app_1/chat_app/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignUpScreen extends StatelessWidget {
     SignUpScreen({Key? key}) : super(key: key);
   String? email;
   String? password;
   bool isLoading=false;
   GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  BlocListener<RegisterCubit,RegisterStates>(
      listener: (context,state){
        if(state is LoadingRegisterState){
          isLoading=true;
        }
        else if(state is SuccessRegisterState){
          isLoading =false;
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return   ChatScreen(email: email,);
          }));
        }
        else if(state is FailedRegisterState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:const Color(0xff2B475E) ,
          ),
          backgroundColor:const Color(0xff2B475E),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children:
                  [
                    Image.asset('assets/chat_app/scholar.png'),
                    const  Text('Scholar Chat',style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: 'Pacifico'),),
                   // Spacer(flex:3),
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      children:const [
                          Text('REGISTER',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 12),
                     TextFormField(
                       style:const  TextStyle(
                         color: Colors.white
                       ),
                       validator: (data){
                         if(data!.isEmpty){
                           return 'cant be empty';
                         }
                         return null;
                       },
                      decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'E-mail',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                      onChanged: (data){
                        email=data;
                      },
                    ),
                    const SizedBox(height: 12),
                     TextFormField(
                       style:const TextStyle(
                           color: Colors.white
                       ),
                       validator: (data){
                         if(data!.isEmpty){
                           return 'cant be null';
                         }
                         return null;
                       },
                       decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                      onChanged: (data){
                        password=data;
                      },),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child:  Center(
                        child: GestureDetector(
                          onTap: ()async {
                            if (formKey.currentState!.validate()){

                              BlocProvider.of<RegisterCubit>(context).registerUser(email: email!, password: password!);
                            }
                          },
                          child: const Text('Register ',style: TextStyle(
                            fontSize: 15,
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Text('Already have an account ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(onPressed: ()
                        {
                          Navigator.pop(context,MaterialPageRoute(builder: (context){return  SignInScreen();}));
                        }, child: const Text('Login',)),
                      ],
                    ),
                   // Spacer(flex: 5,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

}


