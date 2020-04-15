abstract class AuthServicePage {
  bool validateAndSave(formKey);
  Future<bool> saveInDataBase(String name, String age, String weight);
}

class BaseAuth implements AuthServicePage {
  bool validateAndSave(formKey) {
    final form = formKey.currentState;
    if (form.validate()) {
      //if you don't save the form , it returns null for both email and password
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveInDataBase(String name, String age, String weight) {}
}
