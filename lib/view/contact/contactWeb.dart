import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peach_black/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../resource/colors.dart';
import '../../services/translation_service.dart';

class ContactWeb extends ConsumerStatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends ConsumerState<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppClass().getMqWidth(context) * 0.03,
        right: AppClass().getMqWidth(context) * 0.03,
        top: AppClass().getMqHeight(context) * 0.03,
        bottom: AppClass().getMqHeight(context) * 0.05
      ),
      padding: EdgeInsets.only(top: 30, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''04.''',
                    style: TextStyle(color: AppColors().neonColor, fontSize: 15, fontFamily: 'sfmono'),
                  ),
                  Text(
                    ' ${'WHATS_NEXT'.tr}',
                    style: TextStyle(color: AppColors().neonColor, fontSize: 18, fontFamily: 'sfmono'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'GET_IN_TOUCH'.tr,
                  style: GoogleFonts.robotoSlab(
                    color: AppColors().textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 55,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: AppClass().getMqWidth(context) * 0.45,
                  child: Text(
                    'END_TXT'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: AppColors().textLight,
                      letterSpacing: 1,
                      height: 1.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 70),
                child: InkWell(
                  onTap: () {
                    showWebMessageDialog(context);
                  },
                  child: Container(
                    height: AppClass().getMqHeight(context) * 0.09,
                    width: AppClass().getMqWidth(context) * 0.15,
                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: AppColors().neonColor, width: 1.5)),
                    child: Center(
                      child: Text('SAY_HELLO'.tr, style: TextStyle(color: AppColors().neonColor, fontSize: 13, letterSpacing: 1, fontWeight: FontWeight.bold, fontFamily: 'sfmono')),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                'BUILT_BY'.tr,
                style: TextStyle(color: AppColors().textColor, fontSize: 12, fontFamily: 'sfmono'),
              ),
            ],
          )
        ],
      ),
    );
  }

  showWebMessageDialog(context) {
    final nameController = TextEditingController();
    final contactInfoController = TextEditingController();
    final msgController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: AppColors().primaryColor,
              titleTextStyle: TextStyle(color: AppColors().neonColor, fontSize: 18, fontFamily: 'sfmono'),
              title: Row(
                children: [Expanded(flex: 9, child: Text('CONTACT_ME'.tr)), IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: AppColors().textColor))],
              ),
              content: Consumer(builder: (context, ref, child) {
                bool isLoading = ref.watch(progressProvider);
                return Stack(
                  children: [
                    Container(
                      color: AppColors().primaryColor,
                      width: AppClass().getMqWidth(context) * 0.5,
                      height: AppClass().getMqHeight(context) * 0.7,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'NAME_ERROR'.tr;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'NAME_FIELD'.tr,
                                errorStyle: TextStyle(color: AppColors().neonColor),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors().neonColor)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextField(
                                controller: contactInfoController,
                                decoration: InputDecoration(
                                  hintText: 'CONTACT_INFO'.tr,
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextFormField(
                                controller: msgController,
                                maxLines: 8,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'MESSAGE_ERROR'.tr;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'MESSAGE_FIELD'.tr,
                                  errorStyle: TextStyle(color: AppColors().neonColor),
                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors().neonColor)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'NOTE_TEXT'.tr,
                                    style: TextStyle(fontSize: AppClass().getMqWidth(context) * 0.01, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          ref.read(progressProvider.notifier).state = true;
                                          AppClass().sendEmail(nameController.text, contactInfoController.text, msgController.text).then((value) {
                                            if (value) {
                                              Navigator.pop(context);
                                              AppClass().showSnackBar('MESSAGE_SUCCESS'.tr, context: context);
                                            } else {
                                              Navigator.pop(context);
                                              AppClass().showSnackBar('MESSAGE_FAILURE'.tr, context: context);
                                            }
                                            ref.read(progressProvider.notifier).state = false;
                                          }).onError((error, stackTrace) {
                                            Navigator.pop(context);
                                            AppClass().showSnackBar('ERROR_OCCURRED'.tr, context: context);
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppClass().getMqHeight(context) * 0.06,
                                        width: AppClass().getMqWidth(context) * 0.08,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: AppColors().neonColor, width: 1.5)),
                                        child: Center(
                                          child: Text('SEND'.tr, style: TextStyle(color: AppColors().neonColor, fontSize: 13, letterSpacing: 1, fontWeight: FontWeight.bold, fontFamily: 'sfmono')),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLoading,
                      child: Container(
                          width: AppClass().getMqWidth(context) * 0.5,
                          height: AppClass().getMqHeight(context) * 0.7,
                          color: Colors.transparent,
                          child: Center(child: CircularProgressIndicator(color: AppColors().neonColor))),
                    ),
                  ],
                );
              }),
            ));
  }
}
