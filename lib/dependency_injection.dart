import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.config.dart';
	
final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'initialize', 
  preferRelativeImports: true, 
  asExtension: true, 
)  
Future<void> configureDependencies()async => await getIt.initialize();

@module  
abstract class RegisterModule {  
  @preResolve  
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance(); 
  @singleton
  Dio get dio => Dio(); 
}
