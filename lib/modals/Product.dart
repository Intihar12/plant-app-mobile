
final String tableNotes='notes';

class NoteFields{
  static final List<String> values=[
    id, isImportant,number,title,desciption,time
  ];

  static final String id= '_id';
  static final String isImportant='isImportant';
  static final String number='numbar';
  static final String title='title';
  static final String desciption='description';
  static final String time='time';
}

class Note{
   int? id=0;
   bool isImportant=true;
  int number=0;
   String title="";
   String description="";
   DateTime createdTime;


Note({this.id, required  this.isImportant, required this.number, required this.title,
  required this.description,required this.createdTime });

Note copy({
  int? id,
  bool? isImportant,
  int? number,
  String? title,
  String? description,
  DateTime? createdTime,
})=>
    Note(
        id:id ?? this.id,
    isImportant: isImportant ?? this.isImportant,
      number: number ?? this.number,
      title: title ?? this.title,
      description:  description ?? this.description,
      createdTime: createdTime ?? this.createdTime
    );
static Note fromJson(Map<String, Object?>Json)=>Note(
  id: Json[NoteFields.id] as int?,
  isImportant:  Json[NoteFields.isImportant]==1,
  number: Json[NoteFields.number] as int,
  title: Json[NoteFields.title] as String,
  description: Json[NoteFields.desciption] as String,
  createdTime: DateTime.parse(Json[NoteFields.time] as String)

);

Map<String, Object?> toJson()=>{
  NoteFields.id: id,
  NoteFields.isImportant: isImportant ? 1 : 0,
  NoteFields.number: number,
  NoteFields.title:title,
  NoteFields.desciption:description,
  NoteFields.time:createdTime.toIso8601String()

};

}