import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plano/data_provider/Model/User_data.dart';
import 'package:plano/data_provider/local/my_config_cache.dart';
import 'package:plano/data_provider/local/my_config_cache_keys.dart';
import 'package:plano/data_provider/remote/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  DioHelper dioHelper = DioHelper();

  User_data?user_data;

  Future login({required String email , required String password}) async {
    emit(loginloadingstate());
    await dioHelper.postData(endPoint: '/Auth/login',body: {
      'email':email,
      'password':password,
    }).then((value){
      user_data=User_data.fromJson(value.data);
      MyConfigCach.putString(key: MyConfigCacheKeys.token, value: user_data!.token!);
      emit(loginsucssesstate());
    }).catchError((error){
      print(Error());
      emit(loginerrorstate());
    });
  }
}
