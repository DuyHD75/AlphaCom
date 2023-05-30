package com.code.alphavn.controller.userController;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class getTokenAndUserInf {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        //System.out.println(response);
        String[] paths = response.split(",");
        //JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken0 = paths[0];
        //System.out.println(accessToken0.charAt(20));
        String accessToken = accessToken0.substring(21, accessToken0.length() - 1);


        //System.out.println(accessToken);
//        System.out.println(jobj);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken.replaceAll("\"", "");
    }


    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        //System.out.println(response);
        //UserGoogleDto googlePojo = new UserGoogleDto();
        //UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
        String lines[] = response.split("\\r?\\n");
        UserGoogleDto userGoogleDto = new UserGoogleDto();
        int check = -1;
        for (String string : lines) {
            //System.out.println(string);
            check++;
            //System.out.println(findNthOccur(string, '\"',3));
            switch (check) {
                case 1:
                    userGoogleDto.setId(string.substring(findNthOccur(string, '\"', 3) + 1, string.length() - 2));
                    break;
                case 2:
                    userGoogleDto.setEmail(string.substring(findNthOccur(string, '\"', 3) + 1, string.length() - 2));
                    break;
                case 3:
                    userGoogleDto.setVerified_email(string.substring(20, string.length() - 1));
                    break;
                case 4:
                    userGoogleDto.setName(string.substring(findNthOccur(string, '\"', 3) + 1, string.length() - 2));
                    break;
                case 7:
                    userGoogleDto.setPicture(string.substring(findNthOccur(string, '\"', 3) + 1, string.length() - 2));
            }

        }

        return userGoogleDto;
    }

    static int findNthOccur(String str,
                            char ch, int N) {
        int occur = 0;

        // Loop to find the Nth
        // occurrence of the character
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == ch) {
                occur += 1;
            }
            if (occur == N)
                return i;
        }
        return -1;
    }
}
