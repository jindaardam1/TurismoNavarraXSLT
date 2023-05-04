<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- Define los rangos de población -->
    <xsl:variable name="poblacion-rango1" select="200"/>
    <xsl:variable name="poblacion-rango2" select="400"/>
    <xsl:variable name="poblacion-rango3" select="600"/>
    <xsl:variable name="poblacion-rango4" select="800"/>
    <xsl:variable name="poblacion-rango5" select="1000"/>

    <!-- Cuenta el número de municipios en cada rango de población -->
    <xsl:template match="/">
        <xsl:variable name="num-municipios-rango1">
            <xsl:value-of select="count(municipios/municipio[habitantes &lt;= $poblacion-rango1])"/>
        </xsl:variable>
        <xsl:variable name="num-municipios-rango2">
            <xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango1 and habitantes &lt;= $poblacion-rango2])"/>
        </xsl:variable>
        <xsl:variable name="num-municipios-rango3">
            <xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango2 and habitantes &lt;= $poblacion-rango3])"/>
        </xsl:variable>
        <xsl:variable name="num-municipios-rango4">
            <xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango3 and habitantes &lt;= $poblacion-rango4])"/>
        </xsl:variable>
        <xsl:variable name="num-municipios-rango5">
            <xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango4 and habitantes &lt;= $poblacion-rango5])"/>
        </xsl:variable>
        <xsl:variable name="num-municipios-rango6">
            <xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango5])"/>
        </xsl:variable>

        <!-- Genera el gráfico de barras en SVG -->
        <svg xmlns="http://www.w3.org/2000/svg" width="1500" height="900">
            <rect y="10" x="10" height="80" width="{10*$num-municipios-rango1}" fill="green"/>
            <text x="30" y="55" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &lt;= $poblacion-rango1])"/></text>
            <rect y="100" x="10" height="80" width="{10*$num-municipios-rango2}" fill="green"/>
            <text x="30" y="145" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango1 and habitantes &lt;= $poblacion-rango2])"/></text>
            <rect y="190" x="10" height="80" width="{10*$num-municipios-rango3}" fill="green"/>
            <text x="190" y="{15+10*$num-municipios-rango3}">{concat($poblacion-rango2+1, '-', $poblacion-rango3)}</text>
            <rect y="280" x="10" height="80" width="{10*$num-municipios-rango4}" fill="green"/>
            <text x="280" y="{15+10*$num-municipios-rango4}">{concat($poblacion-rango3+1, '-', $poblacion-rango4)}</text>
            <rect y="370" x="10" height="80" width="{10*$num-municipios-rango5}" fill="green"/>
            <text x="370" y="{15+10*$num-municipios-rango5}">{concat($poblacion-rango4+1, '-', $poblacion-rango5)}</text>
            <rect y="460" x="10" height="80" width="{10*$num-municipios-rango6}" fill="green"/>
            <text x="460" y="{15+10*$num-municipios-rango6}">más de {concat($poblacion-rango5)}</text>
        </svg>
    </xsl:template>

</xsl:stylesheet>
