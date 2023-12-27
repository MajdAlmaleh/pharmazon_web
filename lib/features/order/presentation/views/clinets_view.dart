import 'package:flutter/material.dart';

import 'widgets/clients_view_body.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClientsViewBody(),
    );
  }
}
