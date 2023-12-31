import 'dart:core';

import 'package:expenso_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  var USER_TABLE = "user";
  var USER_COLUMN_ID = "uid";
  var USER_COLUMN_EMAIL = "email";
  var USER_COLUMN_PASSWORD = "password";

  Future<Database> openDB() async {
    //directory path
    var mDirectory = await getApplicationDocumentsDirectory();

    //created the path
    await mDirectory.create(recursive: true);

    var dbPath = "$mDirectory/mainDB.db";

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      var createTableQuery =
          "create table $USER_TABLE ($USER_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_EMAIL text unique, $USER_COLUMN_PASSWORD text)";
      await db.execute(createTableQuery);
    });
  }

  Future<bool> createUser(UserModel user) async {
    var db = await openDB();
    if (await checkIfEmailAlreadyExists(user.email)) {
      return false;
    } else {
      var check = await db.insert(USER_TABLE, user.toMap());
      return check > 0;
    }

    var check = await db.insert(USER_TABLE, user.toMap());
    return check > 0;
  }

  Future<bool> checkIfEmailAlreadyExists(String email) async {
    var db = await openDB();

    var check = await db
        .query(USER_TABLE, where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check.isNotEmpty;
  }

  Future<bool> authenticateUser({required String email, required String password}) async {
    var db = await openDB();
    var check = await db.query(USER_TABLE,
        where: "$USER_COLUMN_EMAIL = ? and $USER_COLUMN_PASSWORD = ?",
        whereArgs: [email, password]);
    return check.isNotEmpty;
  }

  //reset password
  //forget password

  Future<bool> forgetPassword(String email) async {
    return await checkIfEmailAlreadyExists(email);
  }

  Future<bool> resetPassword(String newPassword, String email) async {
    var db = await openDB();
    var check = await db.update(USER_TABLE, {USER_COLUMN_PASSWORD : newPassword}, where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check>0;
  }
}
