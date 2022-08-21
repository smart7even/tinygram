import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinygram/features/chat/domain/models/message.dart';
import 'package:tinygram/features/chat/repository/i_chat_repository.dart';

part 'chat_bloc.freezed.dart';
part 'chat_bloc.g.dart';

/// ChatState data class
@freezed
class ChatState with _$ChatState {
  const ChatState._();

  factory ChatState.initial({
    required final String chatId,
    required final List<Message> messages,
  }) = _InitialChatState;

  factory ChatState.loading({
    required final String chatId,
    required final List<Message> messages,
  }) = _LoadingChatState;

  factory ChatState.ready({
    required final String chatId,
    required final List<Message> messages,
  }) = _ReadyChatState;

  factory ChatState.messageSendingComplete({
    required final String chatId,
    required final List<Message> messages,
  }) = _MessageSendingCompleteChatState;

  factory ChatState.error({
    required final String chatId,
    required final List<Message> messages,
  }) = _ErrorChatState;

  /// Generate ChatState class from Map<String, Object?>
  factory ChatState.fromJson(Map<String, Object?> json) =>
      _$ChatStateFromJson(json);
}

/// ChatEvent data class
@freezed
class ChatEvent with _$ChatEvent {
  const ChatEvent._();

  factory ChatEvent.loadingStarted() = LoadingStartedChatEvent;
  factory ChatEvent.messageSent({required final String text}) =
      MessageSentChatEvent;

  /// Generate ChatEvent class from Map<String, Object?>
  factory ChatEvent.fromJson(Map<String, Object?> json) =>
      _$ChatEventFromJson(json);
}

/// Buisiness Logic Component ChatsBLoC
class ChatBloc extends Bloc<ChatEvent, ChatState>
    implements EventSink<ChatEvent> {
  final IChatRepository _repository;

  ChatBloc({
    required final IChatRepository repository,
    required final ChatState initialState,
  })  : _repository = repository,
        super(
          initialState,
        ) {
    on<ChatEvent>(
      (event, emit) => event.map<Future<void>>(
        loadingStarted: (event) => _fetch(event, emit),
        messageSent: (event) => _sendMessage(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  /// Fetch event handler
  Future<void> _fetch(
    LoadingStartedChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(ChatState.loading(chatId: state.chatId, messages: state.messages));
      final newData = await _repository.readAll(state.chatId);
      emit(ChatState.ready(chatId: state.chatId, messages: newData));
    } on Object {
      emit(ChatState.error(chatId: state.chatId, messages: state.messages));
      rethrow;
    }
  }

  Future<void> _sendMessage(
    MessageSentChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      await _repository.sendMessage(state.chatId, event.text);
      emit(
        ChatState.messageSendingComplete(
          chatId: state.chatId,
          messages: state.messages,
        ),
      );
      emit(ChatState.loading(chatId: state.chatId, messages: state.messages));
      final newData = await _repository.readAll(state.chatId);
      emit(ChatState.ready(chatId: state.chatId, messages: newData));
    } on Object {
      emit(ChatState.error(chatId: state.chatId, messages: state.messages));
      rethrow;
    }
  }
}
