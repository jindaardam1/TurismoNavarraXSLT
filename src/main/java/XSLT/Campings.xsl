
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="data">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
            <xsl:apply-templates select="row/plazas"/>
        </svg>
    </xsl:template>


    <xsl:template match="plazas">
<svg>
    <rect x="{position() * 50}" y="0" width="40" height="{. div 10}" fill="blue" />
</svg>
    </xsl:template>

</xsl:stylesheet>