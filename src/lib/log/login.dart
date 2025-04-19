import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import './signup.dart';
import '../main.dart';

class LogIn extends StatelessWidget {
  var emailControl = TextEditingController();

  var passControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeCubit(),
      child: BlocConsumer<ChangeCubit, States>(
        listener: (context, state) {
          if (ChangeCubit.get(context).isPasswordShow)
            print(
                'trueState ${ChangeCubit.get(context).isPasswordShow}'); //those if only for checkin which state i'm on and we send ${state.isPasswordShow}
          if (!ChangeCubit.get(context).isPasswordShow)
            print(
                'falseState ${ChangeCubit.get(context).isPasswordShow}'); // to show that we can send data with each state
        },
        builder: (context, state) {
          return Material(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                right: 10.0,
                left: 10,
                bottom: 10,
                top: 35,
              ),
              padding: EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Form(
                  //through onlly this widget you can validate inputs data
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'times',
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: emailControl,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                            labelText: 'Email Adress',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                            )),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'email address must not be empty';
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: passControl,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ChangeCubit.get(context).isPasswordShow,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                                      ChangeCubit.get(context).isPasswordShow
                                          ? Icons.visibility_off
                                          : Icons.visibility) !=
                                  null
                              ? IconButton(
                                  onPressed: () {
                                    ChangeCubit.get(context).isPasswordShow =
                                        !ChangeCubit.get(context)
                                            .isPasswordShow;
                                  },
                                  icon: Icon(
                                    ChangeCubit.get(context).isPasswordShow
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                )
                              : null,
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main(),
                              ));
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 90,
                        child: Center(
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an acount?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times',
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'times',
                                  fontSize: 15,
                                ),
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
