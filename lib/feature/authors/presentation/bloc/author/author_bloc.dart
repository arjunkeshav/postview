import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postview/core/resources/data_state.dart';

import '../../../domain/enitity/authors_details.dart';
import '../../../domain/usecases/get_authors_list_usecase.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAuthorsListUseCase getAuthorsListUseCase;
  AuthorBloc({required this.getAuthorsListUseCase}) : super(AuthorInitialState()) {
    on<LoadAllAuthors>((event, emit) async {
      emit(AuthorLoadingState());
      final DataState dataState = await getAuthorsListUseCase.call();
      if(dataState is SuccessResponse){
        emit(AuthorLoadedState(authorsDetails: dataState.value));
      }else{
        emit(AuthorErrorState());
      }
    });
    on<LoadError>((event, emit) async {
      emit(AuthorErrorState());
    });
  }
}
