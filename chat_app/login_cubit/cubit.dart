
import 'package:app_1/chat_app/login_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(InitialLoginState());
Future<void> loginUser({required String email,required String password})async{
  emit(LoadingLoginState());
  try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  emit(SuccessLoginState());
}
  on FirebaseAuthException catch(e){
    if(e.code =='wrong-password')
    {
      emit(FailedLoginState(errMessage: 'wrong password'));
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password is incorrect',style: TextStyle(color: Colors.red),)));
    }
    else if(e.code =='user-not-found'){
      emit(FailedLoginState(errMessage: 'user not found'));
    }
  }
}
}