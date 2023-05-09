<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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

            <circle cx="200" cy="200" r="100" fill="white" stroke="black"/>

            <xsl:variable name="startAngle" select="0"/>
            <xsl:variable name="endAnglePrevios80" select="$startAngle + $anguloPrevios80"/>
            <xsl:variable name="endAngleAños80" select="$endAnglePrevios80 + $anguloAños80"/>
            <xsl:variable name="endAngleAños90" select="$endAngleAños80 + $anguloAños90"/>
            <xsl:variable name="endAngleAños2000" select="$endAngleAños90 + $anguloAños2000"/>
            <xsl:variable name="endAngleDespues2010" select="$endAngleAños2000 + $anguloDespues2010"/>


            <path transform="rotate(<xsl:value-of select="$startAngle"/> 200 200)" d="M200,200 L200,100 A100,100 0 0 1 <xsl:value-of select="200 + 100 * sin(deg2rad($endAnglePrevios80))"/>,<xsl:value-of select="200 - 100 * cos(deg2rad($endAnglePrevios80))"/> Z" fill="yellow"/>
            <path transform="rotate(<xsl:value-of select="$endAnglePrevios80"/> 200 200)" d="M200,200 L200,100 A100,100 0 0 1 <xsl:value-of select="200 + 100 * sin(deg2rad($endAngleAños80))"/>,<xsl:value-of select="200 - 100 * cos(deg2rad($endAngleAños80))"/> Z" fill="blue"/>
            <path transform="rotate(<xsl:value-of select="$endAngleAños80"/> 200 200)" d="M200,200 L200,100 A100,100 0 0 1 <xsl:value-of select="200 + 100 * sin(deg2rad($endAngleAños90))"/>,<xsl:value-of select="200 - 100 * cos(deg2rad($endAngleAños90))"/> Z" fill="green"/>
            <path transform="rotate(<xsl:value-of select="$endAngleAños90"/> 200 200)" d="M200,200 L200,100 A100,100 0 0 1 <xsl:value-of select="200 + 100 * sin(deg2rad($endAngleAños2000))"/>,<xsl:value-of select="200 - 100 * cos(deg2rad($endAngleAños2000))"/> Z" fill="red"/>
            <path transform="rotate(<xsl:value-of select="$endAngleAños2000"/> 200 200)" d="M200,200 L200,100 A100,100 0 0 1 <xsl:value-of select="200 + 100 * sin(deg2rad($endAngleDespues2010))"/>,<xsl:value-of select="200 - 100 * cos(deg2rad($endAngleDespues2010))"/> Z" fill="orange"/>


        </svg>
    </xsl:template>
    <xsl:template match="row">
        <xsl:variable name="fecha" select="FECHA_DE_INSCRIPCION"/>

    </xsl:template>
</xsl:stylesheet>

