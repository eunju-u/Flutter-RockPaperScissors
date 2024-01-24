import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/widget/cpu_input.dart';
import 'package:rock_paper_scissor/widget/game_result.dart';
import 'package:rock_paper_scissor/widget/user_input.dart';

import 'enum.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone; /// 사용자 선택 여부
  InputType? _userInput; /// 사용자가 선택한 가위, 바위, 보
  late InputType _cpuInput; ///랜덤으로 노출되는 가위, 바위, 보

  @override
  void initState() {
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(child: GameResult(isDone: isDone, result: getResult(), callback: reset,)),
        Expanded(child: UserInput(isDone: isDone, callback: setUserInput, userInput: _userInput)),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  /// 랜덤으로 가위, 바위, 보 선택
  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  /// 다시하기 클릭시 호출
  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

  /// 게임 결과 값 출력
  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }
  }
}
