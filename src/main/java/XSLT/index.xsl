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
                    <h1>Municipios y concejos de Navarra</h1>
                    <table class="tabla-index">
                        <tr>
                            <td class="columna1">
                                <p class="rojo">Menos de 200 habitantes</p>
                                <p class="amarillo">Entre 201 y 400</p>
                                <p class="verde">Entre 401 y 600</p>
                                <p class="rojo">Entre 601 y 800</p>
                                <p class="amarillo">Entre 801 y 1000</p>
                                <p class="verde">Más de 1000</p>
                            </td>
                            <td class="columna2">
                                <!-- Genera el gráfico de barras en SVG -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="1300" height="550"  class="centrado-svg">
                                    <rect y="10" x="10" height="80" width="{3*$num-municipios-rango1}" fill="#db0a13" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="55" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &lt;= $poblacion-rango1])"/></text>
                                    <rect y="100" x="10" height="80" width="{3*$num-municipios-rango2}" fill="#ebc200" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="145" font-size="24px" fill="black"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango1 and habitantes &lt;= $poblacion-rango2])"/></text>
                                    <rect y="190" x="10" height="80" width="{3*$num-municipios-rango3}" fill="#00904b" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="235" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango2 and habitantes &lt;= $poblacion-rango3])"/></text>
                                    <rect y="280" x="10" height="80" width="{3*$num-municipios-rango4}" fill="#db0a13" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="325" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango3 and habitantes &lt;= $poblacion-rango4])"/></text>
                                    <rect y="370" x="10" height="80" width="{3*$num-municipios-rango5}" fill="#ebc200" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="415" font-size="24px" fill="black"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango4 and habitantes &lt;= $poblacion-rango5])"/></text>
                                    <rect y="460" x="10" height="80" width="{3*$num-municipios-rango6}" fill="#00904b" rx="10" ry="10" stroke="black" stroke-width="3"/>
                                    <text x="20" y="505" font-size="24px" fill="white"><xsl:value-of select="count(municipios/municipio[habitantes &gt; $poblacion-rango5])"/></text>
                                </svg>
                            </td>
                        </tr>
                    </table>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
