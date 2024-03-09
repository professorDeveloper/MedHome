
import 'package:flutter/cupertino.dart';

@immutable
abstract class ForgetInitEvent {}

class  ForgetVerfyEvent extends ForgetInitEvent{
final String phone;

ForgetVerfyEvent({required this.phone});

}
