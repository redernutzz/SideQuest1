
class MyUser{
  //defining the attributes of a user
  String userId;
  String email;
  String name;
  String password;
  
  bool isAdmin;

  MyUser({
    //makes sure a user must have each of these qualities
    required this.userId,
    required this.email,
    required this.password,
    required this.name,
    required this.isAdmin
  });

  static final empty = MyUser( //making a default empty user object
    userId: '', 
    email: '', 
    name: '', 
    password: '', 
    isAdmin: false,
  );

  MyUserEntity toEntity(){ 
    //Converts MyUser object into a MyUserEntity (JSON Map) (for database storage).
    return MyUserEntity(
      userId: userId, 
      email: email, 
      name: name, 
      password: password, 
      isAdmin: isAdmin,
    );
  }

  static MyUser fromEntity(MyUserEntity entity){
    return MyUser(
      //Creating a MyUser object based from the MyUserEntity attributes (from the database)
      userId: userId, 
      email: email, 
      name: name, 
      password: password, 
      isAdmin: isAdmin,
    );   
  }

  @override
  String toString(){
    return 'MyUser: $userId, $email, $name, $password, $isAdmin';
  }

}