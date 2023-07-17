class User {
  final String email;
  final String password;
  final String username;
  final String userBio;
  final String imageUrl;
  final String uid;
  final List<String> followers;
  final List<String> following;
  const User({
    required this.email,
    required this.password,
    required this.username,
    required this.userBio,
    required this.imageUrl,
    required this.uid,
    required this.followers,
    required this.following,
  });

  
 Map<String,dynamic> userToJsonMap(User user) {
    return {
      "email": user.email,
      "password": user.password,
      "username": user.username,
      "userBio": user.userBio,
      "imageUrl": user.imageUrl,
      "uid": user.uid,
      "followers": user.followers,
      "following": user.following,
    };
  }
}
