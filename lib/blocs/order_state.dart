import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///Describes the current state of the order process
@immutable
abstract class OrderState implements Equatable {}

@immutable
class InitialOrderState extends OrderState {
  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Initial';
}

@immutable
class RejectedOrderState extends OrderState {
  final String reason;

  RejectedOrderState(this.reason);

  @override
  List<Object> get props => [reason];

  @override
  String toString() => 'Rejected/Reason: ' + reason;
}

@immutable
class ConfirmedOrderState extends OrderState {
  final int orderId;

  ConfirmedOrderState(this.orderId);

  @override
  List<Object> get props => [orderId];

  @override
  String toString() => 'Confirmed/ID: ' + orderId.toString();
}

@immutable
class LoadingOrderState extends OrderState {
  LoadingOrderState();

  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Loading';
}
