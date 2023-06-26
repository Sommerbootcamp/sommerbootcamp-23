import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/shared/appwrite_client.dart';
import '../domain.dart';
import '../domain/models/chat_model.dart';
import 'chat_widget.controller.state.dart';

/// Chat widget controller
class ChatWidgetController extends StateNotifier<ChatWidgetControllerState> {
  /// constructor
  ChatWidgetController({
    required ChatWidgetControllerState state,
    required ChatRepository chatRepo,
    required AppwriteClient appwriteClient,
  })  : _appwriteClient = appwriteClient,
        _chatRepo = chatRepo,
        super(state);

  final ChatRepository _chatRepo;
  final AppwriteClient _appwriteClient;

  /// add message to state
  void addMessage(ChatModel message) async {
    final messages = state.messages.value ?? [];

    if (messages.any((e) => e.id == message.id)) {
      return;
    }

    final currentUser = await _appwriteClient.account.get();

    final newMessage =
        message.copyWith(isSender: currentUser.$id == message.senderId);

    state = state.copyWith(messages: AsyncData([...messages, newMessage]));
  }

  /// Send a message
  void sendMessage({
    required String receiverId,
    required String message,
  }) async {
    // TODO(team): Sende die Nachricht
    // await _chatRepo.sendMessage(receiverId: receiverId, message: message);
    // await _chatRepo.sendMessage(receiverId: message, message: receiverId);
  }
}
