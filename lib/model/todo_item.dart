class TodoItem {
  final int id;
  final String message;
  final Status status;

  TodoItem({
    required this.id,
    required this.message,
    required this.status,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoItem &&
        other.id == id &&
        other.message == message &&
        other.status == status;
  }

  @override
  int get hashCode => message.hashCode ^ status.hashCode ^ id.hashCode;

  TodoItem copyWith({
    Status? status,
  }) {
    return TodoItem(
      id: id,
      message: message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'message': message, 'status': status.index};
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
        id: map['id'],
        message: map['message'],
        status: Status.values[map['status']]);
  }
}

enum Status {
  pending,
  completed,
  deleted,
}
