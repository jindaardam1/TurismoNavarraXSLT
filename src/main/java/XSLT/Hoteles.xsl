<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg">
            <image xlink:href="../Resources/MapaNavarra.svg" width="500" height="500" />
            <xsl:for-each select="//row">
                <xsl:variable name="x" select="./latitud"/>
                <xsl:variable name="y" select="./longitud"/>
                <xsl:variable name="modalidad" select="./modalidad"/>
                <xsl:variable name="plazas" select="./plazas"/>

                <circle r="3"
                        cx="{(($x - 40) * 175) - 250}"
                        cy="{(($y) * 300) + 700}"
                        stroke-width="1"
                        stroke="black">
                    <xsl:choose>
                        <xsl:when test="$modalidad='Hotel'">
                            <xsl:attribute name="fill">red</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$modalidad='Hostal'">
                            <xsl:attribute name="fill">blue</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$modalidad='Pensión'">
                            <xsl:attribute name="fill">green</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$modalidad='Hotel rural'">
                            <xsl:attribute name="fill">orange</xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="$plazas &lt; 25">
                            <xsl:attribute name="r">2</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 50">
                            <xsl:attribute name="r">3</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 75">
                            <xsl:attribute name="r">4</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 100">
                            <xsl:attribute name="r">5</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 125">
                            <xsl:attribute name="r">6</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 150">
                            <xsl:attribute name="r">7</xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </circle>
            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
