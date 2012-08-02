// Copyright 2006-2012, by the California Institute of Technology.
// ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
// Any commercial use must be negotiated with the Office of Technology Transfer
// at the California Institute of Technology.
//
// This software is subject to U. S. export control laws and regulations
// (22 C.F.R. 120-130 and 15 C.F.R. 730-774). To the extent that the software
// is subject to U.S. export control laws and regulations, the recipient has
// the responsibility to obtain export licenses or other export authority as
// may be required before exporting such information to foreign countries or
// providing access to foreign nationals.
//
// $Id$

//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a>
// Any modifications to this file will be lost upon recompilation of the source schema.
// Generated on: 2012.06.18 at 08:01:29 AM PDT
//


package gov.nasa.pds.harvest.pdap.policy;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the gov.nasa.pds.harvest.pdap.policy package.
 * <p>An ObjectFactory allows you to programatically
 * construct new instances of the Java representation
 * for XML content. The Java representation of XML
 * content can consist of schema derived interfaces
 * and classes representing the binding of schema
 * type definitions, element declarations and model
 * groups.  Factory methods for each of these are
 * provided in this class.
 *
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Element_QNAME = new QName("", "element");
    private final static QName _PackageName_QNAME = new QName("", "packageName");
    private final static QName _PdapService_QNAME = new QName("", "pdapService");
    private final static QName _PdapServices_QNAME = new QName("", "pdapServices");
    private final static QName _DynamicMetadata_QNAME = new QName("", "dynamicMetadata");
    private final static QName _PackageDescription_QNAME = new QName("", "packageDescription");
    private final static QName _PdsRegistry_QNAME = new QName("", "pdsRegistry");
    private final static QName _ResourceMetadata_QNAME = new QName("", "resourceMetadata");
    private final static QName _Type_QNAME = new QName("", "type");
    private final static QName _Title_QNAME = new QName("", "title");
    private final static QName _Value_QNAME = new QName("", "value");
    private final static QName _StaticMetadata_QNAME = new QName("", "staticMetadata");
    private final static QName _Slot_QNAME = new QName("", "slot");
    private final static QName _ProductMetadata_QNAME = new QName("", "productMetadata");
    private final static QName _SlotName_QNAME = new QName("", "slotName");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: gov.nasa.pds.harvest.pdap.policy
     *
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Element }
     *
     */
    public Element createElement() {
        return new Element();
    }

    /**
     * Create an instance of {@link Policy }
     *
     */
    public Policy createPolicy() {
        return new Policy();
    }

    /**
     * Create an instance of {@link PdapServices }
     *
     */
    public PdapServices createPdapServices() {
        return new PdapServices();
    }

    /**
     * Create an instance of {@link ProductMetadata }
     *
     */
    public ProductMetadata createProductMetadata() {
        return new ProductMetadata();
    }

    /**
     * Create an instance of {@link PdapService }
     *
     */
    public PdapService createPdapService() {
        return new PdapService();
    }

    /**
     * Create an instance of {@link Slot }
     *
     */
    public Slot createSlot() {
        return new Slot();
    }

    /**
     * Create an instance of {@link PdsRegistry }
     *
     */
    public PdsRegistry createPdsRegistry() {
        return new PdsRegistry();
    }

    /**
     * Create an instance of {@link StaticMetadata }
     *
     */
    public StaticMetadata createStaticMetadata() {
        return new StaticMetadata();
    }

    /**
     * Create an instance of {@link ResourceMetadata }
     *
     */
    public ResourceMetadata createResourceMetadata() {
        return new ResourceMetadata();
    }

    /**
     * Create an instance of {@link DynamicMetadata }
     *
     */
    public DynamicMetadata createDynamicMetadata() {
        return new DynamicMetadata();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Element }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "element")
    public JAXBElement<Element> createElement(Element value) {
        return new JAXBElement<Element>(_Element_QNAME, Element.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "packageName")
    public JAXBElement<String> createPackageName(String value) {
        return new JAXBElement<String>(_PackageName_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PdapService }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "pdapService")
    public JAXBElement<PdapService> createPdapService(PdapService value) {
        return new JAXBElement<PdapService>(_PdapService_QNAME, PdapService.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PdapServices }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "pdapServices")
    public JAXBElement<PdapServices> createPdapServices(PdapServices value) {
        return new JAXBElement<PdapServices>(_PdapServices_QNAME, PdapServices.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DynamicMetadata }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "dynamicMetadata")
    public JAXBElement<DynamicMetadata> createDynamicMetadata(DynamicMetadata value) {
        return new JAXBElement<DynamicMetadata>(_DynamicMetadata_QNAME, DynamicMetadata.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "packageDescription")
    public JAXBElement<String> createPackageDescription(String value) {
        return new JAXBElement<String>(_PackageDescription_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PdsRegistry }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "pdsRegistry")
    public JAXBElement<PdsRegistry> createPdsRegistry(PdsRegistry value) {
        return new JAXBElement<PdsRegistry>(_PdsRegistry_QNAME, PdsRegistry.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ResourceMetadata }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "resourceMetadata")
    public JAXBElement<ResourceMetadata> createResourceMetadata(ResourceMetadata value) {
        return new JAXBElement<ResourceMetadata>(_ResourceMetadata_QNAME, ResourceMetadata.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "type")
    public JAXBElement<String> createType(String value) {
        return new JAXBElement<String>(_Type_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "title")
    public JAXBElement<String> createTitle(String value) {
        return new JAXBElement<String>(_Title_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "value")
    public JAXBElement<String> createValue(String value) {
        return new JAXBElement<String>(_Value_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link StaticMetadata }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "staticMetadata")
    public JAXBElement<StaticMetadata> createStaticMetadata(StaticMetadata value) {
        return new JAXBElement<StaticMetadata>(_StaticMetadata_QNAME, StaticMetadata.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Slot }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "slot")
    public JAXBElement<Slot> createSlot(Slot value) {
        return new JAXBElement<Slot>(_Slot_QNAME, Slot.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ProductMetadata }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "productMetadata")
    public JAXBElement<ProductMetadata> createProductMetadata(ProductMetadata value) {
        return new JAXBElement<ProductMetadata>(_ProductMetadata_QNAME, ProductMetadata.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     *
     */
    @XmlElementDecl(namespace = "", name = "slotName")
    public JAXBElement<String> createSlotName(String value) {
        return new JAXBElement<String>(_SlotName_QNAME, String.class, null, value);
    }

}