<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Campings</title>
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
                    <h1>Mapa de campings de Navarra</h1>
                    <table class="tabla-index">
                        <tr>
                            <td class="columna1">
                                <p class="rojo">Menos de 400 plazas</p>
                                <p class="amarillo">Entre 401 y 800</p>
                                <p class="verde">Más de 800</p>
                            </td>
                            <td class="columna2">
                                <svg xmlns="http://www.w3.org/2000/svg">
                                    <image xlink:href="../Resources/MapaNavarra.svg" height="500" />
                                    <xsl:for-each select="//row">
                                        <xsl:sort select="./plazas" data-type="number" order="descending" />
                                        <xsl:variable name="plazas" select="./plazas"/>
                                        <xsl:variable name="latitud" select="./latitud"/>
                                        <xsl:variable name="longitud" select="./longitud"/>

                                        <rect x="{(($latitud - 40) * 300) - 600}"
                                              y="{($longitud * 300) + 700}"
                                              width="15"
                                              height="{$plazas div 10}"
                                              rx="3"
                                              ry="3"
                                              stroke="black"
                                              stroke-width="2"
                                              opacity="0.8">
                                            <xsl:choose>
                                                <xsl:when test="$plazas &lt; 400">
                                                    <xsl:attribute name="fill">red</xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="$plazas &lt; 800">
                                                    <xsl:attribute name="fill">yellow</xsl:attribute>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:attribute name="fill">green</xsl:attribute>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </rect>

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
