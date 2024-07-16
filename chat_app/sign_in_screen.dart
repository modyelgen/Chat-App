import 'package:app_1/chat_app/chat_cubit/cubit.dart';
import 'package:app_1/chat_app/login_cubit/cubit.dart';
import 'package:app_1/chat_app/login_cubit/states.dart';
import 'package:app_1/chat_app/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chat_screen.dart';
class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  String? email;
  String? password;
  bool isLoading=false;
   GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  BlocListener<LoginCubit,LoginStates>(
       listener:(context,state){
         if(state is LoadingLoginState){
          isLoading=true;
         }
         else if(state is SuccessLoginState){
           BlocProvider.of<ChatCubit>(context).getMessages();
           isLoading=false;
           Navigator.push(context, MaterialPageRoute(builder: (context){return ChatScreen(email: email,);}));
         }
         else if(state is FailedLoginState){
           isLoading=false;
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
         }
       } ,
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor:const Color(0xff2B475E),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: Column(
                children:
                [
                  const  Spacer(flex: 3,),
                  Image.asset('assets/chat_app/scholar.png'),
                  const  Text('Scholar Chat',style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: 'Pacifico'),),
                  const Spacer(flex:3),
                  Row(
                    children:const [
                      Text('SIGN IN',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    style:const TextStyle(color: Colors.white),
                    onChanged: (data){
                      email=data;
                    },
                    validator: (data){
                      if(data!.isEmpty){
                        return 'cant be null';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
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
                    ),),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    style:const TextStyle(color: Colors.white),
                    onChanged: (data){
                      password=data;
                    },
                    validator: (data){
                      if(data!.isEmpty){
                        return'password cant be empty';
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
                    ),),
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
                        onTap: () async{
                          if(formKey.currentState!.validate())
                          {
                            BlocProvider.of<LoginCubit>(context).loginUser(email: email!, password: password!);
                          }
                        },
                        child: const Text('Sign In',style: TextStyle(
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
                      const Text('don\'t have an account ?',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  SignUpScreen();
                        }));
                      }, child: const Text('SignUp',)),
                    ],
                  ),
                  const Spacer(flex: 3,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

