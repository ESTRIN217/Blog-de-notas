class AudioEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'audio'; // Este es el identificador en el JSON (ej: {"insert": {"audio": "ruta/al/archivo"}})

  @override
  bool get expanded => false;

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed node,
    bool readOnly,
    bool inline,
    TextStyle textStyle,
  ) {
    // Extraemos la ruta del archivo que guardamos al insertar
    final audioPath = node.value.data as String;
    
    return AudioPlayerWidget(
      audioPath: audioPath,
      controller: controller,
      node: node,
      readOnly: readOnly, // Si está en la tarjeta de inicio, no mostrará el botón de basura
    );
  }
}