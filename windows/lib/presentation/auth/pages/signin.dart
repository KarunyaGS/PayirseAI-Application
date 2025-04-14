import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/common/widgets/button/basic_app_button.dart';
import 'package:Payirseai/data/core/configs/assets/app_vectors.dart';
import 'package:Payirseai/data/models/auth/signin_user_req.dart';
import 'package:Payirseai/domain/usecases/auth/signin.dart';
import 'package:Payirseai/presentation/auth/pages/signup.dart';
import 'package:Payirseai/presentation/home/pages/home.dart';
import 'package:Payirseai/service_locator.dart';


class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35,
          width: 35,
          
        ),
      ),
      body:  Stack(
        children: [
          Positioned.fill(child: Opacity(opacity: 0.1,child:Image.asset('assets/appimages/abi.png',fit: BoxFit.fill,),), ),
         Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(
                height: 20,
              ),
              
               const SizedBox(height: 20),
              _emailFeild(context),
              const SizedBox(height: 20,),
              _passwordField(context),
              const SizedBox(height: 20,),
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                      
                      email: _email.text.toString(),
                      password: _password.text.toString()
                    ) 
                  );
                  result.fold(
                    (l){
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const HomePage() ),
                        (route) => false);
                    });
                },
                title: 'Sign In'
                ),
                _signupText(context)
            ],
          ),
        ),
        ],
      ),
    );
  }
  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
    );
  }

 

  Widget _emailFeild(BuildContext context){

    return TextField(
      controller: _email,
      decoration: InputDecoration(
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
      ),
      );
    
  }

  Widget _signupText(BuildContext context){

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 14
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => SignupPage()));
            }, 
            child: const Text(
              'Register Now',
              style: TextStyle(
                color: AppColors.primary
              ),
            ))
        ],
      ),
    );

  }


  
}