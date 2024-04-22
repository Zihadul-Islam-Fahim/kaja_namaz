
class UserProfile {
  UserProfile({
      String? name, 
      String? email,}){
    _name = name;
    _email = email;
}

  UserProfile.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
  }
  String? _name;
  String? _email;
UserProfile copyWith({  String? name,
  String? email,
}) => UserProfile(  name: name ?? _name,
  email: email ?? _email,
);
  String? get name => _name;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }

}