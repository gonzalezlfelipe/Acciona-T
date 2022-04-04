import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cursos_record.g.dart';

abstract class CursosRecord
    implements Built<CursosRecord, CursosRecordBuilder> {
  static Serializer<CursosRecord> get serializer => _$cursosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nombre_curso')
  String get nombreCurso;

  @nullable
  @BuiltValueField(wireName: 'Nombre_Profesoracargo')
  String get nombreProfesoracargo;

  @nullable
  @BuiltValueField(wireName: 'Email_profesor_acargo')
  String get emailProfesorAcargo;

  @nullable
  @BuiltValueField(wireName: 'PDF_horariodeclases')
  String get pDFHorariodeclases;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CursosRecordBuilder builder) => builder
    ..nombreCurso = ''
    ..nombreProfesoracargo = ''
    ..emailProfesorAcargo = ''
    ..pDFHorariodeclases = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cursos');

  static Stream<CursosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CursosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CursosRecord._();
  factory CursosRecord([void Function(CursosRecordBuilder) updates]) =
      _$CursosRecord;

  static CursosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCursosRecordData({
  String nombreCurso,
  String nombreProfesoracargo,
  String emailProfesorAcargo,
  String pDFHorariodeclases,
}) =>
    serializers.toFirestore(
        CursosRecord.serializer,
        CursosRecord((c) => c
          ..nombreCurso = nombreCurso
          ..nombreProfesoracargo = nombreProfesoracargo
          ..emailProfesorAcargo = emailProfesorAcargo
          ..pDFHorariodeclases = pDFHorariodeclases));
