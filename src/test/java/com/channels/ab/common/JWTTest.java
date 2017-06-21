package com.channels.ab.common;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import common.EncryptDecrypt;
import common.JWT;
import org.apache.commons.io.IOUtils;
import org.junit.Test;

import java.util.Map;

/**
 * Created by 1409314 on 6/7/2017.
 */
public class JWTTest {


    @Test(expected = RuntimeException.class)
    public void createToken_handles_invalid_key() throws Exception {
        JWT.createToken(Lists.newArrayList(), null);
    }

    @Test
    public static String createToken(String activateKeyContent, String activateKey) throws Exception {
        Map<String,Object> activationRequest = Maps.newHashMap();
        activationRequest.put("webHookUrl", "http://mywebhook");
        activationRequest.put("webHookEnabled", "true");
        activationRequest.put("activationKey",
                ImmutableMap.of("content", activateKeyContent,
                        "key", activateKey));
        String token = JWT.createToken(activationRequest, new EncryptDecrypt().convertStringToPrivateKey(
                IOUtils.toString(JWTTest.class.getClassLoader().getResourceAsStream("privateKey.txt"))
        ));

        return token;

        //System.out.println(token);
    }
}