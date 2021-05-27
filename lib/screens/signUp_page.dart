import 'package:flutter/material.dart';
import 'package:movie_app/database/database_helper.dart';
import 'package:movie_app/model/user_data_model.dart';
import 'package:movie_app/screens/SignIn_page.dart';
import 'package:movie_app/translations/locale_keys_g.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name;
  String? password;
  String? emailId;
  String? number;
  String? profession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.key_sign_up.tr(),
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                LocaleKeys.key_create_an_account.tr(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.key_password_error.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                          labelText: LocaleKeys.key_name.tr(),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.key_please_enter_valid_email.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        emailId = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: LocaleKeys.key_email.tr(),
                          //errorText: "Please fill your email address",
                          hintText: "name@example.com",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.key_password_error.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: LocaleKeys.key_password.tr(),
                          //  errorText: "Create a passowrd",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.key_phone_number_error.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        number = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: LocaleKeys.key_phone_number.tr(),
                          //  errorText: "Please tell us your number",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      hint: Text(LocaleKeys.key_profession.tr()),
                      validator: (value) {
                        if (value == "select") {
                          return LocaleKeys.key_profession.tr();
                        }
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Select"), value: "Select"),
                        DropdownMenuItem(
                            child: Text("Employee"), value: "Employee"),
                        DropdownMenuItem(
                            child: Text("Student"), value: "Student"),
                        DropdownMenuItem(
                            child: Text("Civil Servant"),
                            value: "Civil Servant"),
                        DropdownMenuItem(
                            child: Text("Teacher"), value: "Teacher"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          profession = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserData userData = UserData(
                          name: name,
                          emailId: emailId,
                          password: password,
                          number: number,
                          profession: profession);
                      await UserDatabase.instance.create(userData);
                      _showPopUpMessage();
                    }
                  },
                  child: Text(LocaleKeys.key_sign_up.tr()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Select your language"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await context.setLocale(Locale('en'));
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SignUpPage();
                      }));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Text("English"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await context.setLocale(Locale('hi'));
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SignUpPage();
                      }));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Text("Hindi"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          locale: context.locale,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2030),
                        );
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        size: 40,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 80,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.key_already_have_account.tr(),
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }

  void _showPopUpMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(LocaleKeys.key_registration_succesfull.tr()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "SignInPage");
                },
                child: Text("OK")),
          ],
        );
      },
    );
  }
}
