abstract class Success {}

final class ServerSuccess extends Success {
  final String message;

  ServerSuccess({required this.message});
}
