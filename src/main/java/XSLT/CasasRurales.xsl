<x<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <xsl:variable name="data" select="/data/row"/>

        <xsl:variable name="previos80">
            <xsl:apply-templates select="$data[contains(FECHA_DE_INSCRIPCION, '196') or contains(FECHA_DE_INSCRIPCION, '197')]"/>
        </xsl:variable>
        <xsl:variable name="años80">
            <xsl:apply-templates select="$data[contains(FECHA_DE_INSCRIPCION, '198')]"/>
        </xsl:variable>
        <xsl:variable name="años90">
            <xsl:apply-templates select="$data[contains(FECHA_DE_INSCRIPCION, '199')]"/>
        </xsl:variable>
        <xsl:variable name="años2000">
            <xsl:apply-templates select="$data[contains(FECHA_DE_INSCRIPCION, '200')]"/>
        </xsl:variable>
        <xsl:variable name="despues2010">
            <xsl:apply-templates select="$data[contains(FECHA_DE_INSCRIPCION, '201')]"/>
        </xsl:variable>

        <xsl:variable name="total" select="count($previos80) + count($años80) + count($años90) + count($años2000) + count($despues2010)"/>

        <xsl:variable name="anguloPrevios80" select="360 * count($previos80) div $total"/>
        <xsl:variable name="anguloPrevios80Rad" select="$anguloPrevios80 * 0.0174533"/>
        <xsl:variable name="anguloAños80" select="360 * count($años80) div $total"/>
        <xsl:variable name="anguloAños80Rad" select="$anguloAños80 * 0.0174533"/>
        <xsl:variable name="anguloAños90" select="360 * count($años90) div $total"/>
        <xsl:variable name="anguloAños90Rad" select="$anguloAños90 * 0.0174533"/>
        <xsl:variable name="anguloAños2000" select="360 * count($años2000) div $total"/>
        <xsl:variable name="anguloAños2000Rad" select="$anguloAños2000 * 0.0174533"/>
        <xsl:variable name="anguloDespues2010" select="360 * count($despues2010) div $total"/>
        <xsl:variable name="anguloDespues2010Rad" select="$anguloDespues2010 * 0.0174533"/>

        <xsl:for-each select="$data">
            <xsl:variable name="fecha" select="FECHA_DE_INSCRIPCION"/>
            <xsl:variable name="count" select="count($data[contains(FECHA_DE_INSCRIPCION, $fecha)])"/>

            <xsl:variable name="angle" select="360 * $count div $total"/>
            <xsl:variable name="angleRad" select="$angle * 0.0174533"/>
            <xsl:variable name="fillColor">
                <xsl:choose>
                    <xsl:when test="contains($fecha, '196') or contains($fecha, '197')">yellow</xsl:when>
                    <xsl:when test="contains($fecha, '198')">blue</xsl:when>
                    <xsl:when test="contains($fecha, '199')">green</xsl:when>
                    <xsl:when test="contains($fecha, '200')">red</xsl:when>
                    <xsl:when test="contains($fecha, '201')">orange</xsl:when>
                    <xsl:otherwise>gray</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
        </xsl:for-each>

        <circle cx="200" cy="200" r="100" fill="white" stroke="black"/>

        <xsl:variable name="previos80StartAngle" select="0"/>
        <xsl:variable name="previos80EndAngle" select="$previos80StartAngle + $anguloPrevios80"/>
        <path d="M 200,200 L 200,100 A 100,100 0 0 1 <xsl:value-of select="200 + 100 * sin($previos80EndAngle)"/>,<xsl:value-of select="200 - 100 * cos($previos80EndAngle)"/> Z" fill="yellow"/>

        <xsl:variable name="años80StartAngle" select="$previos80EndAngle"/>
        <xsl:variable name="años80EndAngle" select="$años80StartAngle + $anguloAños80"/>
        <path d="M 200,200 L 200,100 A 100,100 0 0 1 <xsl:value-of select="200 + 100 * sin($años80EndAngle)"/>,<xsl:value-of select="200 - 100 * cos($años80EndAngle)"/> Z" fill="blue"/>


        <xsl:variable name="años90StartAngle" select="$años80EndAngle"/>
        <xsl:variable name="años90EndAngle" select="$años90StartAngle + $anguloAños90"/>
        <path d="M 200,200 L 200,100 A 100,100 0 0 1 <xsl:value-of select="200 + 100 * sin($años90EndAngle)"/>,<xsl:value-of select="200 - 100 * cos($años90EndAngle)"/> Z" fill="green"/>


        <xsl:variable name="años2000StartAngle" select="$años90EndAngle"/>
        <xsl:variable name="años2000EndAngle" select="$años2000StartAngle + $anguloAños2000"/>
        <path d="M 200,200 L 200,100 A 100,100 0 0 1 <xsl:value-of select="200 + 100 * sin($años2000EndAngle)"/>,<xsl:value-of select="200 - 100 * cos($años2000EndAngle)"/> Z" fill="red"/>


        <xsl:variable name="despues2010StartAngle" select="$años2000EndAngle"/>
        <xsl:variable name="despues2010EndAngle" select="$despues2010StartAngle + $anguloDespues2010"/>
        <path d="M 200,200 L 200,100 A 100,100 0 0 1 <xsl:value-of select="200 + 100 * sin($despues2010EndAngle)"/>,<xsl:value-of select="200 - 100 * cos($despues2010EndAngle)"/> Z" fill="orange"/>

    </svg>
</xsl:template>
</xsl:stylesheet>

