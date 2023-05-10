<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/data">
        <xsl:variable name="count-1990-1994">
            <xsl:value-of
                    select="count(row[substring(FECHA_DE_INSCRIPCION, 1, 4) &gt;= 1990 and substring(FECHA_DE_INSCRIPCION, 1, 4) &lt;= 1994])"/>
        </xsl:variable>
        <svg width="500" height="500">
            <xsl:variable name="intervalos">
            <xsl:variable name="intervalo1990_1994">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '199') and substring(., 1, 4) &gt;= '1990' and substring(., 1, 4) &lt;= '1994']"/>
            </xsl:variable>
            <xsl:variable name="intervalo1995_1999">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '199') and substring(., 1, 4) &gt;= '1995' and substring(., 1, 4) &lt;= '1999']"/>
            </xsl:variable>
            <xsl:variable name="intervalo2000_2004">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '200') and substring(., 1, 4) &gt;= '2000' and substring(., 1, 4) &lt;= '2004']"/>
            </xsl:variable>
            <xsl:variable name="intervalo2005_2009">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '200') and substring(., 1, 4) &gt;= '2005' and substring(., 1, 4) &lt;= '2009']"/>
            </xsl:variable>
            <xsl:variable name="intervalo2010_2014">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '201') and substring(., 1, 4) &gt;= '2010' and substring(., 1, 4) &lt;= '2014']"/>
            </xsl:variable>
            <xsl:variable name="intervalo2015_2019">
                <xsl:apply-templates
                        select="FECHA_DE_INSCRIPCION[contains(., '201') and substring(., 1, 4) &gt;= '2015' and substring(., 1, 4) &lt;= '2019']"/>
            </xsl:variable>
            </xsl:variable>

            <xsl:for-each select="$intervalos//node()">
                <xsl:sort select="count($intervalos[. = current()])" data-type="number" order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:for-each select="row/FECHA_DE_INSCRIPCION">
                        <xsl:variable name="max" select="current()"/>
                        <xsl:sort select="." data-type="number" order="descending"/>
                        <xsl:variable name="n" select="."/>
                        <xsl:if test="position() = 1">
                            <xsl:variable name="current-count" select="count($intervalos[. = current()])"/>
                            <xsl:variable name="radius" select="100 * $current-count div $max"/>
                            <circle cx="250" cy="250" r="{$radius}" stroke="black" stroke-width="1" fill="rgb({255 * $current-count div $max}, 0, 0)"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </svg>
    </xsl:template>


</xsl:stylesheet>

