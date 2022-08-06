import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinygram/features/chat/domain/models/chat.dart';
import 'package:tinygram/features/chat/repository/i_chats_repository.dart';

part 'chats_bloc.freezed.dart';
part 'chats_bloc.g.dart';

@freezed
class ChatsState with _$ChatsState {
  const ChatsState._();

  factory ChatsState.initial({required final List<Chat> chats}) =
      _InitialChatsState;
  factory ChatsState.loading({required final List<Chat> chats}) =
      _LoadingChatsState;
  factory ChatsState.ready({required final List<Chat> chats}) =
      _ReadyChatsState;
  factory ChatsState.error({required final List<Chat> chats}) =
      _ErrorChatsState;

  factory ChatsState.fromJson(Map<String, Object?> json) =>
      _$ChatsStateFromJson(json);
}

@freezed
class ChatsEvent with _$ChatsEvent {
  const ChatsEvent._();

  const factory ChatsEvent.loadingStarted() = InitializedChatsEvent;

  factory ChatsEvent.fromJson(Map<String, Object?> json) =>
      _$ChatsEventFromJson(json);
}

/// Buisiness Logic Component ChatsBLoC
class ChatsBloc extends Bloc<ChatsEvent, ChatsState>
    implements EventSink<ChatsEvent> {
  final IChatsRepository _repository;

  ChatsBloc({
    required final IChatsRepository repository,
    final ChatsState? initialState,
  })  : _repository = repository,
        super(
          initialState ?? ChatsState.initial(chats: []),
        ) {
    on<ChatsEvent>(
      (event, emit) => event.map<Future<void>>(
        loadingStarted: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  /// Fetch event handler
  Future<void> _fetch(
    InitializedChatsEvent event,
    Emitter<ChatsState> emit,
  ) async {
    try {
      emit(ChatsState.loading(chats: state.chats));
      final newData = await _repository.readAll();
      emit(ChatsState.ready(chats: newData));
    } on Object {
      emit(ChatsState.error(chats: state.chats));
      rethrow;
    }
  }
}
