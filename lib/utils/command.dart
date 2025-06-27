import '/utils/result.dart';
import 'package:flutter/material.dart';

typedef CommandAction0<Output> = Future<Result<Output>> Function();
typedef CommandAction1<Output, Input> = Future<Result<Output>> Function(Input);

abstract class Command<Output> extends ChangeNotifier {
  Command();

  bool _running = false;
  Result<Output>? _result;

  bool get running => _running;
  Result<Output>? get result => _result;

  Future<void> _execute(CommandAction0<Output> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<Output> extends Command<Output> {
  final CommandAction0<Output> _action;

  Command0(this._action);

  Future<void> execute() => _execute(_action);
}

class Command1<Output, Input> extends Command<Output> {
  final CommandAction1<Output, Input> _action;

  Command1(this._action);

  Future<void> execute(Input input) async =>
      await _execute(() => _action(input));
}
