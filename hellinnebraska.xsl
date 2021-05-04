<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <!-- "DINNER PARTY MENU" TEMPLATE. I USE THIS TO ORGANIZE THE BASIC STRUCTURE 
    OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND
    ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->

    <xsl:template match="/">
        <!-- NOTICE THE SLASH THERE. In XPath this means root node (which in a TEI XML file is <TEI>). -->
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="hellinnebraska.css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>


    <!-- "FOOD PREP/MISE EN PLACE" TEMPLATES -->


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:teiHeader"/>

    <!-- NOTICE THAT THIS ONE IS EMPTY. WE WILL TALK ABOUT WHAT THAT DOES.-->

    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>

    <xsl:template match="tei:emph">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="tei:title">
        <cite>
            <xsl:apply-templates/>
        </cite>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <cite>
            <xsl:apply-templates/>
        </cite>
    </xsl:template>

    <xsl:template match="tei:quote">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <xsl:template match="tei:sic">
        <i>
            <xsl:apply-templates/> (sic) </i>
    </xsl:template>

    <xsl:template match="tei:said">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>

    <xsl:template match="tei:soCalled">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>

    <xsl:template match="tei:graphic">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:figDesc">
        <small>
            <xsl:apply-templates/>
        </small>
    </xsl:template>


    <xsl:template match="tei:note">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="tei:figure">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:salute">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <xsl:template match="tei:signed">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <xsl:template match="tei:foreign">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>


    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:person">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <p>
            <b>Name:</b>
            <xsl:apply-templates select="tei:persName"/>
        </p>
        <p>
            <b>Occupation:</b>
            <xsl:apply-templates select="tei:occupation"/>
        </p>
        <p>*<xsl:apply-templates select="tei:note"/>*</p>
        <p> </p>
    </xsl:template>

    <xsl:template match="tei:place">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <p>
            <b>Name: </b>
            <xsl:apply-templates select="tei:placeName"/>
        </p>
        <p>
            <b><xsl:value-of select="tei:region/@type"/>: </b>
            <xsl:apply-templates select="tei:region"/>
        </p>
        <p>*<xsl:apply-templates select="tei:note"/>*</p>
        <p> </p>
    </xsl:template>

    <xsl:template match="tei:standoff">
        <h2>Notes for People and Places</h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:floatingText">
        <div class="section">
            <xsl:apply-templates/>
        </div>
    </xsl:template>





    <!--"RECIPE" TEMPLATES-->


    <!-- A NAMED TEMPLATE THAT WILL HOLD INFORMATION/OUTPUT TO BE CALLED ELSEWHERE -->



</xsl:stylesheet>
