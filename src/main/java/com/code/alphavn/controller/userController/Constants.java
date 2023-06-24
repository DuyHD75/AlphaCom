package com.code.alphavn.controller.userController;

public class Constants {
    public static String GOOGLE_CLIENT_ID = "212851330816-dr1g74keegsd7futmtj2ldv58hktiu2i.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/alphavn/LoginGoogleHandler";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    public static String FACEBOOK_APP_ID = "226465510121542";
    public static String FACEBOOK_APP_SECRET = "c2868dfbfb81584c4d35de3590c322e7";
    public static String FACEBOOK_REDIRECT_URL = "https://localhost:8080/AlphaElectro/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";


}
