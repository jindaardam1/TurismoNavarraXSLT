<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
            <xsl:variable name="data" select="/data/row"/>

            <xsl:variable name="previos80" select="count($data[contains(FECHA_DE_INSCRIPCION, '1980-') or contains(FECHA_DE_INSCRIPCION, '197')])"/>
            <xsl:variable name="años80" select="count($data[contains(FECHA_DE_INSCRIPCION, '198')])"/>
            <xsl:variable name="años90" select="count($data[contains(FECHA_DE_INSCRIPCION, '199')])"/>
            <xsl:variable name="años2000" select="count($data[contains(FECHA_DE_INSCRIPCION, '200')])"/>
            <xsl:variable name="despues2010" select="count($data[contains(FECHA_DE_INSCRIPCION, '201')])"/>

            <xsl:variable name="total" select="$previos80 + $años80 + $años90 + $años2000 + $despues2010"/>

            <xsl:variable name="anguloPrevios80" select="360 * $previos80 div $total"/>
            <xsl:variable name="anguloAños80" select="360 * $años80 div $total"/>
            <xsl:variable name="anguloAños90" select="360 * $años90 div $total"/>
            <xsl:variable name="anguloAños2000" select="360 * $años2000 div $total"/>
            <xsl:variable name="anguloDespues2010" select="360 * $despues2010 div $total"/>

            <circle cx="100" cy="100" r="80" fill="white"/>
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="$anguloPrevios80"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(deg2rad($anguloPrevios80))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(deg2rad($anguloPrevios80))"/>
                </xsl:attribute>
            </path>
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="$años80"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(deg2rad($años80))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(deg2rad($años80))"/>
                </xsl:attribute>
            </path>
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="$años90"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(deg2rad($años90))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(deg2rad($años90))"/>
                </xsl:attribute>
            </path>
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="$años2000"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(deg2rad($años2000))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(deg2rad($años2000))"/>
                </xsl:attribute>
            </path>
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="$despues2010"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(deg2rad($despues2010))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(deg2rad($despues2010))"/>
                </xsl:attribute>
            </path>
        </svg>

        <xsl:function name="mydeg2rad">
            <xsl:param name="degrees"/>
            <xsl:value-of select="$degrees * 0.0174533"/>
        </xsl:function>

        <xsl:for-each select="data">
            <path d="M100,20 A80,80 0 0,1 180,100 L100,100 Z" fill="blue" stroke="none">
                <xsl:attribute name="d">
                    <xsl:text>M100,20 A80,80 </xsl:text>
                    <xsl:value-of select="count(FECHA_DE_INSCRIPCION)"/>
                    <xsl:text>,80 0 0,1 </xsl:text>
                    <xsl:value-of select="100 + 80 * sin(mydeg2rad(count(FECHA_DE_INSCRIPCION)))"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="100 - 80 * cos(mydeg2rad(count(FECHA_DE_INSCRIPCION)))"/>
                </xsl:attribute>
            </path>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
