import 'package:saju/base_info/form_status.dart';
import 'package:saju/base_info/member_info/model/member_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_local_storage/saju_local_storage.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'member_info_state.dart';
part 'member_info_event.dart';

class YearlySajuMemberInfoBloc
    extends Bloc<YearlySajuMemberInfoEvent, YearlySajuMemberInfoState> {
  YearlySajuMemberInfoBloc({
    required YearlySajuRepository yearlySajuRepository,
  })  : _yearlySajuRepository = yearlySajuRepository,
        super(const YearlySajuMemberInfoState()) {
    on<MemberInfoSubscriptionRequested>(_onSubscriptionRequested);
    on<MemberInfoGenderChanged>(_onGenderChanged);
    on<MemberInfoBirthDateChanged>(_onBirthDateChanged);
    on<MemberInfoBirthHourChanged>(_onBirthHourChanged);
    on<MemberInfoBirthMinuteChanged>(_onBirthMinuteChanged);
    on<MemberInfoBirthTimeDisabledChanged>(_onBirthTimeDisabledChanged);
  }

  final YearlySajuRepository _yearlySajuRepository;

  void _onSubscriptionRequested(MemberInfoSubscriptionRequested event,
      Emitter<YearlySajuMemberInfoState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final yearlySajuForm = await _yearlySajuRepository.getSajuForm();
      final gender = yearlySajuForm.gender;

      final birthDateTime = yearlySajuForm.birthDateTime ?? DateTime.now();

      // If the birthDateTime is null, update the birthDateTime with the current date time.
      if (yearlySajuForm.birthDateTime == null) {
        _yearlySajuRepository.updateSajuForm(
          birthDateTime: birthDateTime,
        );
      }

      final birthDate = BirthDate.dirty(
          DateTime(birthDateTime.year, birthDateTime.month, birthDateTime.day));
      final birthHour = BirthHour.dirty(birthDateTime.hour);
      final birthMinute = BirthMinute.dirty(birthDateTime.minute);
      emit(
        state.copyWith(
          status: FormStatus.success,
          gender: gender,
          birthDate: birthDate,
          birthHour: birthHour,
          birthMinute: birthMinute,
          birthTimeDisabled: yearlySajuForm.birthTimeDisabled ?? false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }

  void _onGenderChanged(MemberInfoGenderChanged event,
      Emitter<YearlySajuMemberInfoState> emit) async {
    _yearlySajuRepository.updateSajuForm(gender: event.gender);

    emit(
      state.copyWith(
        gender: event.gender,
      ),
    );
  }

  void _onBirthDateChanged(MemberInfoBirthDateChanged event,
      Emitter<YearlySajuMemberInfoState> emit) async {
    final birthDate = BirthDate.dirty(event.birthDate);

    _yearlySajuRepository.updateSajuForm(
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
      Emitter<YearlySajuMemberInfoState> emit) async {
    final birthHour = BirthHour.dirty(event.birthHour);

    final currentBirthDateTime = DateTime.now();

    _yearlySajuRepository.updateSajuForm(
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
      Emitter<YearlySajuMemberInfoState> emit) async {
    final birthMinute = BirthMinute.dirty(event.birthMinute);

    final currentBirthDateTime = DateTime.now();

    _yearlySajuRepository.updateSajuForm(
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

  void _onBirthTimeDisabledChanged(MemberInfoBirthTimeDisabledChanged event,
      Emitter<YearlySajuMemberInfoState> emit) async {
    _yearlySajuRepository.updateSajuForm(
      birthTimeDisabled: event.disabled,
    );

    emit(
      state.copyWith(
        birthTimeDisabled: event.disabled,
      ),
    );
  }
}
