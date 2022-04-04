import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'convenios_record.g.dart';

abstract class ConveniosRecord
    implements Built<ConveniosRecord, ConveniosRecordBuilder> {
  static Serializer<ConveniosRecord> get serializer =>
      _$conveniosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nombre_Convenio')
  String get nombreConvenio;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Img_Ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: 'Autorizacion')
  bool get autorizacion;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ConveniosRecordBuilder builder) => builder
    ..nombreConvenio = ''
    ..descripcion = ''
    ..imgRef = ''
    ..autorizacion = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Convenios');

  static Stream<ConveniosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConveniosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConveniosRecord._();
  factory ConveniosRecord([void Function(ConveniosRecordBuilder) updates]) =
      _$ConveniosRecord;

  static ConveniosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConveniosRecordData({
  String nombreConvenio,
  String descripcion,
  String imgRef,
  bool autorizacion,
}) =>
    serializers.toFirestore(
        ConveniosRecord.serializer,
        ConveniosRecord((c) => c
          ..nombreConvenio = nombreConvenio
          ..descripcion = descripcion
          ..imgRef = imgRef
          ..autorizacion = autorizacion));
