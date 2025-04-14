import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/common/widgets/button/basic_app_button.dart';
import 'package:Payirseai/data/core/configs/assets/app_vectors.dart';
import 'package:Payirseai/presentation/auth/pages/signin.dart';
import 'package:Payirseai/presentation/auth/pages/signup.dart';

class SignupOrSinginPage extends StatelessWidget {
  const SignupOrSinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        
      ),
      body: Stack(
        children: [
                  Positioned.fill(child: Opacity(opacity: 0.1,child:Image.asset('assets/appimages/abi.png',fit: BoxFit.fill,),), ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SvgPicture.asset(
                    AppVectors.logo,
                    height:70 ,
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Grow With Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Empower Your Farm, Empower Yourself',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 15
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: (){
                            Navigator.push(context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignupPage()
                              )
                            ); 
                          } 
                        , title: 'Register'),
                      ),
                      const SizedBox(width: 30,),
                      Expanded(
                        flex: 1,
                        child: TextButton(onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()
                              )
                            );
                        },
                         child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black
                          ),
                          ),
                        ),
                      )
                    ],
                  )
                ]
              
              ),
            ),

          
        ],
      )

    );
  }
}
          
          
          
            
              