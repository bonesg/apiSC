package common;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Random;

import static javax.xml.bind.DatatypeConverter.parseBase64Binary;
import static javax.xml.bind.DatatypeConverter.parseHexBinary;

public final class EncryptDecrypt {

    private static final byte[] IV = new byte[16];

    private static final String SYMMETRIC_KEY_ALGO = "AES";
    private static final String SYMMETRIC_CIPHER_ALGO = "AES/CBC/PKCS5Padding";

    private static final String KEY_PAIR_ALGO = "RSA";

    private Cipher cipher;
    private Cipher aesCipher;

    public static class EncryptedContent {

        private String content;
        private String key;

        public EncryptedContent() { }

        public EncryptedContent(String content, String key) {
            this.content = content;
            this.key = key;
        }

        public String getContent() {
            return content;
        }

        public String getKey() {
            return key;
        }
    }

    public EncryptDecrypt() throws NoSuchAlgorithmException, NoSuchPaddingException {
        this.cipher = Cipher.getInstance(KEY_PAIR_ALGO);
        this.aesCipher = Cipher.getInstance(SYMMETRIC_CIPHER_ALGO);
    }

    public static PrivateKey getPrivateKey(String filename) {
        try (InputStream fileIn = EncryptDecrypt.class.getClassLoader().getResourceAsStream(filename)) {
            byte[] keyBytes = toByteArray(fileIn);
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
            KeyFactory kf = KeyFactory.getInstance(KEY_PAIR_ALGO);
            return kf.generatePrivate(spec);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(),e);
        }
    }

    public static PublicKey getPublicKey(String filename)  {
        try (InputStream fileIn = EncryptDecrypt.class.getClassLoader().getResourceAsStream(filename)) {
            byte[] keyBytes = toByteArray(fileIn);
            X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
            KeyFactory kf = KeyFactory.getInstance(KEY_PAIR_ALGO);
            return kf.generatePublic(spec);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(),e);
        }
    }

   public synchronized EncryptedContent encryptWithPublicKey(PublicKey publicKey, String content) {

        SecretKey aesKey = generateSecret();
        try {

            this.aesCipher.init(Cipher.ENCRYPT_MODE, aesKey, new IvParameterSpec(IV));
            byte[] contentEncrypted = aesCipher.doFinal(content.getBytes("UTF-8"));

            byte[] pkEncAesKey = aesKey.getEncoded();
            this.cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            byte[] aesEncrypyted = this.cipher.doFinal(pkEncAesKey);

            return new EncryptedContent(
                    DatatypeConverter.printBase64Binary(contentEncrypted),
                    DatatypeConverter.printBase64Binary(aesEncrypyted)
            );

        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(),e);
        }
    }

    public synchronized String decryptWithPrivateKey(PrivateKey key, EncryptedContent content) {

        try {
            this.cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] aesKey = cipher.doFinal(parseBase64Binary(content.getKey()));
            this.aesCipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(aesKey, 0, aesKey.length, SYMMETRIC_KEY_ALGO), new IvParameterSpec(IV));
            return new String(this.aesCipher.doFinal(parseBase64Binary(content.getContent())));
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(),e);
        }
    }

    public PublicKey convertStringToPublicKey(String KeyString) {
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(parseBase64Binary(KeyString));
        try {
            KeyFactory keyFactory = KeyFactory.getInstance(KEY_PAIR_ALGO);
            return keyFactory.generatePublic(keySpec);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            throw new RuntimeException(ex.getMessage(),ex);
        }
    }

    public PrivateKey convertStringToPrivateKey(String KeyString) {
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(parseBase64Binary(KeyString));
        try {
            KeyFactory kf = KeyFactory.getInstance(KEY_PAIR_ALGO);
            return kf.generatePrivate(spec);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            throw new RuntimeException(ex.getMessage(),ex);
        }
    }

    private static SecretKey generateSecret() {
        return new SecretKeySpec(parseHexBinary(randomHexaKeyGenerator()), SYMMETRIC_KEY_ALGO);
    }

    private static byte[] toByteArray(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        copyLarge(input, output);
        return output.toByteArray();
    }

    private static long copyLarge(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[4096];
        long count = 0L;
        int n1;
        for(boolean n = false; -1 != (n1 = input.read(buffer)); count += (long)n1) {
            output.write(buffer, 0, n1);
        }
        return count;
    }

    private static String randomHexaKeyGenerator() {
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        while (sb.length() < 32) {
            sb.append(Integer.toHexString(r.nextInt()));
        }
        return sb.toString().substring(0, 32);
    }
}