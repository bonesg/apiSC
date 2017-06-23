package com.channels.ab.glue.api;

import com.channels.ab.common.EndPoint;
import com.channels.ab.common.JWTTest;
import common.RestAssuredConfig;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.config.SSLConfig;
import io.restassured.http.ContentType;
import io.restassured.response.ValidatableResponse;
import org.apache.http.HttpStatus;
import org.junit.Assert;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.Scanner;

import static io.restassured.RestAssured.given;

/**
 * Created by 1556780 on 6/21/2017.
 */
public class activationKey extends RestAssuredConfig {

    private static ValidatableResponse validatableResponse = null;
    private static String response;
    public static String activationContent=null;
    public static String key=null;
    public static String token=null;
    public static String certificate=null;

    @When("^a POST request is made to the activationKey API$")
    public void a_POST_request_is_made_to_the_activationKey_API() throws Throwable {
        String content = new Scanner(new File(".\\\\src\\\\test\\\\resources\\\\test-data\\\\activationKeyBody.json")).useDelimiter("\\Z").next();

        //capturing API response as validatable response
        validatableResponse =
                given()
                        .contentType(ContentType.JSON)
                        .body(content)
                        .when()
                        .post(EndPoint.POST_CreateActivationKey)
                        .then();
        //capturing API response as String
        response =
                given()
                        .contentType(ContentType.JSON)
                        .body(content)
                        .when()
                        .post(EndPoint.POST_CreateActivationKey)
                        .thenReturn()
                        .asString();

        String[] parts = response.split("\"");
        /*for (String s : parts) {
            System.out.println(s);
        }*/
        activationContent = parts[3];
        key = parts[7];
    }

    @Then("^activationKey API response should be OK$")
    public void API_response_should_be_OK() throws Throwable {
        validatableResponse
                .statusCode(HttpStatus.SC_OK);
    }

    @Then("^content and key data should be generated$")
    public void content_and_key_data_should_be_generated() throws Throwable {
        System.out.println(activationContent);
        System.out.println(key);
    }

    @When("^generated content and key is passed to the create token method$")
    public void generated_content_and_key_is_passed_to_the_create_token_method() throws Throwable {
        token = JWTTest.createToken(activationContent,key);
    }

    @Then("^token should be generated successfully$")
    public void token_should_be_generated_successfully() throws Throwable {
        System.out.println(token);
    }

    @Given("^user has valid SSL certificate$")
    public void user_has_valid_SSL_certificate() throws Throwable {
        certificate = new Scanner(new File(".\\\\src\\\\test\\\\resources\\\\test-data\\\\certificate.txt")).useDelimiter("\\Z").next();
    }

    @Given("^user has already generated the JWT token$")
    public void user_has_already_generated_the_JWT_token() throws Throwable {
        a_POST_request_is_made_to_the_activationKey_API();
        content_and_key_data_should_be_generated();
        generated_content_and_key_is_passed_to_the_create_token_method();
    }

    @When("^a POST request is made to the activate API$")
    public void a_POST_request_is_made_to_the_activate_API() throws Throwable {
        RestAssuredConfig.RestConfig2();
        //capturing API response as validatable response
        validatableResponse =
                given()
                        .contentType(ContentType.TEXT)
                        .header("X-Client-Certificate",certificate)
                        .body(token)
                        .when()
                        .post(EndPoint.POST_ActivateUser)
                        .then();
        //capturing API response as String
        response =
                given()
                        .contentType(ContentType.TEXT)
                        .header("X-Client-Certificate",certificate)
                        .body(token)
                        .when()
                        .post(EndPoint.POST_ActivateUser)
                        .thenReturn()
                        .asString();

    }

    @When("^a POST request is made to akamai endpoint$")
    public void a_POST_request_is_made_to_akamai_endpoint() throws Throwable {
        RestAssuredConfig.RestConfig3();
        token = "abcd";
        //capturing API response as validatable response
        validatableResponse =
                given()
                        //.proxy("10.65.128.43",8080)
                        .contentType(ContentType.TEXT)
                        .body(token)
                        .when()
                        //.post(url)
                        .post(EndPoint.POST_ActivateUser)
                        .then();
        //capturing API response as String
        response =
                given()
                        //.proxy("10.65.128.43",8080)
                        .contentType(ContentType.TEXT)
                        .body(token)
                        .when()
                        //.post(url)
                        .post(EndPoint.POST_ActivateUser)
                        .thenReturn()
                        .asString();
    }

    @Then("^user should be registered successfully$")
    public void user_should_be_registered_successfully() throws Throwable {
        System.out.println("");
        System.out.println(response);
        //Assert.assertTrue(response.contains("Success"));
    }
}
