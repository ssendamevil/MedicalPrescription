part of 'medicament_bloc.dart';

enum MedicamentStateType{
  inProgress,
  success,
  failure,
  initial
}

@immutable
class MedicamentState {
  final List<MedicamentEntity> medicaments;
  final MedicamentStateType state;

  const MedicamentState({
    this.medicaments = const [],
    this.state = MedicamentStateType.initial
  });


  MedicamentState copyOf({
    List<MedicamentEntity>? medicaments,
    MedicamentStateType? state
  }) => MedicamentState(
      medicaments: medicaments ?? this.medicaments,
      state: state ?? this.state
  );
}

