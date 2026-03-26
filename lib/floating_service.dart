// En floating_service.dart 
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window_sdk34/flutter_overlay_window_sdk34.dart';

import 'list_item.dart';

class FloatingService {
  static Future<void> showFloatingWindow(BuildContext context, ListItem item) async {
    // 1. Verificación de permisos [cite: 110, 124]
    final bool status = await FlutterOverlayWindow.isPermissionGranted();
    
    if (!status) {
      await FlutterOverlayWindow.requestPermission();
      return;
    }

    // 2. Abrir la ventana 
    if (await FlutterOverlayWindow.isActive()) return;

    await FlutterOverlayWindow.showOverlay(
      enableDrag: true,
      overlayTitle: "Nota: ${item.title}",
      visibility: NotificationVisibility.visibilityPublic,
      height: WindowSize.matchParent,
      width: WindowSize.matchParent,
    );

    // 3. Enviar los datos de la nota inmediatamente 
    await FlutterOverlayWindow.shareData({
      'title': item.title,
      'content': item.document.toPlainText(),
    });
  }
}