:: Copyright 2010, by the California Institute of Technology.
:: ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
:: Any commercial use must be negotiated with the Office of Technology Transfer
:: at the California Institute of Technology.
::
:: This software is subject to U. S. export control laws and regulations
:: (22 C.F.R. 120-130 and 15 C.F.R. 730-774). To the extent that the software
:: is subject to U.S. export control laws and regulations, the recipient has
:: the responsibility to obtain export licenses or other export authority as
:: may be required before exporting such information to foreign countries or
:: providing access to foreign nationals.
::
:: $Id$

:: Batch file that registers the list of supported objects types 
:: with the Registry Service specified by the REGISTRY_SERVICE variable.
:: Upon successful completion of this script, go to 
:: http://%REGISTRY_SERVICE%/registry/status
:: to verify that all classification nodes and schemes were loaded.

set REGISTRY_SERVICE=http://localhost:8080/registry-service

:: Load Object Type Classification Scheme
curl -X POST -H "Content-type:application/xml" -v -d @../conf/schemeObjectType.xml "%REGISTRY_SERVICE%/registry/schemes"

:: Load Core Object Type Classification Nodes
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeAssociation.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeAuditableEvent.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeClassification.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeClassificationNode.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeClassificationScheme.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeExtrinsicObject.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeService.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeServiceBinding.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeSpecificationLink.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"

:: Load PDS Object Type Classification Nodes
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProduct.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionBrowse.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionCalibration.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionContext.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionData.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionDocument.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionGeneric.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionGeometry.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionMiscellaneous.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionSecondary.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionSPICE.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeCollectionXMLSchema.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeDeliveryManifest.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductBrowse.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductBundle.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductDocument.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductElementDefinition.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductGeneric.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductImage3D.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductImageGrayscale.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductInstrument.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductInstrumentHost.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductInvestigation.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductMission.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductNode.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductPDSAffiliate.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductPDSGuest.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductResource.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductSpectrum3D.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductSPICEKernelBinary.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductSPICEKernelText.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductStreamDelimited.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTableBinary.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTableBinaryGrouped.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTableCharacter.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTableCharacterGrouped.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTarget.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductTextFile.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductThumbnail.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductUpdate.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductXMLSchema.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"
curl -X POST -H "Content-type:application/xml" -v -d @../conf/nodeProductZipped.xml "%REGISTRY_SERVICE%/registry/schemes/urn:registry:classificationScheme:ObjectType/nodes"