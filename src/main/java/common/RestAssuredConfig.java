/**
 * 
 */
package common;


import io.restassured.RestAssured;
import io.restassured.config.SSLConfig;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.*;
import java.security.cert.CertificateException;

/**
 * @author 1556780
 * RestAssured Configurations
 */
public class RestAssuredConfig {
	static String password="";
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
	}

	public static void RestConfig3() {

		//RestAssured.config().sslConfig( new SSLConfig().relaxedHTTPSValidation());
		RestAssured.baseURI = "https://apitest.standardchartered.com";
		RestAssured.port = 443;
		RestAssured.basePath = "/cib/api/v1";

		//reading
		KeyStore keyStore = null;
		SSLConfig config = null;

		char[] password = "abc12345".toCharArray();
		FileInputStream fIn = null;
		try {
			fIn = new FileInputStream(".\\\\src\\\\test\\\\resources\\\\mykeystore");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		try {
			keyStore.load(fIn, password);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (CertificateException e) {
			e.printStackTrace();
		}
		if (keyStore != null) {

			org.apache.http.conn.ssl.SSLSocketFactory clientAuthFactory = null;
			try {
				clientAuthFactory = new org.apache.http.conn.ssl.SSLSocketFactory(keyStore, String.valueOf(password));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (KeyManagementException e) {
				e.printStackTrace();
			} catch (KeyStoreException e) {
				e.printStackTrace();
			} catch (UnrecoverableKeyException e) {
				e.printStackTrace();
			}
			// set the config in rest assured
			config = new SSLConfig().with().sslSocketFactory(clientAuthFactory).and().allowAllHostnames();
			RestAssured.config = RestAssured.config().sslConfig(config);
		}
	}

	@Test
	public void certificateSetup() {
		KeyStore keyStore = null;
		SSLConfig config = null;
		password="abc12345";

		try {
			keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
			//keyStore.load(new FileInputStream(".\\\\src\\\\test\\\\resources\\\\Client_Cert.cer"), password.toCharArray());

		} catch (Exception ex) {
			System.out.println("Error while loading keystore >>>>>>>>>");
			ex.printStackTrace();
		}

		if (keyStore != null) {

			org.apache.http.conn.ssl.SSLSocketFactory clientAuthFactory = null;
			try {
				clientAuthFactory = new org.apache.http.conn.ssl.SSLSocketFactory(keyStore, password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (KeyManagementException e) {
				e.printStackTrace();
			} catch (KeyStoreException e) {
				e.printStackTrace();
			} catch (UnrecoverableKeyException e) {
				e.printStackTrace();
			}

			// set the config in rest assured
			config = new SSLConfig().with().sslSocketFactory(clientAuthFactory).and().allowAllHostnames();

			RestAssured.config = RestAssured.config().sslConfig(config);
			String response =RestAssured.given().relaxedHTTPSValidation().when().get("https://apitest.standardchartered.com/cib/api/v1/activate").thenReturn()
					.asString();
			System.out.println(response);

		}
	}

	@Test
	public void runCommandLine(){
		try {
			Runtime.getRuntime().exec("cd C:\\Users\\1556780\\Desktop\\API Banking");
			Runtime.getRuntime().exec("keytool -import -alias mk -file Client_Cert.cer -keystore test");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
