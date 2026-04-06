import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/core/global_model/filter_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';

import '../../../../core/helpers/string_constant.dart';
import '../model/chat_message_model.dart';

abstract class ChatRemoteDataSource {
  Stream<List<ChatMessageModel>> getMessages(String? chatId);
  Future<List<MentorshipModel>> getAllChat();
  Future<void> sendMessage(String? chatId, ChatMessageModel message);
}

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Stream<List<ChatMessageModel>> getMessages(String? chatId) {
    return FirebaseHelper.firestoreInstance
        .collection(mentorshipCollection)
        .doc(chatId ?? AppController.instance.getUserModel().id)
        .collection(messageCollection)
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMessageModel.fromJson(doc.data());
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String? chatId, ChatMessageModel message) async {
    final parentDocId = chatId ?? AppController.instance.getUserModel().id;

    final parentDoc = FirebaseHelper.firestoreInstance
        .collection(mentorshipCollection)
        .doc(parentDocId);

    await parentDoc.set({'exists': true}, SetOptions(merge: true));

    await parentDoc
        .collection(messageCollection)
        .doc(message.id)
        .set(message.toJson());
  }

  @override
  Future<List<MentorshipModel>> getAllChat() async {
    final response = await FirebaseHelper.getData(
      collection: mentorshipCollection,
      filters: [
        FilterModel(
          field:
              AppController.instance.getUserModel().type == UserType.contributor
                  ? 'contributorId'
                  : 'userId',
          value: AppController.instance.getUserModel().id,
          type: FilterType.equals,
        ),
        FilterModel(
          field: 'status',
          value: 'approve',
          type: FilterType.equals,
        ),
      ],
    );

    List<MentorshipModel> mentorshipList = [];

    for (final element in response.docs) {
      mentorshipList.add(
        MentorshipModel.fromJson(
          element.data(),
        ),
      );
    }

    List<MentorshipModel> finalList = [];

    for (final element in mentorshipList) {
      final userResponse = await FirebaseHelper.getData(
        collection: userCollection,
        filters: [
          FilterModel(
            field: 'id',
            value: element.userId,
            type: FilterType.equals,
          ),
        ],
      );
      final contributorResponse = await FirebaseHelper.getData(
        collection: userCollection,
        filters: [
          FilterModel(
            field: 'id',
            value: element.contributorId,
            type: FilterType.equals,
          ),
        ],
      );
      MentorshipModel finalMentorshipModel = element;
      if (userResponse.docs.isNotEmpty) {
        finalMentorshipModel = finalMentorshipModel.copyWith(
          userModel: UserModel.fromJson(
            userResponse.docs.first.data(),
          ),
        );
      }
      if (contributorResponse.docs.isNotEmpty) {
        finalMentorshipModel = finalMentorshipModel.copyWith(
          contributorModel: UserModel.fromJson(
            contributorResponse.docs.first.data(),
          ),
        );
      }
      finalList.add(finalMentorshipModel);
    }

    return finalList;
  }
}
