<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <xsl:variable name="rango1">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 1990 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 1995])"/>
        </xsl:variable>
        <xsl:variable name="rango2">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 1996 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 2001])"/>
        </xsl:variable>
        <xsl:variable name="rango3">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 2002 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 2007])"/>
        </xsl:variable>
        <xsl:variable name="rango4">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 2008 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 2013])"/>
        </xsl:variable>
        <xsl:variable name="rango5">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 2014 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 2019])"/>
        </xsl:variable>
        <xsl:variable name="rango6">
            <xsl:value-of
                    select="count(//row[number(substring(FECHA_DE_INSCRIPCION, 7, 4)) >= 2020 and number(substring(FECHA_DE_INSCRIPCION, 7, 4)) &lt;= 2023])"/>
        </xsl:variable>


        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Turismo Navarra</title>
                <link rel="stylesheet" href="../Resources/estilo.css"/>
            </head>
            <body>
                <nav>
                    <div class="logo">
                        <a href="index.html">
                            <img src="../Resources/EscudoDeNavarra.png" alt="escudoNavarra"/>
                        </a>
                    </div>
                    <ul class="nav-links">
                        <li>
                            <a href="campings.html">Campings</a>
                        </li>
                        <li>
                            <a href="casasrurales.html">Casas Rurales</a>
                        </li>
                        <li>
                            <a href="hoteles.html">Hoteles</a>
                        </li>
                        <li>
                            <a href="pisosturisticos.html">Pisos Turísticos</a>
                        </li>
                    </ul>
                </nav>
                <div class="contenedor-svg">
                    <h1>Fecha de apertura de casas rurales</h1>
                    <table class="tabla-index">
                        <tr>
                            <td class="columna1">
                                <p class="azul">Años 1990-1995</p>
                                <p class="morado">Años 1996-2001</p>
                                <p class="marron">Años 2002-2007</p>
                                <p class="naranja">Años 2008-2013</p>
                                <p class="amarillo">Años 2014-2019</p>
                                <p class="verde">Años 2020-2023</p>
                            </td>
                            <td class="columna2">

                                <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500">
                                    <circle cx="250" cy="250" r="{($rango1 + $rango2 + $rango3 + $rango4 + $rango5 + $rango6) div 3}" fill="blue" />
                                    <circle cx="250" cy="250" r="{($rango1 + $rango2 + $rango3 + $rango4 + $rango5) div 3}" fill="purple" />
                                    <circle cx="250" cy="250" r="{($rango1 + $rango2 + $rango3 + $rango4) div 3}" fill="brown" />
                                    <circle cx="250" cy="250" r="{($rango1 + $rango2 + $rango3) div 3}" fill="orange" />
                                    <circle cx="250" cy="250" r="{($rango1 + $rango2) div 3}" fill="yellow" />
                                    <circle cx="250" cy="250" r="{$rango1 div 3}" fill="green" />
                                </svg>
                            </td>
                        </tr>
                    </table>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
