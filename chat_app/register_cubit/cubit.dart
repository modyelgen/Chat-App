import 'package:app_1/chat_app/register_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(InitialRegisterState());
  Future<void> registerUser ({required String email,required String password}) async{
    emit(LoadingRegisterState());
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(SuccessRegisterState());
    }
    on FirebaseAuthException catch(e){
      if(e.code =='email-already-in-use'){
        emit(FailedRegisterState(errMessage: 'email-already-in-use'));
      }
    }
    catch(e){
      emit(FailedRegisterState(errMessage: e.toString()));
    }

  }
}