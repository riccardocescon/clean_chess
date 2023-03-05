abstract class NetState {
  const NetState();
}

class NetInitial extends NetState {}

class NetLoading extends NetState {}

class NetLoaded<T> extends NetState {
  final T data;

  const NetLoaded(this.data);
}

class NetError extends NetState {
  final String message;

  const NetError(this.message);

  @override
  List<Object> get props => [message];
}
