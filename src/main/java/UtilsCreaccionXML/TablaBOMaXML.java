package UtilsCreaccionXML;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.*;

/**
 * Clase encargada de transformar la tabla de la web del BON a un XML
 * válido para usar con XSLT.
 */
public class TablaBOMaXML {
    public static void main(String[] args) {
        File archivo = new File("tabla.xml");
        extraerInformacion(archivo);
    }

    public static void extraerInformacion(File file) {
        try (InputStream inputStream = new FileInputStream(file);
             InputStreamReader inputStreamReader = new InputStreamReader(inputStream)) {
            // Crear un objeto Document a partir del archivo
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            InputSource inputSource = new InputSource(inputStreamReader);
            Document doc = factory.newDocumentBuilder().parse(inputSource);

            // Obtener todos los elementos <tr>
            NodeList rows = (NodeList) getXPath().evaluate("//tr", doc, XPathConstants.NODESET);

            // Crear un objeto Document con la raíz "municipios"
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document nuevoXML = dBuilder.newDocument();
            Element rootElement = nuevoXML.createElement("municipios");
            nuevoXML.appendChild(rootElement);

            // Iterar por cada elemento <tr>
            for (int i = 0; i < rows.getLength(); i++) {
                // Obtener el valor de la etiqueta <p> con la clase "tablas-c7-izquierda-c"
                String valorIzquierda = (String) getXPath().evaluate(
                        "./td/p[@class='tablas-c7-izquierda-c']/text()",
                        rows.item(i),
                        XPathConstants.STRING);

                // Obtener el valor de la etiqueta <p> con la clase "tablas-c7-derecha-c"
                String valorDerecha = (String) getXPath().evaluate(
                        "./td/p[@class='tablas-c7-derecha-c']/text()",
                        rows.item(i),
                        XPathConstants.STRING);

                // Imprimir los valores
                System.out.println("Municipio: " + valorIzquierda);
                System.out.println("Habitantes: " + valorDerecha);

                Element municipio = nuevoXML.createElement("municipio");
                municipio.setAttribute("id", Integer.toString(i));
                rootElement.appendChild(municipio);

                Element nombre = nuevoXML.createElement("nombre");
                nombre.appendChild(nuevoXML.createTextNode(valorIzquierda));
                municipio.appendChild(nombre);

                Element habitantes = nuevoXML.createElement("habitantes");
                habitantes.appendChild(nuevoXML.createTextNode(valorDerecha));
                municipio.appendChild(habitantes);
            }

            // Escribir el documento en un archivo XML
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(nuevoXML);
            StreamResult result = new StreamResult(new FileOutputStream("MunicipiosYConcejos.xml"));
            transformer.transform(source, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static XPath getXPath() {
        XPathFactory xpathFactory = XPathFactory.newInstance();
        return xpathFactory.newXPath();
    }
}
