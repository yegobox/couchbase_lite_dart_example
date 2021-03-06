
library serializers;

import 'package:aurore/models/boolean_serializer.dart';
import 'package:aurore/models/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([User])
Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()
        ..addBuilderFactory(  // add this builder factory
          const FullType(BuiltList, [FullType(String)]),
          () =>  ListBuilder<String>()) //if I want to return a list of business for example I will add it here like that
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer())
     
      ..add(BooleanSerializer()))
    .build();