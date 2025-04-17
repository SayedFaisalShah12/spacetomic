import 'package:equatable/equatable.dart';
import '../../core/models/apod.dart';

abstract class ApodState extends Equatable {
  const ApodState();

  @override
  List<Object?> get props => [];
}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final Apod apod;

  const ApodLoaded(this.apod);

  @override
  List<Object?> get props => [apod];
}

class ApodError extends ApodState {
  final String message;

  const ApodError(this.message);

  @override
  List<Object?> get props => [message];
}
