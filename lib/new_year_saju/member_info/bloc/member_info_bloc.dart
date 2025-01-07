import 'package:byul_mobile/new_year_saju/member_info/model/member_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'member_info_state.dart';
part 'member_info_event.dart';

class NewYearSajuMemberInfoBloc
    extends Bloc<NewYearSajuMemberInfoEvent, NewYearSajuMemberInfoState> {
  NewYearSajuMemberInfoBloc({
    required NewYearSajuRepository newYearSajuRepository,
  })  : _newYearSajuRepository = newYearSajuRepository,
        super(const NewYearSajuMemberInfoState()) {
    on<MemberInfoSubscriptionRequested>(_onSubscriptionRequested);
    on<MemberInfoGenderChanged>(_onGenderChanged);
    on<MemberInfoBirthDateChanged>(_onBirthDateChanged);
    on<MemberInfoBirthHourChanged>(_onBirthHourChanged);
    on<MemberInfoBirthMinuteChanged>(_onBirthMinuteChanged);
  }

  final NewYearSajuRepository _newYearSajuRepository;

  void _onSubscriptionRequested(MemberInfoSubscriptionRequested event,
      Emitter<NewYearSajuMemberInfoState> emit) async {
    emit(state.copyWith(status: NewYearSajuMemberInfoStatus.loading));
    try {
      final newYearSaju = _newYearSajuRepository.sajuForm;
      final gender = Gender.dirty(newYearSaju.gender ?? GenderType.unknown);

      final birthDateTime = newYearSaju.birthDateTime ?? DateTime.now();
      final birthDate = BirthDate.dirty(
          DateTime(birthDateTime.year, birthDateTime.month, birthDateTime.day));
      final birthHour = BirthHour.dirty(birthDateTime.hour);
      final birthMinute = BirthMinute.dirty(birthDateTime.minute);
      emit(
        state.copyWith(
          status: NewYearSajuMemberInfoStatus.success,
          gender: gender,
          birthDate: birthDate,
          birthHour: birthHour,
          birthMinute: birthMinute,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: NewYearSajuMemberInfoStatus.failure));
    }
  }

  void _onGenderChanged(
      MemberInfoGenderChanged event, Emitter<NewYearSajuMemberInfoState> emit) {
    final gender = Gender.dirty(event.gender);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(gender: gender.value),
    );

    emit(
      state.copyWith(
        gender: gender,
      ),
    );
  }

  void _onBirthDateChanged(MemberInfoBirthDateChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) {
    final birthDate = BirthDate.dirty(event.birthDate);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(birthDateTime: event.birthDate),
    );

    emit(
      state.copyWith(
        birthDate: birthDate,
      ),
    );
  }

  void _onBirthHourChanged(MemberInfoBirthHourChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) {
    final birthHour = BirthHour.dirty(event.birthHour);

    final currentBirthDateTime =
        _newYearSajuRepository.sajuForm.birthDateTime ?? DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(
        birthDateTime: DateTime(
          currentBirthDateTime.year,
          currentBirthDateTime.month,
          currentBirthDateTime.day,
          event.birthHour,
          state.birthMinute.value,
        ),
      ),
    );

    emit(
      state.copyWith(
        birthHour: birthHour,
      ),
    );
  }

  void _onBirthMinuteChanged(MemberInfoBirthMinuteChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) {
    final birthMinute = BirthMinute.dirty(event.birthMinute);

    final currentBirthDateTime =
        _newYearSajuRepository.sajuForm.birthDateTime ?? DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(
        birthDateTime: DateTime(
          currentBirthDateTime.year,
          currentBirthDateTime.month,
          currentBirthDateTime.day,
          state.birthHour.value,
          event.birthMinute,
        ),
      ),
    );

    emit(
      state.copyWith(
        birthMinute: birthMinute,
      ),
    );
  }
}
