import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/core/widgets/primary_button_widget.dart';
import 'package:meals_app/core/widgets/primary_textfield_widget.dart';
import 'package:meals_app/features/home/model/db_helper.dart';
import 'package:meals_app/features/home/model/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddMealScreen();
}

class _AddMealScreen extends State<AddMealScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(Object context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text("Add Meal", style: AppStyle.black16Medium),
          centerTitle: true,
        ),
        body:
            isLoading == true
                ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                )
                : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 28),
                          Text(
                            "Meal Name",
                            style: AppStyle.black16Medium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryTextfieldWidget(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be Empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          Text(
                            "Image URL",
                            style: AppStyle.black16Medium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryTextfieldWidget(
                            maxLines: 4,
                            controller: urlController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be Empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          Text(
                            "Rate",
                            style: AppStyle.black16Medium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryTextfieldWidget(
                            inputType: TextInputType.number,
                            controller: rateController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be Empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          Text(
                            "Time",
                            style: AppStyle.black16Medium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryTextfieldWidget(
                            inputType: TextInputType.number,
                            controller: timeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be Empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          Text(
                            "Description",
                            style: AppStyle.black16Medium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryTextfieldWidget(
                            maxLines: 4,
                            controller: descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Cannot be Empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 70),

                          PrimaryButtonWidget(
                            buttonText: "Save",
                            textColor: AppColors.white,
                            buttonColor: AppColors.primary,
                            borderRadius: 100.0,
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                Meal meal = Meal(
                                  name: nameController.text,
                                  imageUrl: urlController.text,
                                  rate: double.parse(rateController.text),
                                  time: timeController.text,
                                  description: descriptionController.text,
                                );
                                databaseHelper.insertMeals(meal).then((meals) {
                                  isLoading = false;
                                  setState(() {});
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
