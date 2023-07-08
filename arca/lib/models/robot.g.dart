// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRobotCollection on Isar {
  IsarCollection<Robot> get robots => this.collection();
}

const RobotSchema = CollectionSchema(
  name: r'Robot',
  id: -2559628957862773206,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'actualDistance': PropertySchema(
      id: 1,
      name: r'actualDistance',
      type: IsarType.double,
    ),
    r'actualKg': PropertySchema(
      id: 2,
      name: r'actualKg',
      type: IsarType.long,
    ),
    r'battery': PropertySchema(
      id: 3,
      name: r'battery',
      type: IsarType.long,
    ),
    r'cityId': PropertySchema(
      id: 4,
      name: r'cityId',
      type: IsarType.long,
    ),
    r'countryId': PropertySchema(
      id: 5,
      name: r'countryId',
      type: IsarType.long,
    ),
    r'instructions': PropertySchema(
      id: 6,
      name: r'instructions',
      type: IsarType.bool,
    ),
    r'landId': PropertySchema(
      id: 7,
      name: r'landId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'totalDistance': PropertySchema(
      id: 9,
      name: r'totalDistance',
      type: IsarType.double,
    ),
    r'totalKg': PropertySchema(
      id: 10,
      name: r'totalKg',
      type: IsarType.long,
    ),
    r'warnings': PropertySchema(
      id: 11,
      name: r'warnings',
      type: IsarType.bool,
    )
  },
  estimateSize: _robotEstimateSize,
  serialize: _robotSerialize,
  deserialize: _robotDeserialize,
  deserializeProp: _robotDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _robotGetId,
  getLinks: _robotGetLinks,
  attach: _robotAttach,
  version: '3.1.0+1',
);

int _robotEstimateSize(
  Robot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _robotSerialize(
  Robot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeDouble(offsets[1], object.actualDistance);
  writer.writeLong(offsets[2], object.actualKg);
  writer.writeLong(offsets[3], object.battery);
  writer.writeLong(offsets[4], object.cityId);
  writer.writeLong(offsets[5], object.countryId);
  writer.writeBool(offsets[6], object.instructions);
  writer.writeLong(offsets[7], object.landId);
  writer.writeString(offsets[8], object.name);
  writer.writeDouble(offsets[9], object.totalDistance);
  writer.writeLong(offsets[10], object.totalKg);
  writer.writeBool(offsets[11], object.warnings);
}

Robot _robotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Robot();
  object.active = reader.readBool(offsets[0]);
  object.actualDistance = reader.readDouble(offsets[1]);
  object.actualKg = reader.readLong(offsets[2]);
  object.battery = reader.readLong(offsets[3]);
  object.cityId = reader.readLong(offsets[4]);
  object.countryId = reader.readLong(offsets[5]);
  object.id = id;
  object.instructions = reader.readBool(offsets[6]);
  object.landId = reader.readLong(offsets[7]);
  object.name = reader.readStringOrNull(offsets[8]);
  object.totalDistance = reader.readDouble(offsets[9]);
  object.totalKg = reader.readLong(offsets[10]);
  object.warnings = reader.readBool(offsets[11]);
  return object;
}

P _robotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _robotGetId(Robot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _robotGetLinks(Robot object) {
  return [];
}

void _robotAttach(IsarCollection<dynamic> col, Id id, Robot object) {
  object.id = id;
}

extension RobotQueryWhereSort on QueryBuilder<Robot, Robot, QWhere> {
  QueryBuilder<Robot, Robot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RobotQueryWhere on QueryBuilder<Robot, Robot, QWhereClause> {
  QueryBuilder<Robot, Robot, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Robot, Robot, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Robot, Robot, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Robot, Robot, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RobotQueryFilter on QueryBuilder<Robot, Robot, QFilterCondition> {
  QueryBuilder<Robot, Robot, QAfterFilterCondition> activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualDistanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualDistanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualDistanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualDistanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualKgEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualKgGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualKgLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> actualKgBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> batteryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'battery',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> batteryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'battery',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> batteryLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'battery',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> batteryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'battery',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> cityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> cityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> cityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> cityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> countryIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> countryIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> countryIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> countryIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> instructionsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructions',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> landIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'landId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> landIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'landId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> landIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'landId',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> landIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'landId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalDistanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalDistanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalDistanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDistance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalDistanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalKgEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalKgGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalKgLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalKg',
        value: value,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> totalKgBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Robot, Robot, QAfterFilterCondition> warningsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warnings',
        value: value,
      ));
    });
  }
}

extension RobotQueryObject on QueryBuilder<Robot, Robot, QFilterCondition> {}

extension RobotQueryLinks on QueryBuilder<Robot, Robot, QFilterCondition> {}

extension RobotQuerySortBy on QueryBuilder<Robot, Robot, QSortBy> {
  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActualDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistance', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActualDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistance', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActualKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualKg', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByActualKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualKg', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'battery', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'battery', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByCountryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByCountryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByLandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByTotalDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistance', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByTotalDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistance', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByTotalKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKg', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByTotalKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKg', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByWarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warnings', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> sortByWarningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warnings', Sort.desc);
    });
  }
}

extension RobotQuerySortThenBy on QueryBuilder<Robot, Robot, QSortThenBy> {
  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActualDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistance', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActualDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDistance', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActualKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualKg', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByActualKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualKg', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'battery', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'battery', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByCountryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByCountryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landId', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByLandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landId', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByTotalDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistance', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByTotalDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistance', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByTotalKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKg', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByTotalKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKg', Sort.desc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByWarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warnings', Sort.asc);
    });
  }

  QueryBuilder<Robot, Robot, QAfterSortBy> thenByWarningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warnings', Sort.desc);
    });
  }
}

extension RobotQueryWhereDistinct on QueryBuilder<Robot, Robot, QDistinct> {
  QueryBuilder<Robot, Robot, QDistinct> distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByActualDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualDistance');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByActualKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualKg');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'battery');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cityId');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByCountryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryId');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instructions');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'landId');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByTotalDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDistance');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByTotalKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKg');
    });
  }

  QueryBuilder<Robot, Robot, QDistinct> distinctByWarnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warnings');
    });
  }
}

extension RobotQueryProperty on QueryBuilder<Robot, Robot, QQueryProperty> {
  QueryBuilder<Robot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Robot, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<Robot, double, QQueryOperations> actualDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualDistance');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> actualKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualKg');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> batteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'battery');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> cityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cityId');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> countryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryId');
    });
  }

  QueryBuilder<Robot, bool, QQueryOperations> instructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructions');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> landIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'landId');
    });
  }

  QueryBuilder<Robot, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Robot, double, QQueryOperations> totalDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDistance');
    });
  }

  QueryBuilder<Robot, int, QQueryOperations> totalKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKg');
    });
  }

  QueryBuilder<Robot, bool, QQueryOperations> warningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warnings');
    });
  }
}
