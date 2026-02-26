import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_window/flutter_floating_window.dart';
import 'list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FloatingService {
  static Future<void> showFloatingWindow(BuildContext context, ListItem item) async {
    // 1. Platform Check
    if (kIsWeb || !Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El modo flotante solo está disponible en Android.')),
      );
      return;
    }

    // 2. Permission Management
    try {
      final bool hasPermission = await FloatingWindowManager.instance.hasOverlayPermission();
      if (!hasPermission) {
        final bool granted = await FloatingWindowManager.instance.requestOverlayPermission();
        if (!granted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permiso denegado para mostrar la ventana flotante.')),
          );
          return;
        }
      }
final config = FloatingWindowConfig(
  width: 300, // Ajusta el tamaño según necesites
  height: 200,
  isDraggable: true,
  // El color de fondo se suele manejar dentro del widget que pasas, 
  // no en la configuración de la ventana del sistema.
);
final prefs = await SharedPreferences.getInstance();
      await prefs.setString('floating_note_title', item.title);
            await prefs.setString('floating_note_content', item.document.toPlainText());
           
      // Finally, create the self-contained floating window.
      await FloatingWindowManager.instance.createWindow(config);

    } catch (e) {
      debugPrint('Error al crear la ventana flotante: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar el modo flotante: $e')),
      );
    }
  }
}
