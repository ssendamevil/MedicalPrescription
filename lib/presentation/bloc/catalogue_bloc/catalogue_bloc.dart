import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'catalogue_event.dart';
part 'catalogue_state.dart';

class CatalogueBloc extends Bloc<CatalogueEvent, CatalogueState> {
  CatalogueBloc() : super(CatalogueInitial()) {
    on<CatalogueEvent>((event, emit) {

    });
  }
}
