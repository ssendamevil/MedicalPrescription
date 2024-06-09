part of 'qr_bloc.dart';

enum QrStateType {initial, isLoading, success, failure}

class QrState extends Equatable {
  final QrStateType stateType;
  final OrderEntity orderEntity;

  const QrState({
    this.stateType = QrStateType.initial,
    this.orderEntity = const OrderEntity(
      id: -1,
      medicaments: [],
      total: 0,
      prescription: PrescriptionEntity(
        appointmentState: '',
        activeIngredients: [],
        expirationDate: '',
        patientId: 1,
        doctorId: 1,
        id: 1,
        issueDate: '',
      ),
      token: '',
    ),
  });

  QrState copyWith({
    QrStateType? stateType,
    OrderEntity? orderEntity
  }){
    return QrState(
        stateType: stateType ?? this.stateType,
        orderEntity: orderEntity ?? this.orderEntity
    );
  }

  @override
  List<Object?> get props => [stateType, orderEntity];
}
