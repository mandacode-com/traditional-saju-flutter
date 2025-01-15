import 'package:byul_mobile/new_year_saju/member_info/model/member_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';
import 'package:saju_local_storage/saju_local_storage.dart';

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
      final newYearSajuForm = await _newYearSajuRepository.getSajuForm();
      final gender = Gender.dirty(newYearSajuForm.gender ?? GenderType.unknown);

      final birthDateTime = newYearSajuForm.birthDateTime ?? DateTime.now();
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

  void _onGenderChanged(MemberInfoGenderChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) async {
    final gender = Gender.dirty(event.gender);

    _newYearSajuRepository.updateSajuForm(gender: event.gender);

    emit(
      state.copyWith(
        gender: gender,
      ),
    );
  }

  void _onBirthDateChanged(MemberInfoBirthDateChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) async {
    final birthDate = BirthDate.dirty(event.birthDate);

    _newYearSajuRepository.updateSajuForm(
      birthDateTime: DateTime(
        event.birthDate.year,
        event.birthDate.month,
        event.birthDate.day,
        state.birthHour.value,
        state.birthMinute.value,
      ),
    );

    emit(
      state.copyWith(
        birthDate: birthDate,
      ),
    );
  }

  void _onBirthHourChanged(MemberInfoBirthHourChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) async {
    final birthHour = BirthHour.dirty(event.birthHour);

    final currentBirthDateTime = DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      birthDateTime: DateTime(
        state.birthDate.value?.year ?? currentBirthDateTime.year,
        state.birthDate.value?.month ?? currentBirthDateTime.month,
        state.birthDate.value?.day ?? currentBirthDateTime.day,
        event.birthHour,
        state.birthMinute.value,
      ),
    );

    emit(
      state.copyWith(
        birthHour: birthHour,
      ),
    );
  }

  void _onBirthMinuteChanged(MemberInfoBirthMinuteChanged event,
      Emitter<NewYearSajuMemberInfoState> emit) async {
    final birthMinute = BirthMinute.dirty(event.birthMinute);

    final currentBirthDateTime = DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      birthDateTime: DateTime(
        state.birthDate.value?.year ?? currentBirthDateTime.year,
        state.birthDate.value?.month ?? currentBirthDateTime.month,
        state.birthDate.value?.day ?? currentBirthDateTime.day,
        state.birthHour.value,
        event.birthMinute,
      ),
    );

    emit(
      state.copyWith(
        birthMinute: birthMinute,
      ),
    );
  }
}
