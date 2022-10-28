part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfilelInitial extends ProfileState {}

class ProfileNotEntered extends ProfileState {}

class ProfileEntered extends ProfileState {}
