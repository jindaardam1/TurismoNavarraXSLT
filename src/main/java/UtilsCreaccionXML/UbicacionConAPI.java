package UtilsCreaccionXML;

import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamWriter;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.FileOutputStream;

public class UbicacionConAPI {
    public static void main(String[] args) {
        procesarXML("Campings.xml");
    }

    public static void procesarXML(String archivoXML) {
        try {
            // Crear un objeto XPath
            XPath xpath = XPathFactory.newInstance().newXPath();

            // Crear un objeto Document a partir del archivo XML
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            InputSource input = new InputSource(archivoXML);
            Document doc = builder.parse(input);

            // Obtener todos los elementos <row>
            NodeList rows = (NodeList) xpath.evaluate("//row", doc, XPathConstants.NODESET);

            // Crear el objeto FileOutputStream para escribir en el archivo
            FileOutputStream fos = new FileOutputStream("CampingsConCoordenadas.xml");

            // Crear un objeto XMLStreamWriter con XMLOutputFactory
            XMLOutputFactory xmlFactory = XMLOutputFactory.newInstance();
            XMLStreamWriter xmlWriter = xmlFactory.createXMLStreamWriter(fos);

            // Escribir la raíz del archivo
            xmlWriter.writeStartDocument();
            xmlWriter.writeStartElement("data");

            // Iterar sobre cada elemento <row> y extraer los valores de DIRECCION, LOCALIDAD y MUNICIPIO
            for (int i = 0; i < rows.getLength(); i++) {
                Node row = rows.item(i);
                String direccion = (String) xpath.evaluate("DIRECCION", row, XPathConstants.STRING);
                String localidad = (String) xpath.evaluate("LOCALIDAD", row, XPathConstants.STRING);
                String municipio = (String) xpath.evaluate("MUNICIPIO", row, XPathConstants.STRING);
                String plazas = (String) xpath.evaluate("PLAZAS", row, XPathConstants.STRING);
                String categoria = (String) xpath.evaluate("CATEGORIA", row, XPathConstants.STRING);
                String codInscripcion = (String) xpath.evaluate("COD_INSCRIPCION", row, XPathConstants.STRING);
                String nombre = (String) xpath.evaluate("NOMBRE", row, XPathConstants.STRING);
                String modalidad = (String) xpath.evaluate("MODALIDAD", row, XPathConstants.STRING);
                String zona = (String) xpath.evaluate("ZONA", row, XPathConstants.STRING);
                String fechaDeInscripcion = (String) xpath.evaluate("FECHA_DE_INSCRIPCION", row, XPathConstants.STRING);

                String latitud;
                String longitud;

                try {
                    JSONObject json = Peticion.getCoordinates(reemplazarCaracteresEspeciales(direccion) + ", "
                            + reemplazarCaracteresEspeciales(localidad) + ", " + reemplazarCaracteresEspeciales(municipio));
                    latitud = json.getString("lat");
                    longitud = json.getString("lon");
                    System.out.println("Latitud: " + latitud + " Longitud: " + longitud);
                    System.out.println("Categoría: " + categoria);
                    System.out.println("Número de plazas " + plazas + "\n");
                    if (Double.parseDouble(latitud) > 41.5 && Double.parseDouble(latitud) < 43.5) {
                        if (Double.parseDouble(longitud) > -2.5 && Double.parseDouble(longitud) < -0.5) {
                            xmlWriter.writeStartElement("row");
                            xmlWriter.writeAttribute("id", String.valueOf(i + 1));

                            xmlWriter.writeStartElement("cod_inscripcion");
                            xmlWriter.writeCharacters(codInscripcion);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("nombre");
                            xmlWriter.writeCharacters(nombre);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("modalidad");
                            xmlWriter.writeCharacters(modalidad);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("categoria");
                            xmlWriter.writeCharacters(categoria);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("direccion");
                            xmlWriter.writeCharacters(direccion);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("localidad");
                            xmlWriter.writeCharacters(localidad);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("municipio");
                            xmlWriter.writeCharacters(municipio);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("zona");
                            xmlWriter.writeCharacters(zona);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("plazas");
                            xmlWriter.writeCharacters(plazas);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("fecha_de_inscripcion");
                            xmlWriter.writeCharacters(fechaDeInscripcion);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("latitud");
                            xmlWriter.writeCharacters(latitud);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeStartElement("longitud");
                            xmlWriter.writeCharacters(longitud);
                            xmlWriter.writeEndElement();

                            xmlWriter.writeEndElement();
                        }
                    }
                } catch (NullPointerException e) {
                    e.printStackTrace();
                }

            }

            // Cerrar la raíz y el archivo
            xmlWriter.writeEndElement();
            xmlWriter.writeEndDocument();
            xmlWriter.flush();
            xmlWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String reemplazarCaracteresEspeciales(String input) {
        String output = input;
        output = output.replaceAll("[áàäâÁÀÄÂ]", "a");
        output = output.replaceAll("[éèëêÉÈËÊ]", "e");
        output = output.replaceAll("[íìïîÍÌÏÎ]", "i");
        output = output.replaceAll("[óòöôÓÒÖÔ]", "o");
        output = output.replaceAll("[úùüûÚÙÜÛ]", "u");
        output = output.replaceAll("[ñÑ]", "n");
        return output;
    }
}
