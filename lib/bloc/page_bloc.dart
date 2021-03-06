import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:froti/models/Models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnLoadingPage();
      await Future.delayed(Duration(seconds: 3));
      yield OnMainPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToDetailPage) {
      yield OnDetailPage(event.plant);
    }
  }
}
