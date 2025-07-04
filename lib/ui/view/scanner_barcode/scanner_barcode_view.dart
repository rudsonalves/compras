import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerView extends StatefulWidget {
  const QrCodeScannerView({super.key});

  static const routeName = '/read_qrcode';

  @override
  State<QrCodeScannerView> createState() => _QrCodeScannerViewState();
}

class _QrCodeScannerViewState extends State<QrCodeScannerView> {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.unrestricted,
  );

  final boxFit = BoxFit.contain;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(const Offset(0, -100)),
      width: 300,
      height: 200,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadQrcode Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: _backPage,
          icon: Icon(Symbols.arrow_back_ios),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            fit: boxFit,
            scanWindow: scanWindow,
            controller: controller,
            onDetect: (capture) {
              if (capture.barcodes.isNotEmpty) {
                final code = capture.barcodes.first;
                final value = code.displayValue.toString();
                controller.stop();
                Navigator.pop(context, value);
              }
            },
          ),
          BarcodeOverlay(controller: controller, boxFit: boxFit),
          ScanWindowOverlay(scanWindow: scanWindow, controller: controller),
        ],
      ),
    );
  }

  void _backPage() {
    Navigator.pop(context);
  }
}
