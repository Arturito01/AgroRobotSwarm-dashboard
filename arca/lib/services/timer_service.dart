class TimerService {
  static var shared = TimerService();

  Future<void> executeOnceSyncAfter(int seconds, Function callback) async {
    await Future.delayed(Duration(seconds: seconds), () async {
      await callback.call();
    });
  }
}