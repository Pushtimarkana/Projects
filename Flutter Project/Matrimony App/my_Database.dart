import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class MatromonialDatabase{
  static const String TBL_NAME ='tbl_name';
  static const String USER_ID='UserId';
  static const String NAME = 'NAME';
  static const String ADDRESS = 'ADDRESS';
  static const String EMAIL = 'EMAIL';
  static const String PHONE='PHONE';
  static const String CITY='CITY';
  static const String DOB='DOB';
  static const String GENDER='GENDER';
  static const String HOBBY='HOBBY';
  static const String PASS='PASS';
  static const String CONPASS='CONPASS';
  static const String FAV='FAV';
  static const String ISVISIBLE='ISVISIBLE';


  int DB_VERSION =3;

  // region INIT DATABASE
  Future<Database> initDatabase() async {
    Database db = await openDatabase(
      '${await getDatabasesPath()}/Matrimony.db',
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE $TBL_NAME 
              ($USER_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
              $NAME TEXT NOT NULL, 
              $ADDRESS TEXT , 
              $EMAIL TEXT,
              $PHONE INTEGER,
              $CITY TEXT
              );''',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $DOB TEXT");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $GENDER TEXT");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $HOBBY TEXT");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $PASS TEXT");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $CONPASS TEXT");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $FAV INTEGER");
          db.execute("ALTER TABLE $TBL_NAME ADD COLUMN $ISVISIBLE INTEGER");
        }
      },
      version: DB_VERSION,
    );
    return db;
  }
  //endregion
}