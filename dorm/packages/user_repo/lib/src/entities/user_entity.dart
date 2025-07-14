class MyUserEntity{
  //defining the attributes of a user
  String userId;
  String email;
  String name;
  String password;
  
  bool isAdmin;

  MyUserEntity({
    //makes sure a user must have each of these qualities
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    required this.isAdmin
  });

  Map<String, Object?> toDocument(){
      return {
      'userId': userId, 
      'email': email, 
      'name': name, 
      'password': password, 
      'isAdmin': isAdmin,
      };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc){
    return MyUserEntity(
      email: doc['email'],
      userId: doc['userId'],
      name: doc['name'],
      isAdmin: doc['isAdmin']

    );


  }









}