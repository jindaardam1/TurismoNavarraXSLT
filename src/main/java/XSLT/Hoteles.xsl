<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg">
            <xsl:for-each select="//row">
                <xsl:variable name="x" select="./latitud"/>
                <xsl:variable name="y" select="./longitud"/>

                <circle r="3"
                        cx="{(($x - 41) * 800) - 1000}"
                        cy="{($y + 2.5) * 1000}"
                        fill="green"
                        stroke-width="1"
                        stroke="black"/>

            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>