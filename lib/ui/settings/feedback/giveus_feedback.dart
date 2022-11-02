import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/repo/remote/giveus_feedback_repository.dart';
import 'package:online_shop/ui/settings/feedback/bloc/giveus_feedback_bloc.dart';
import 'package:online_shop/ui/widgets/image_local.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';
import 'package:online_shop/ui/widgets/text_input.dart';

TextEditingController _usernameContoroller = TextEditingController();
TextEditingController _subjectContoroller = TextEditingController();
TextEditingController _emailContoroller = TextEditingController();
TextEditingController _messageContoroller = TextEditingController();

class GiveUsFeedBack extends StatelessWidget {
  const GiveUsFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          titleSpacing: 20,
          title: Text("Give us feedback",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 20))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 200,
                    width: 200,
                    child: LocalImageService(
                        localImageAddres: "assets/svg/feed_back.svg",
                        imageSvgOrAnutherVersion: true),
                  ),
                  const SizedBox(height: 30),
                  TextInputWidgets(
                    controller: _emailContoroller,
                    hintTetx: "Enter your email address",
                  ),
                  const SizedBox(height: 20),
                  TextInputWidgets(
                    controller: _usernameContoroller,
                    hintTetx: "Enter your username",
                  ),
                  const SizedBox(height: 20),
                  TextInputWidgets(
                    controller: _subjectContoroller,
                    hintTetx: "Enter your subject",
                  ),
                  const SizedBox(height: 20),
                  TextInputWidgets(
                    controller: _messageContoroller,
                    maxLine: 4,
                    heightSize: 200,
                    hintTetx: "Enter your message",
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: BlocProvider(create: (BuildContext context) {
                    final bloc = GiveusFeedbackBloc(giveUsFeedBackReposioty);

                    bloc.stream.listen((state) {
                      if (state is GiveUsFeedBackEmptyTextFromFiled) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter all information")));
                      } else if (state is GiveUsFeedBackSuccess) {
                        clearAllTextFiled();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Thansk for share your feedback")));
                        Navigator.pop(context);
                      }
                    });

                    return bloc;
                  }, child:
                      BlocBuilder<GiveusFeedbackBloc, GiveusFeedbackState>(
                    builder: (BuildContext context, state) {
                      if (state is GiveUsFeedBackLoading) {
                        return const LoadingState();
                      } else if (state is GiveusFeedbackInitial ||
                          state is GiveUsFeedBackSuccess) {
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF2A2A2A))),
                          onPressed: () {
                            BlocProvider.of<GiveusFeedbackBloc>(context).add(
                                GiveUsFeedBackButtonClickedSendInformation(
                                    _emailContoroller.text,
                                    _messageContoroller.text,
                                    _subjectContoroller.text,
                                    _usernameContoroller.text));
                          },
                          child: const Text("Sned your feedback"),
                        );
                      } else {
                        throw "";
                      }
                    },
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void clearAllTextFiled() {
  _emailContoroller.clear();
  _usernameContoroller.clear();
  _subjectContoroller.clear();
  _messageContoroller.clear();
}
