part of 'prescription_bloc.dart';

enum PrescriptionStateType {initial, isLoading, success, failure}

class PrescriptionState extends Equatable {
  final PrescriptionStateType stateType;
  final List<PrescriptionEntity> prscps;

  final List<PrescriptionEntity> activePrescriptions;
  final List<PrescriptionEntity> inactivePrescriptions;
  final List<PrescriptionEntity> handedPrescriptions;
  final List<PrescriptionEntity> expiredPrescriptions;

  const PrescriptionState({
    this.prscps = const [],
    this.activePrescriptions = const [],
    this.handedPrescriptions = const [],
    this.inactivePrescriptions = const [],
    this.expiredPrescriptions = const [],
    this.stateType = PrescriptionStateType.initial,
  });

  PrescriptionState copyWith({
    PrescriptionStateType? stateType,
    List<PrescriptionEntity>? prscps,
    List<PrescriptionEntity>? activePrescriptions,
    List<PrescriptionEntity>? inactivePrescriptions,
    List<PrescriptionEntity>? handedPrescriptions,
    List<PrescriptionEntity>? expiredPrescriptions,
  }){
    return PrescriptionState(
      stateType: stateType ?? this.stateType,
      prscps: prscps ?? this.prscps,
      activePrescriptions: activePrescriptions ?? this.activePrescriptions,
      inactivePrescriptions: inactivePrescriptions ?? this.inactivePrescriptions,
      handedPrescriptions: handedPrescriptions ?? this.handedPrescriptions,
      expiredPrescriptions: expiredPrescriptions ?? this.expiredPrescriptions
    );
  }

  @override
  List<Object?> get props => [stateType, prscps];
}
