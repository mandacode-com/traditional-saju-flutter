import 'package:saju/config/config.dart';
import 'package:saju/base_info/member_detail/view/member_detail_page.dart';
import 'package:saju/base_info/member_info/bloc/member_info_bloc.dart';
import 'package:saju/themes/page_navigation_button_theme.dart';
import 'package:saju/widgets/bottom_page_navigation_button.dart';
import 'package:saju/widgets/page_back_button.dart';
import 'package:saju/widgets/custom_dropdown_button.dart';
import 'package:saju/widgets/page_info_text.dart';
import 'package:saju/widgets/page_navigation_button.dart';
import 'package:saju/themes/button_color.dart';
import 'package:saju/widgets/text_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_local_storage/saju_local_storage.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'member_info_form.dart';

class YearlySajuMemberInfoPage extends StatefulWidget {
  const YearlySajuMemberInfoPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const YearlySajuMemberInfoPage(),
    );
  }

  @override
  State<YearlySajuMemberInfoPage> createState() =>
      _YearlySajuMemberInfoPageState();
}

class _YearlySajuMemberInfoPageState extends State<YearlySajuMemberInfoPage> {
  final ScrollController _scrollController = ScrollController();

  bool isBottom = false;

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 40 &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isBottom = true;
      });
    } else {
      setState(() {
        isBottom = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isBottom = _scrollController.position.maxScrollExtent <= 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PageBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => YearlySajuMemberInfoBloc(
          yearlySajuRepository: context.read<YearlySajuRepository>(),
        )..add(const MemberInfoSubscriptionRequested()),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: MediaQuery.of(context).orientation == Orientation.landscape
                ? Config.getLandScapeHorizontalPadding(context).copyWith(
                    top: Config.horizontalPagePadding.top,
                    bottom: Config.horizontalPagePadding.bottom,
                  )
                : Config.verticalPagePadding,
            child: Column(
              spacing:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? Config.pageInfoTextSpacingHorizontal
                      : Config.pageInfoTextSpacingVertical,
              children: [
                const PageInfoText(
                    title: "정보를 입력해주세요", description: "당신의 운명을 알기 위한 첫 단계입니다."),
                YearlySajuMemberInfoForm(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return 
          BottomPageNavigationButton(
            opacity: MediaQuery.of(context).orientation == Orientation.portrait
                ? 1
                : isBottom
                    ? 1
                    : 0,
            child: child,
          );
        },
        child: _BottomNavigationBar(),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).orientation == Orientation.landscape
          ? Config.getLandScapeHorizontalPadding(context).copyWith(
              top: 20,
              bottom: 20,
            )
          : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: PageNavigationButton(
        theme: DarkPageNavigationButtonTheme(),
        page: YearlySajuMemberDetailPage(),
        text: "다음으로",
      ),
    );
  }
}
