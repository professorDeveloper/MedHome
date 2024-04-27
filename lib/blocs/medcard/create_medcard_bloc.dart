import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_medcard_event.dart';
part 'create_medcard_state.dart';

class CreateMedcardBloc extends Bloc<CreateMedcardEvent, CreateMedcardState> {
  CreateMedcardBloc() : super(CreateMedcardInitial()) {
    on<CreateMedcardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
