<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg">
            <image xlink:href="../Resources/MapaNavarra.svg" width="500" height="500" />
            <xsl:for-each select="//row">
                <xsl:variable name="plazas" select="./plazas"/>
                <xsl:variable name="latitud" select="./latitud"/>
                <xsl:variable name="longitud" select="./longitud"/>

                <rect x="{(($latitud - 40) * 300) - 600}"
                      y="{($longitud * 300) + 700}"
                      width="15"
                      height="{$plazas div 10}"
                      rx="3"
                      ry="3"
                      stroke="black"
                      stroke-width="2">
                    <xsl:choose>
                        <xsl:when test="$plazas &lt; 400">
                            <xsl:attribute name="fill">red</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$plazas &lt; 800">
                            <xsl:attribute name="fill">yellow</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="fill">green</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </rect>

            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
