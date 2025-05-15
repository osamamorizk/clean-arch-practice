import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('bloc changed $bloc $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('bloc onTransition $bloc , $transition');
  }
}
