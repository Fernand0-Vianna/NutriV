// Capture page
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Solicitar permissão de câmera
    var status = await Permission.camera.request();
    if (status.isDenied) {
      // O usuário negou a permissão.
      _showPermissionDeniedDialog();
      return;
    }
    if (status.isPermanentlyDenied) {
      // O usuário negou permanentemente.
      _showPermissionPermanentlyDeniedDialog();
      return;
    }

    _cameras = await availableCameras();
    if (_cameras == null || _cameras!.isEmpty) {
      // Nenhuma câmera encontrada.
      setState(() {
        _isCameraInitialized = false;
      });
      return;
    }

    _controller = CameraController(
      _cameras![0], // Usar a primeira câmera disponível
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraInitialized = true;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            _showPermissionDeniedDialog();
            break;
          default:
            _showErrorSnackBar('Erro ao inicializar a câmera: ${e.description}');
            break;
        }
      }
    });
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissão de Câmera Necessária'),
        content: const Text('Para escanear alimentos, precisamos de acesso à sua câmera.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showPermissionPermanentlyDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissão Negada Permanentemente'),
        content: const Text('A permissão da câmera foi negada permanentemente. Por favor, habilite-a nas configurações do aplicativo.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Abre as configurações do app para o usuário habilitar
            },
            child: const Text('Abrir Configurações'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }


  Future<void> _takePicture() async {
    if (!_isCameraInitialized || _controller == null || _controller!.value.isTakingPicture) {
      return;
    }

    try {
      final XFile file = await _controller!.takePicture();
      setState(() {
        _imageFile = file;
      });
      // Aqui você enviaria a imagem para o backend
      _showErrorSnackBar('Imagem capturada: ${file.path}');
    } on CameraException catch (e) {
      _showErrorSnackBar('Erro ao tirar foto: ${e.description}');
      return;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear Alimentos')),
      body: _isCameraInitialized && _controller!.value.isInitialized
          ? Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(_controller!),
                ),
                if (_imageFile != null) // Mostra a imagem capturada sobre a preview
                  Positioned.fill(
                    child: Image.file(
                      _imageFile!.path as Image, // Convertendo XFile.path para File
                      fit: BoxFit.contain,
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: FloatingActionButton(
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}