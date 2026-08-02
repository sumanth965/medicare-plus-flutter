import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
class FirebaseService { const FirebaseService._(); static Future<void> initialize() async { try { await Firebase.initializeApp(); } on FirebaseException catch (e) { // Keep app preview stable when Firebase options have not been generated yet.
      if (e.code == 'duplicate-app') return;
      debugPrint('Firebase not configured yet: ${e.message}'); } } }
