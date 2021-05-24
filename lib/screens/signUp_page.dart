import 'package:flutter/material.dart';
import 'package:movie_app/database/database_helper.dart';
import 'package:movie_app/model/user_data_model.dart';
import 'package:movie_app/screens/SignIn_page.dart';

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
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Create an Account",
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
                        return "Please tell us your name";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Name", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please fill your Email Address";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      emailId = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email Address",
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
                        return "Create a Password";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        //  errorText: "Create a passowrd",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please tell us your number";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      number = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        //  errorText: "Please tell us your number",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Select a Profession"),
                    validator: (value) {
                      if (value == "select") {
                        return "Please Select the profession";
                      }
                    },
                    items: [
                      DropdownMenuItem(child: Text("Select"), value: "Select"),
                      DropdownMenuItem(
                          child: Text("Employee"), value: "Employee"),
                      DropdownMenuItem(
                          child: Text("Student"), value: "Student"),
                      DropdownMenuItem(
                          child: Text("Civil Servant"), value: "Civil Servant"),
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
                    Navigator.pop(context);
                  }
                },
                child: Text("Sign Up"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 100,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Already Have An Account? Log In Here",
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
