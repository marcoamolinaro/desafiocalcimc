import 'package:desafiocalcimc/pages/list_view_calculadora_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [ListViewCalcudoraPage()],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                  debugPrint("Valor $value");
                  if (value == 1) {
                    debugPrint("Saindo do aplicativo $value");
                    Navigator.pop(context);
                  }
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Calculadora", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Sair", icon: Icon(Icons.exit_to_app)),
                ])
          ],
        ),
      ),
    );
  }
}
