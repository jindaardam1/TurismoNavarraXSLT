<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:template match="/">


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
                        <li><a href="campings.html">Campings</a></li>
                        <li><a href="casasrurales.html">Casas Rurales</a></li>
                        <li><a href="hoteles.html">Hoteles</a></li>
                        <li><a href="pisosturisticos.html">Pisos Turísticos</a></li>
                    </ul>
                </nav>
                <div class="contenedor-svg">
                    <h1>Mapa de hoteles de Navarra</h1>
                    <table class="tabla-index">
                        <tr>
                            <td class="columna1">
                                <p>Modalidad alojamiento: </p>
                                <p class="rojo">Hotel</p>
                                <p class="azul">Hostal</p>
                                <p class="verde">Pension</p>
                                <p class="amarillo">Hotel Rural</p>
                                <p>Tamaño del circulo depende de las plazas del alojamiento</p>
                            </td>
                            <td class="columna2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500">
                                    <image xlink:href="../Resources/MapaNavarra.svg" width="500" height="500" />
                                    <xsl:for-each select="//row">
                                        <xsl:variable name="x" select="./latitud"/>
                                        <xsl:variable name="y" select="./longitud"/>
                                        <xsl:variable name="modalidad" select="./modalidad"/>
                                        <xsl:variable name="plazas" select="./plazas"/>

                                        <circle r="3"
                                                cx="{(($x - 40) * 175) - 250}"
                                                cy="{(($y) * 300) + 700}"
                                                stroke-width="1"
                                                stroke="black">
                                            <xsl:choose>
                                                <xsl:when test="$modalidad='Hotel'">
                                                    <xsl:attribute name="fill">red</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$modalidad='Hostal'">
                                                    <xsl:attribute name="fill">blue</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$modalidad='Pensión'">
                                                    <xsl:attribute name="fill">green</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$modalidad='Hotel rural'">
                                                    <xsl:attribute name="fill">yellow</xsl:attribute>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="$plazas &lt; 25">
                                                    <xsl:attribute name="r">2</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 50">
                                                    <xsl:attribute name="r">3</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 75">
                                                    <xsl:attribute name="r">4</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 100">
                                                    <xsl:attribute name="r">5</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 125">
                                                    <xsl:attribute name="r">6</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 150">
                                                    <xsl:attribute name="r">7</xsl:attribute>
                                                </xsl:when>
                                            </xsl:choose>
                                        </circle>
                                    </xsl:for-each>
                                </svg>
                            </td>
                        </tr>
                    </table>
                </div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
