import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final List<String> _routes = ['/', '/projects', '/contact'];
  final List<String> _titles = ['Home', 'Projects', 'Contact'];

  int _getSelectedIndex(BuildContext context) {
    final String? route = ModalRoute.of(context)?.settings.name;
    final int index = _routes.indexOf(route ?? '/');
    return index >= 0 ? index : 0;
  }

  void _navigate(BuildContext context, int index) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != _routes[index]) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _getSelectedIndex(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Container(
            width: double.infinity,
           // color: Colors.yellow,
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 250,
                  height: 200,
                ),
                Positioned(
                  right: 0.0,
                  top: 40.0,
                  child: ToggleButtons(
                    isSelected:
                        List.generate(_titles.length, (i) => i == selectedIndex),
                    onPressed: (int index) => _navigate(context, index),
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    color: Colors.black87,
                    children: _titles
                        .map((title) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child:
                                  Text(title, style: const TextStyle(fontSize: 16)),
                            ))
                        .toList(),
                  ),
                ),
                
              ],
            ),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset(
                  'assets/logo.png',
                  width: 250,
                  height: 100,
                ),
              ),
              PopupMenuButton<int>(
                icon: const Icon(Icons.menu, color: Colors.black87),
                onSelected: (index) => _navigate(context, index),
                itemBuilder: (context) => List.generate(
                  _titles.length,
                  (i) => PopupMenuItem(
                    value: i,
                    child: Text(
                      _titles[i],
                      style: TextStyle(
                        fontWeight: i == selectedIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: i == selectedIndex
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
