package com.channels.ab.glue.api;

import common.RestAssuredConfig;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;


/**
 * Created by 1556780 on 2/27/2017.
 * This class contains common methods used across all the api glue-code classes
 */
public class commonApiMethods {

    //Setting up rest configuration: BaseURI, BasePath, Port
    @Before
    public void setup_API_Configurations() throws Throwable {
        RestAssuredConfig.RestConfig();
    }

    @Given("^'(.+)' API$")
    public void an_API(String apiName) throws Throwable {
        System.out.println("Validating: "+apiName+" API. ");
    }
}
