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
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Pisos turísticos</title>
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
                        <li><a href="campings.html">Campings</a></li>
                        <li><a href="casasrurales.html">Casas Rurales</a></li>
                        <li><a href="hoteles.html">Hoteles</a></li>
                        <li><a href="pisosturisticos.html">Pisos Turísticos</a></li>
                    </ul>
                </nav>
                <div class="contenedor-svg">
                    <h1>Pisos turísticos por categoría</h1>
                    <table class="tabla-index">
                        <tr>
                            <td class="columna1">
                                <p class="verde">Primera: <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Primera')])"/></p>
                                <p class="amarillo">Segunda: <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Segunda')])"/></p>
                                <p class="rojo">Tercera: <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Tercera')])"/></p>
                                <p class="azul">Lujo: <xsl:value-of select="count(//piso[contains(CATEGORIA, 'Lujo')])"/> (escala 1:10)</p>
                            </td>
                            <td class="columna2">
                                <svg width="1000" height="300">
                                    <image xlink:href="../Resources/three.svg" width="{($pisosTercera div 2)}" height="{($pisosTercera div 2)}" x="{($pisosPrimera div 2) + ($pisosSegunda div 2)}" y="+3.5"/>
                                    <image xlink:href="../Resources/two.svg" width="{($pisosSegunda div 2)}" height="{($pisosSegunda div 2)}" x="{($pisosPrimera div 2)}" y="-11" />
                                    <image xlink:href="../Resources/one.svg" width="{($pisosPrimera div 2)}" height="{($pisosPrimera div 2)}" x="0"/>
                                    <image xlink:href="../Resources/s.svg" width="{(($pisosLujo * 10) div 2)}" height="{$pisosLujo * 10}" x="{($pisosPrimera div 2) + ($pisosSegunda div 2) + ($pisosTercera div 2) + 20}"/>
                                </svg>
                            </td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>