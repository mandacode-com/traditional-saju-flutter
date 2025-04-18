import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

class HomeState extends Equatable {
  const HomeState({FormStatus? formStatus, bool? isLoggedIn})
    : _formStatus = formStatus ?? FormStatus.initial,
      _isLoggedIn = isLoggedIn ?? false;

  final FormStatus _formStatus;
  final bool _isLoggedIn;

  /// [_formStatus] getter
  FormStatus get formStatus => _formStatus;

  /// [_isLoggedIn] getter
  bool get isLoggedIn => _isLoggedIn;

  /// [copyWith] method
  HomeState copyWith({FormStatus? formStatus, bool? isLoggedIn}) {
    return HomeState(
      formStatus: formStatus ?? this.formStatus,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object?> get props => [_formStatus, _isLoggedIn];
}
