import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/medicines_view_body.dart';


class MedicinesView extends StatelessWidget {
  final String classificationName;
  const MedicinesView({super.key, required this.classificationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classificationName),
      ),
      body:  MedicinesViewBody(classificationName: classificationName,),
    );
  }
}
