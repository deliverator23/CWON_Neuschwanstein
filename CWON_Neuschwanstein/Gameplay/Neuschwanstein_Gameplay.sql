
INSERT INTO Types (Type, Kind) VALUES ('BUILDING_NEUSCHWANSTEIN', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Description, PrereqCivic, Cost, AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, Quote, AdjacentToMountain)
VALUES ('BUILDING_NEUSCHWANSTEIN', 'LOC_BUILDING_NEUSCHWANSTEIN_NAME', 'LOC_BUILDING_NEUSCHWANSTEIN_DESCRIPTION', 'CIVIC_OPERA_BALLET', 1350, 'ADVISOR_CULTURE', '1', 1, 1, 'LOC_BUILDING_NEUSCHWANSTEIN_QUOTE', 1);

INSERT INTO Building_GreatPersonPoints (BuildingType, GreatPersonClassType, PointsPerTurn)
VALUES ('BUILDING_NEUSCHWANSTEIN', 'GREAT_PERSON_CLASS_MUSICIAN', '2');

INSERT INTO Building_GreatWorks (BuildingType, GreatWorkSlotType, NumSlots) VALUES ('BUILDING_NEUSCHWANSTEIN', 'GREATWORKSLOT_MUSIC', '2');

--Building_ValidTerrains
INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_NEUSCHWANSTEIN', 'TERRAIN_GRASS_HILLS');
INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_NEUSCHWANSTEIN', 'TERRAIN_PLAINS_HILLS');
INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_NEUSCHWANSTEIN', 'TERRAIN_TUNDRA_HILLS');
INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_NEUSCHWANSTEIN', 'TERRAIN_SNOW_HILLS');
INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_NEUSCHWANSTEIN', 'TERRAIN_DESERT_HILLS');

--Building_YieldChanges
INSERT INTO Building_YieldChanges (
  BuildingType, YieldType, YieldChange
)
VALUES
  ('BUILDING_NEUSCHWANSTEIN', 'YIELD_CULTURE',2),
  ('BUILDING_NEUSCHWANSTEIN', 'YIELD_GOLD',2);


--Any City with Medieval or Renaissance Walls yields + 2 Culture, + 2 Gold, +1 Amenities

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS', 'REQUIRES_CITY_HAS_MEDIEVAL_WALLS');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS', 'REQUIRES_CITY_HAS_RENAISSANCE_WALLS');


INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('NEUSCHWANSTEIN_WALLS_CULTURE_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('NEUSCHWANSTEIN_WALLS_GOLD_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('NEUSCHWANSTEIN_WALLS_AMENITY_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY', 'CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS');


INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('NEUSCHWANSTEIN_WALLS_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('NEUSCHWANSTEIN_WALLS_CULTURE_MODIFIER', 'Amount', '2');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('NEUSCHWANSTEIN_WALLS_GOLD_MODIFIER', 'YieldType', 'YIELD_GOLD');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('NEUSCHWANSTEIN_WALLS_GOLD_MODIFIER', 'Amount', '2');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('NEUSCHWANSTEIN_WALLS_AMENITY_MODIFIER', 'Amount', '1');


INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_NEUSCHWANSTEIN', 'NEUSCHWANSTEIN_WALLS_GOLD_MODIFIER');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_NEUSCHWANSTEIN', 'NEUSCHWANSTEIN_WALLS_CULTURE_MODIFIER');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_NEUSCHWANSTEIN', 'NEUSCHWANSTEIN_WALLS_AMENITY_MODIFIER');