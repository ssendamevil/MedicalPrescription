import 'package:equatable/equatable.dart';

class ResponseErrorEntity extends Equatable{
  final String msg;
  final int statusCode;

  const ResponseErrorEntity({
    required this.msg,
    required this.statusCode
  });

  @override
  List<Object?> get props => throw UnimplementedError();

}