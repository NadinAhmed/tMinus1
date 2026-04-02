abstract class RemoteFailure {
  final String message;
  const RemoteFailure(this.message);
}

class NetworkFailure extends RemoteFailure {
  const NetworkFailure(super.message);
}

class ServerFailure extends RemoteFailure {
  const ServerFailure(super.message);
}

class UnexpectedFailure extends RemoteFailure {
  const UnexpectedFailure(super.message);
}