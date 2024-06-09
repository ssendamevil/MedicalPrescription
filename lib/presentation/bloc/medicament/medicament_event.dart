part of 'medicament_bloc.dart';

@immutable
abstract class MedicamentEvent extends Equatable {
  const MedicamentEvent();
}

class GetMedicsByTagIdEvent extends MedicamentEvent{
  final int id;

  const GetMedicsByTagIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMedicsByCategoryEvent extends MedicamentEvent{
  final String category;

  const GetMedicsByCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
