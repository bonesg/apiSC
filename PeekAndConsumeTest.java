package ab.api.tests;

import org.junit.Test;

import static io.restassured.RestAssured.given;

/**
 * Created by 1571168 on 7/31/2017.
 */
public class PeekAndConsumeTest {

    @Test
    public void peekTest(){
        String data = given()
                .proxy("10.23.210.60", 8080)
                .header("GroupId","INRCMS02")
                .header("Content-Type","text/plain")
                //.contentType(ContentType.TEXT)
                .when()
                .get("https://10.23.210.60:9012/api/core/event/peek")
                .thenReturn()
                .asString();
        System.out.println("Peek Value "+data.toString());
    }

    @Test
    public void consumeTest(){
        final String data = given()
                .proxy("10.23.210.60", 8080)
                //.contentType(ContentType.TEXT)
                .when().header("GroupId","INRCMS02")
                .get("https://10.23.210.60:9012/api/core/event/consume")
                .thenReturn()
                .asString();
        System.out.println("Consume Value "+data);
    }
}
