import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comunicaciones_record.g.dart';

abstract class ComunicacionesRecord
    implements Built<ComunicacionesRecord, ComunicacionesRecordBuilder> {
  static Serializer<ComunicacionesRecord> get serializer =>
      _$comunicacionesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Desarrollo')
  String get desarrollo;

  @nullable
  @BuiltValueField(wireName: 'Titulo')
  String get titulo;

  @nullable
  @BuiltValueField(wireName: 'Fecha_Publicacion')
  DateTime get fechaPublicacion;

  @nullable
  @BuiltValueField(wireName: 'Img_Ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: 'Tipo_comunicacion')
  String get tipoComunicacion;

  @nullable
  @BuiltValueField(wireName: 'Filtro_curso')
  String get filtroCurso;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: 'Doc_PDF')
  String get docPDF;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ComunicacionesRecordBuilder builder) => builder
    ..desarrollo = ''
    ..titulo = ''
    ..imgRef = ''
    ..tipoComunicacion = ''
    ..filtroCurso = ''
    ..nombreQP = ''
    ..rolQP = ''
    ..docPDF = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comunicaciones');

  static Stream<ComunicacionesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ComunicacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ComunicacionesRecord._();
  factory ComunicacionesRecord(
          [void Function(ComunicacionesRecordBuilder) updates]) =
      _$ComunicacionesRecord;

  static ComunicacionesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createComunicacionesRecordData({
  String desarrollo,
  String titulo,
  DateTime fechaPublicacion,
  String imgRef,
  String tipoComunicacion,
  String filtroCurso,
  String nombreQP,
  String rolQP,
  DocumentReference uidQP,
  String docPDF,
}) =>
    serializers.toFirestore(
        ComunicacionesRecord.serializer,
        ComunicacionesRecord((c) => c
          ..desarrollo = desarrollo
          ..titulo = titulo
          ..fechaPublicacion = fechaPublicacion
          ..imgRef = imgRef
          ..tipoComunicacion = tipoComunicacion
          ..filtroCurso = filtroCurso
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..uidQP = uidQP
          ..docPDF = docPDF));
