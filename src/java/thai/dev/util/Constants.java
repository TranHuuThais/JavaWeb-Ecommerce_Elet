package thai.dev.util;

public class Constants {

    public static final String DB_URL = "jdbc:mysql://localhost:3306/ecomus";
    public static final String USER = "root";
    public static final String PASS = "";

    public static final int RELATED_NUMBER = 6;
    public static final int NUMBER_LIMIT = 8;
    public static final int NUMBER_EVENT = 8;

    public static final int PER_PAGE = 8;
    public static final int PAGE_SIZE = 6;

    public static final String GOOGLE_CLIENT_ID = System.getenv("GOOGLE_OAUTH_CLIENT_ID");
    public static final String GOOGLE_CLIENT_SECRET = System.getenv("GOOGLE_OAUTH_CLIENT_SECRET");
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8081/Elet/LoginServlet";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
}
