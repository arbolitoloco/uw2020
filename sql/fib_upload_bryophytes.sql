SELECT 	associatedCollectors, 
		associatedTaxa,
		basisOfRecord,
		behavior,
		catalogNumber,
        collid,
		collectionCode,
		collectionID,
		coordinateUncertaintyInMeters,
		country,
		county,
		cultivationStatus,
		dataGeneralizations,
		dateIdentified,
		day,
		catalogNumber AS dbpk,
		decimalLatitude,
		decimalLongitude,
		disposition,
		dynamicProperties,
		establishmentMeans,
		eventDate,
		family,
		footprintWKT,
		genus,
		geodeticDatum,
		georeferencedBy,
		georeferenceProtocol,
		georeferenceRemarks,
		georeferenceSources,
		georeferenceVerificationStatus,
		habitat,
		identificationQualifier,
		identificationReferences,
		identificationRemarks,
		identifiedBy,
		individualCount,
		informationWithheld,
		infraspecificEpithet,
		institutionCode,
		lifeStage,
		fib_symbiota.omoccurrences.locality,
		localitySecurity,
		localitySecurityReason,
		locationRemarks,
		maximumDepthInMeters,
		maximumElevationInMeters,
		minimumDepthInMeters,
		minimumElevationInMeters,
		modified,
		month,
		municipality,
		fib_symbiota.omoccurrences.occid,
		occurrenceID,
		occurrenceRemarks,
		otherCatalogNumbers,
		ownerInstitutionCode,
		preparations,
		previousIdentifications,
		processingstatus,
		recordedBy,
		recordEnteredBy,
		recordNumber,
		reproductiveCondition,
		samplingEffort,
		samplingProtocol,
		scientificName,
		scientificNameAuthorship,
		sciname,
		sex,
		specificEpithet,
		stateProvince,
		storageLocation,
		substrate,
		taxonRank,
		typeStatus,
		verbatimAttributes,
		verbatimCoordinates,
		verbatimDepth,
		verbatimElevation,
		verbatimEventDate,
		year
FROM fib_symbiota.omoccurrences
WHERE fib_symbiota.omoccurrences.collid = 3;
