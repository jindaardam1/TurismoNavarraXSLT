package UtilsCreaccionXML;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Peticion {
    private static final String BASE_URL = "https://eu1.locationiq.com/v1/search.php?key=pk.e9f24dfe3e282acb6dafc763ffe1927a&q=";
    public static JSONObject getCoordinates(String address) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        JSONObject json = null;
        try {
            address = address.replaceAll("\\s", "+");
            String url = BASE_URL + address + "&format=json";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            JSONArray jsonArray = new JSONArray(response.toString());
            if (jsonArray.length() > 0) {
                json = jsonArray.getJSONObject(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

}
