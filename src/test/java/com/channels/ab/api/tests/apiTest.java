package com.channels.ab.api.tests;

import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;
import com.standardchartered.genie.junit.Genie;

@RunWith(Genie.class)
@CucumberOptions(
        features = {"classpath:features"},
        glue = {
        "classpath:com.channels.ab.glue",
        "classpath:config"
        },
        tags = {"@akamai","~@ignore"},
        strict = true
)
public class apiTest {

}
