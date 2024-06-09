import 'package:equatable/equatable.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/entities/user/user.dart';

class PharmacyEntity extends Equatable{
  final int id;
  final List<MedicamentEntity> medicaments;
  final double longtitude;
  final double latitude;
  final UserEntity pharmacist;

  PharmacyEntity(this.id, this.medicaments, this.longtitude, this.latitude, this.pharmacist);




  @override
  List<Object?> get props => throw UnimplementedError();

}