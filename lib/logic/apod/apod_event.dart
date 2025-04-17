import 'package:equatable/equatable.dart';

abstract class ApodEvent extends Equatable {
  const ApodEvent();

  @override
  List<Object?> get props => [];
}

class LoadApod extends ApodEvent {
  const LoadApod();
}
