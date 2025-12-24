import 'package:flutter_bloc/flutter_bloc.dart';

/// Controls the high-level navigation between the start screen and the portfolio.
class AppFlowCubit extends Cubit<bool> {
  AppFlowCubit() : super(false);

  void startPortfolio() => emit(true);
}

