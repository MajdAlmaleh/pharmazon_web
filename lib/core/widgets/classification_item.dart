import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/assets.dart';

class ClassificationItem extends StatelessWidget {
  const ClassificationItem({
    super.key,
    required this.classificotionName,
  });

  final String classificotionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: kAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kMedicinesView,
              extra: classificotionName,
            );
          },
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      AssetsData.medicine2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kAppColor,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  classificotionName,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
