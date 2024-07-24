// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'core/helpers/cache_manager.dart' as _i6;
import 'core/network/network.dart' as _i11;
import 'core/network/network_client.dart' as _i8;
import 'dependency_injection.dart' as _i13;
import 'features/auth/blocs/login_bloc/login_bloc.dart' as _i7;
import 'features/auth/blocs/signup_bloc/signup_bloc.dart' as _i9;
import 'features/auth/controllers/auth_controller.dart' as _i5;
import 'features/upload_documents/bloc/upload_doc_bloc.dart' as _i12;
import 'features/upload_documents/controllers/upload_docs_controller.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initialize({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(registerModule.dio);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.AuthController>(() => _i5.AuthController(
          dio: gh<_i3.Dio>(),
          sharedPreferences: gh<_i4.SharedPreferences>(),
        ));
    gh.lazySingleton<_i6.CacheManager>(
        () => _i6.CacheManager(sp: gh<_i4.SharedPreferences>()));
    gh.factory<_i7.LoginBloc>(
        () => _i7.LoginBloc(authController: gh<_i5.AuthController>()));
    gh.lazySingleton<_i8.NetworkClient>(() => _i8.NetworkClient(
          dio: gh<_i3.Dio>(),
          cacheManager: gh<_i6.CacheManager>(),
        ));
    gh.factory<_i9.SignupBloc>(
        () => _i9.SignupBloc(authController: gh<_i5.AuthController>()));
    gh.lazySingleton<_i10.UploadDocsController>(
        () => _i10.UploadDocsController(client: gh<_i11.NetworkClient>()));
    gh.factory<_i12.UploadDocBloc>(
        () => _i12.UploadDocBloc(gh<_i10.UploadDocsController>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
