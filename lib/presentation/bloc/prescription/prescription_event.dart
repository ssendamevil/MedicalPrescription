part of 'prescription_bloc.dart';

abstract class PrescriptionEvent {
  const PrescriptionEvent();
}

class GetAllPrscrpEvent extends PrescriptionEvent{

  List<Object?> get props => throw UnimplementedError();

}
