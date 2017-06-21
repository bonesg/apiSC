package common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.crypto.RsaSHA256Signer;
import org.joda.time.Instant;

import java.security.InvalidKeyException;
import java.security.PrivateKey;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateKey;

import static java.lang.System.currentTimeMillis;
import static org.joda.time.Instant.now;

public class JWT {

    private static final String ISSUER = "SCB";

    private static final String AUDIENCE = "SCB-APIBanking";

    private static final long TOKEN_TIMEOUT_DURATION = 1000L * 30L;

    private JWT() { }

    public static <T> String createToken(T payload, PrivateKey privateKey) {

        RsaSHA256Signer signer;
        try {
            signer = new RsaSHA256Signer(ISSUER, null, (RSAPrivateKey) privateKey);

            //Configure JSON token
            JsonToken token = new JsonToken(signer);

            token.setAudience(AUDIENCE);
            token.setIssuedAt(now());
            token.setExpiration(new Instant(currentTimeMillis() + TOKEN_TIMEOUT_DURATION));

            //Configure request object, which provides information of the item
            JsonObject payloadO = token.getPayloadAsJsonObject();
            payloadO.add("payload", new Gson().toJsonTree(payload));
            return token.serializeAndSign();

        } catch (SignatureException | InvalidKeyException e) {
            throw new RuntimeException(e);
        }
    }

}
