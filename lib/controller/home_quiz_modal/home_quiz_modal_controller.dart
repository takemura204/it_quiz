import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import 'home_quiz_modal_state.dart';

final homeQuizModalProvider = StateNotifierProvider.autoDispose<HomeQuizModalController,
    HomeQuizModalState>(
  (ref) => throw UnimplementedError(),
);

class HomeQuizModalController extends StateNotifier<HomeQuizModalState>
    with LocatorMixin, WidgetsBindingObserver {
  HomeQuizModalController({required this.ref,required this.quiz}) : super(const HomeQuizModalState()) {
    () async {
      await _initState();
    }();
  }

  final Ref ref;
  final Quiz quiz;
  final filterQuizItemListName = 'quiz_filter_quiz_item_list';
  final statusListName = 'quiz_status_list';
  final importanceListName = 'quiz_importance_list';
  final isRepeatName = 'quiz_is_repeat';
  final isSavedName = 'quiz_is_saved';
  final isWeakName = 'quiz_is_weak';
  final quizItemCountName = 'quiz_item_count';


  Future _initState() async {
    setIsLoading(true);
    // resetData();
    await _initStatusList();
    await _initImportanceList();
    await _initIsRepeat();
    await _initIsSaved();
    await _initIsWeak();
    await _initQuizCount();
    await updateFilterQuizList();
    setIsLoading(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///引数のquizItemListがselectedStatusListにない時、からにする。
  Future _initStatusList() async {
    final quizItemList = quiz.quizItemList;
    final statusList = [
      StatusType.unlearned,
      StatusType.learned,
      StatusType.incorrect,
      StatusType.correct,
    ];
    final prefs = await SharedPreferences.getInstance();
    final statusListData = prefs.getStringList(statusListName);
    final List<StatusType> updatedStatusList = [];
    if (statusListData != null && statusListData.isNotEmpty) {
      final localStatusList = statusListData.map((e) => StatusTypeExtension.fromJson(e)).toList();
      for (var status in localStatusList) {
        if (quizItemList.any((quizItem) => quizItem.status == status)) {
          updatedStatusList.add(status);
        }
      }
    }
    state = state.copyWith(statusList: statusList, selectedStatusList: updatedStatusList);
  }



  Future _initImportanceList() async {
    final quizItemList = quiz.quizItemList;
    final importanceList = [
      ImportanceType.high,
      ImportanceType.normal,
      ImportanceType.low,
      ImportanceType.none,
    ];
    final prefs = await SharedPreferences.getInstance();
    final importanceListData = prefs.getStringList(importanceListName);
    final List<ImportanceType> updatedImportanceList = [];

    if (importanceListData != null && importanceListData.isNotEmpty) {
      final localImportanceList =
      importanceListData.map((e) => ImportanceTypeExtension.fromJson(e)).toList();
      for (var importance in localImportanceList) {
        if (quizItemList.any((quizItem) => quizItem.importance == importance)) {
          updatedImportanceList.add(importance);
        }
      }
    }
    state = state.copyWith(
        importanceList: importanceList, selectedImportanceList: updatedImportanceList);
  }

  Future _initIsRepeat() async {
    final prefs = await SharedPreferences.getInstance();
    final isRepeatData = prefs.getBool(isRepeatName);
    if (isRepeatData != null) {
      state = state.copyWith(isRepeat: isRepeatData);
      // ref.read(homeStudyScreenProvider.notifier).setIsRepeat(state.isRepeat);
    }
  }

  Future _initIsSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final isSavedData = prefs.getBool(isSavedName);
    if (isSavedData != null) {
      state = state.copyWith(isSaved: isSavedData);
    }
  }

  Future _initIsWeak() async {
    final prefs = await SharedPreferences.getInstance();
    final isWeakData = prefs.getBool(isWeakName);
    if (isWeakData != null) {
      state = state.copyWith(isWeak: isWeakData);
    }
  }

  Future _initQuizCount() async {
    final prefs = await SharedPreferences.getInstance();
    final quizItemCountData = prefs.getInt(quizItemCountName);
    if (quizItemCountData != null) {
      state = state.copyWith(quizItemCount: quizItemCountData);
    }
  }

  ///Status絞り込み
  void updateStatusQuizList(StatusType status) {
    final selectedStatusList = [...state.selectedStatusList];
    if (selectedStatusList.contains(status)) {
      selectedStatusList.remove(status);
    } else {
      selectedStatusList.add(status);
    }

    state = state.copyWith(selectedStatusList: selectedStatusList);
    updateFilterQuizList();
  }

  void updateAllStatusList() {
    state = state.copyWith(selectedStatusList: []);
    updateFilterQuizList();
  }

  ///Importance絞り込み
  void updateImportanceQuizList(ImportanceType importance) {
    final selectedImportanceList = [...state.selectedImportanceList];
    if (selectedImportanceList.contains(importance)) {
      selectedImportanceList.remove(importance);
    } else {
      selectedImportanceList.add(importance);
    }

    state = state.copyWith(selectedImportanceList: selectedImportanceList);
    updateFilterQuizList();
  }

  void updateAllImportanceList() {
    state = state.copyWith(selectedImportanceList: []);
    updateFilterQuizList();
  }

  void updateIsRepeat(bool value) {
    state = state.copyWith(isRepeat: value);
    updateFilterQuizList();
  }

  void updateIsSaved(bool value) {
    state = state.copyWith(isSaved: value);
    updateFilterQuizList();
  }

  void updateIsWeak(bool value) {
    state = state.copyWith(isWeak: value);
    updateFilterQuizList();
  }

  void updateQuizItemCount(int value) {

    final updateQuizItemCount = state.quizItemCount + value;
    if (updateQuizItemCount>=5 && updateQuizItemCount<=50) {
      state = state.copyWith(quizItemCount: updateQuizItemCount);
      updateFilterQuizList();
    }

  }

  Future updateFilterQuizList() async {
    final quizItemList = quiz.quizItemList;
    List<QuizItem> filterQuizItemList =[...quizItemList];

    // ステータスで絞り込み
    if (state.selectedStatusList.isNotEmpty) {
      filterQuizItemList =  filterQuizItemList
          .where((quizItem) => state.selectedStatusList.contains(quizItem.status))
          .toList();
    }

    // 重要度で絞り込み
    if (state.selectedImportanceList.isNotEmpty) {
      filterQuizItemList = filterQuizItemList
          .where((quizItem) => state.selectedImportanceList.contains(quizItem.importance))
          .toList();
    }

    // 保存で絞り込み
    if (state.isSaved) {
      filterQuizItemList = filterQuizItemList
          .where((item) => item.isSaved)
          .toList();
    }

    // 苦手で絞り込み
    if (state.isWeak) {
      filterQuizItemList = filterQuizItemList
          .where((item) => item.isWeak)
          .toList();
    }

    // リストをシャッフルしてから指定された数だけ抽出
    final quizItemCount =state.quizItemCount;
    filterQuizItemList = (filterQuizItemList..shuffle()).take(quizItemCount).toList();

    state = state.copyWith(filterQuizItemList: filterQuizItemList);
    _saveDevice();
  }

  Future resetFilterQuizList() async {
    await _initStatusList();
    await _initImportanceList();
    await _initIsRepeat();
    await _initIsSaved();
    await _initIsWeak();
    await _initIsWeak();
    updateFilterQuizList();
  }


  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setSelectedStudyTypeTabIndex(int index) {
    state = state.copyWith(selectedStudyTypeTabIndex: index);
  }

  void setStudyType(int index) {
    if (index == 0) {
      state = state.copyWith(selectedStudyType: StudyType.choice,selectedStudyTypeTabIndex:index);
    }else {
      state = state.copyWith(selectedStudyType: StudyType.learn,selectedStudyTypeTabIndex:index);
    }
  }


  /// 端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final filterQuizItemListData = state.filterQuizItemList.map((e) => json.encode(e.toJson())).toList();
    final statusListData = state.selectedStatusList.map((e) => e.name).toList();
    final importanceListData = state.selectedImportanceList.map((e) => e.name).toList();
    final isRepeat = state.isRepeat;
    final isSaved = state.isSaved;
    final isWeak = state.isWeak;
    final quizItemCount = state.quizItemCount;

    await prefs.setStringList(filterQuizItemListName, filterQuizItemListData);
    await prefs.setStringList(statusListName, statusListData);
    await prefs.setStringList(importanceListName, importanceListData);
    await prefs.setBool(isRepeatName, isRepeat);
    await prefs.setBool(isSavedName, isSaved);
    await prefs.setBool(isWeakName, isWeak);
    await prefs.setInt(quizItemCountName, quizItemCount);
  }

  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(filterQuizItemListName);
    prefs.remove(statusListName);
    prefs.remove(importanceListName);
  }
}
