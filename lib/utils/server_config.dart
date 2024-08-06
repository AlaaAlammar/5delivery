// ignore_for_file: constant_identifier_names

class ServerConfig {
  static const domainNameServer = 'http://192.168.137.1:8000';

  /////////////////////////////
  static const login = '/api/auth/login';
  static const register = '/api/auth/register';
  //////////////////////////////
  //admin

  static const allgroups = '/api/auth/indexGroup';
  static const deletegroup = '/api/auth/Deletegroup/';
  static const addgroup = '/api/auth/AddGroup';

  static const getalluserby = '/api/auth/allUser/';
  static const deleteuser = '/api/auth/';
  static const getallusers = '/api/auth/allUser';
  static const adduser = '/api/auth/';

  static const report = '/api/auth/allReport';
}
