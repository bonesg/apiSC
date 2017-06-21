/**
 * 
 */
package common;


import io.restassured.RestAssured;

/**
 * @author 1556780
 * RestAssured Configurations
 */
public class RestAssuredConfig {

	public static String env = null;

	public static void RestConfig(){

		//Activation Key and JWT generation
		RestAssured.baseURI = "http://uklvadapp007";
		env = RestAssured.baseURI;
		RestAssured.port = 8080;
		RestAssured.basePath = "/api";
	}

	public static void RestConfig2(){

		//User registration
		RestAssured.baseURI = "http://uklvadapp006";
		env = RestAssured.baseURI;
		RestAssured.port = 8080;
		RestAssured.basePath = "/cib/api/v1";

	}

}
