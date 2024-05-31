part of 'prescription_bloc.dart';

enum PrescriptionStateType {initial, isLoading, success, failure}

class PrescriptionState extends Equatable {
  final PrescriptionStateType stateType;
  final List<PrescriptionEntity> prscps;

  const PrescriptionState({
    this.prscps = const [],
    this.stateType = PrescriptionStateType.initial,
  });

  PrescriptionState copyWith({
    PrescriptionStateType? stateType,
    List<PrescriptionEntity>? prscps
  }){
    return PrescriptionState(
      stateType: stateType ?? this.stateType,
      prscps: prscps ?? this.prscps
    );
  }

  @override
  List<Object?> get props => [stateType, prscps];
}
