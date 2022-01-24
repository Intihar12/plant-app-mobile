class students{
  String name="";
  String email="";
  String password="";


  students({required this.name,required this.email,required this .password});

  factory students.fromJson(Map<dynamic,dynamic> parsedJson) {
    return students(
        name:parsedJson['Name'],
        email: parsedJson['icon'],
        password:parsedJson['PreptimeInMins']);
  }


  static List<students> parserecipes(recipeJSON){
    var rList=recipeJSON['browseRecipes'] as List;

    List<students> recipeList=rList.map((data) => students.fromJson(data)).toList();  //Add this
    return recipeList;                           //And this
  }

}





/*
class StudentsList{
  late List<students> studentsList;


StudentsList({required this.studentsList});
  factory StudentsList.fromJSON(Map<dynamic,dynamic> json){
    return StudentsList(
        studentsList: parserecipes(json)
    );


  }
}
static List<students> parserecipes(recipeJSON){
var rList=recipeJSON['users'] as List;

}
*/
