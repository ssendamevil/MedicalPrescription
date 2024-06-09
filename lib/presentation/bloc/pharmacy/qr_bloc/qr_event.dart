part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();
}

class ScanQrCodeEvent extends QrEvent{
  final String token;

  const ScanQrCodeEvent(this.token);

  @override
  List<Object?> get props => [token];

}
