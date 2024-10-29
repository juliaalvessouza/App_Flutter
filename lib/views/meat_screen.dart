import 'package:app_flutter/providers/meat_provider.dart';
import 'package:app_flutter/views/widgets/category_widget.dart';
import 'package:app_flutter/views/widgets/meats_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeatScreen extends StatefulWidget {
  const MeatScreen({super.key});

  @override
  State<MeatScreen> createState() => _MeatScreenState();
}

class _MeatScreenState extends State<MeatScreen> {
  @override
  void initState() {
    super.initState();
    final meatProvider = Provider.of<MeatProvider>(context, listen: false);
    meatProvider
        .fetchMeats(); // Assumindo que existe uma função fetchMeats no MeatProvider
  }

  @override
  Widget build(BuildContext context) {
    final meatProvider = Provider.of<MeatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Receitas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: meatProvider.allMeats.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: meatProvider.allMeats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MeatsDetails(
                              meals: meatProvider.allMeats[index],
                            ),
                          ));
                        },
                        child:
                            CategoryWidget(meal: meatProvider.allMeats[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
