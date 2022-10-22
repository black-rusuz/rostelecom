// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/repository_impl.dart' as _i5;
import 'domain/repository.dart' as _i4;
import 'injection.dart' as _i9;
import 'presentation/pages/home/notes/bloc/notes_bloc.dart' as _i8;
import 'presentation/pages/home/tasks/bloc/tasks_bloc.dart' as _i6;
import 'presentation/pages/login/bloc/login_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.client);
  gh.singleton<_i4.Repository>(_i5.RepositoryImpl(client: get<_i3.Dio>()));
  gh.factory<_i6.TasksBloc>(() => _i6.TasksBloc(get<_i4.Repository>()));
  gh.factory<_i7.LoginBloc>(() => _i7.LoginBloc(get<_i4.Repository>()));
  gh.factory<_i8.NotesBloc>(() => _i8.NotesBloc(get<_i4.Repository>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
