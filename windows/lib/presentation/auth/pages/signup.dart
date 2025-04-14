import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/common/widgets/button/basic_app_button.dart';
import 'package:Payirseai/data/core/configs/assets/app_vectors.dart';
import 'package:Payirseai/data/models/auth/create_user_req.dart';
import 'package:Payirseai/domain/usecases/auth/signup.dart';
import 'package:Payirseai/presentation/auth/pages/signin.dart';
import 'package:Payirseai/presentation/home/pages/home.dart';
import 'package:Payirseai/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  Future<void> _saveUserName(String fullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35,
          width: 35,
        ),
        
      ),
      body: Stack(
        children:[
          Positioned.fill(child: Opacity(opacity: 0.1,child:Image.asset('assets/appimages/abi.png',fit: BoxFit.fill,),), ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
            child: Column(
              
              children: [
                _registerText(),
                const SizedBox(height: 20),
                _fullNameField(context,),
                const SizedBox(height: 20),
                _emailFeild(context, ),
                const SizedBox(height: 20),
                _passwordField(context,),
                const SizedBox(height: 20),
                BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                          fullName: _fullName.text.toString(),
                          email: _email.text.toString(),
                          password: _password.text.toString()
                        ) 
                      );
                      result.fold(
                        (l){
                          var snackbar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        (r)async{
                          await _saveUserName(_fullName.text.toString());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const HomePage() ),
                            (route) => false);
                        });
                    },
                    title: 'Create Account'
                    ),
                const SizedBox(height: 10,),
                _signinText(context),
                
              ],
            ),
          ),
        ],
        ),
      
    );
  }
  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
    );
  }

  Widget _fullNameField(BuildContext context){

    return TextField(
      
      controller: _fullName,
      
      decoration: InputDecoration(
        hintText: 'Full Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      );
    
  }

  Widget _emailFeild(BuildContext context){

    return TextField(
      controller: _email,
      decoration:  InputDecoration(
        hintText: 'Enter Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      )
      );
    
  }

  Widget _passwordField(BuildContext context){

    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      )
      );
    
  }

  Widget _signinText(BuildContext context){

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do You Have An Account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 14
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => SigninPage()));
            }, 
            child: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.blue
              ),
            ))
        ],
      ),
    );

  }


  
}