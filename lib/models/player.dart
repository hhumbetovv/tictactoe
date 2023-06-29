class PlayerModel {
  final String _nick;
  final String _value;
  int _point = 0;

  PlayerModel({
    required String nick,
    required String value,
    int point = 0,
  })  : _nick = nick,
        _value = value,
        _point = point;

  Map<String, dynamic> toJson() {
    return {
      'nick': _nick,
      'point': _point,
      'value': _value,
    };
  }

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      nick: json['nick'],
      value: json['value'],
      point: json['point'] as int,
    );
  }

  String get nick => _nick;
  String get value => _value;
  int get point => _point;

  void increasePoint() {
    _point++;
  }
}
