<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink">


    <xsl:template match="/">

        <xsl:variable name="pisosPrimera">
            <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Primera')])"/>
        </xsl:variable>
        <xsl:variable name="pisosSegunda">
            <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Segunda')])"/>
        </xsl:variable>
        <xsl:variable name="pisosTercera">
            <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Tercera')])"/>
        </xsl:variable>
        <xsl:variable name="pisosLujo">
            <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Lujo')])"/>
        </xsl:variable>

        <svg>

            <image xlink:href="../Resources/one.svg" width="{($pisosPrimera div 2)}" height="{($pisosPrimera div 2)}" x="0"/>
            <image xlink:href="../Resources/two.svg" width="{($pisosSegunda div 2)}" height="{($pisosSegunda div 2)}" x="{($pisosPrimera div 2)}" y="-11" />
            <image xlink:href="../Resources/three.svg" width="{($pisosTercera div 2)}" height="{($pisosTercera div 2)}" x="{($pisosPrimera div 2) + ($pisosSegunda div 2)}" y="+3.5"/>
            <image xlink:href="../Resources/s.svg" width="{(($pisosLujo * 10) div 2)}" height="{$pisosLujo * 10}" x="{($pisosPrimera div 2) + ($pisosSegunda div 2) + ($pisosTercera div 2)}"/>


        </svg>
    </xsl:template>

</xsl:stylesheet>