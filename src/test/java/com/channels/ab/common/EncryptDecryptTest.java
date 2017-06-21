package com.channels.ab.common;

import common.EncryptDecrypt.EncryptedContent;
import common.EncryptDecrypt;
import org.apache.commons.io.IOUtils;
import org.junit.Test;

import javax.crypto.NoSuchPaddingException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.util.Arrays;

import static common.EncryptDecrypt.getPrivateKey;
import static common.EncryptDecrypt.getPublicKey;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class EncryptDecryptTest {

    @Test
    public void encryptWithPublicKey_short() throws Exception {

        EncryptDecrypt encryptDecrypt = new EncryptDecrypt();
        EncryptedContent content = encryptDecrypt.encryptWithPublicKey(getPublicKey("keyPair/publicKey"), aShortString());
        String decypted = encryptDecrypt.decryptWithPrivateKey(getPrivateKey("keyPair/privateKey"), content);
        assertEquals(aShortString(), decypted);

    }

    @Test(expected = RuntimeException.class)
    public void getPrivateKey_with_missing_file_name_fails_gracefully() throws Exception {
        getPrivateKey("I_do_not_exist");
    }

    @Test(expected = RuntimeException.class)
    public void getPrivateKey_with_no_file_name_fails_gracefully() throws Exception {
        getPrivateKey(null);
    }

    @Test(expected = RuntimeException.class)
    public void getPublicKey_with_missing_file_name_fails_gracefully() throws Exception {
        getPublicKey("I_do_not_exist");
    }

    @Test(expected = RuntimeException.class)
    public void getPublicKey_with_no_file_name_fails_gracefully() throws Exception {
        getPublicKey(null);
    }

    @Test(expected = RuntimeException.class)
    public void encrypt_with_public_key_fails_gracefully_for_null_key() throws Exception {
        new EncryptDecrypt().encryptWithPublicKey(null, "some content");
    }

    @Test(expected = RuntimeException.class)
    public void encrypt_with_public_key_fails_gracefully_for_null_content() throws Exception {
        new EncryptDecrypt().encryptWithPublicKey(getPublicKey("keyPair/publicKey"), null);
    }

    @Test(expected = RuntimeException.class)
    public void decrypt_with_private_key_fails_gracefully_for_null_key() throws NoSuchPaddingException, NoSuchAlgorithmException {
        new EncryptDecrypt().decryptWithPrivateKey(null, new EncryptedContent());
    }

    @Test(expected = RuntimeException.class)
    public void decrypt_with_private_key_fails_gracefully_for_null_content() throws NoSuchPaddingException, NoSuchAlgorithmException {
        new EncryptDecrypt().decryptWithPrivateKey(getPrivateKey("keyPair/privateKey"), null);
    }

    @Test(expected = RuntimeException.class)
    public void decrypt_with_private_key_fails_gracefully_for_empty_content() throws NoSuchPaddingException, NoSuchAlgorithmException {
        new EncryptDecrypt().decryptWithPrivateKey(getPrivateKey("keyPair/privateKey"), new EncryptedContent());
    }

    @Test
    public void decrypt_encrypted_payload() throws IOException, NoSuchPaddingException, NoSuchAlgorithmException {
        String decrypt = new EncryptDecrypt().decryptWithPrivateKey(new EncryptDecrypt().convertStringToPrivateKey(
                IOUtils.toString(JWTTest.class.getClassLoader().getResourceAsStream("privateKey.txt"))),
                new EncryptedContent(
                        "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",
                        "EYybVdV858cbIknobWRHNIF65IL98a9yE+vAl5g9mm7VpMgcsG7CMusW3LDBzZkaPTidO7g4QQ88YysjaSRF+JkJuCVKjpejFbRMJdNQ0cgM6MK6/sc2EMCG0/+I+oHX6Zz2T+K+CWIir5Eb9cD2jxqGc97CFORCR4+fshnzubMutOTX4nLdx5+w3m+WbBYsU3sjANm3y6M9GUOfF6ZFL5TAH9asc2J19t1kKNhm9Iy1tlAaBqQlmiGMyf3DyUhDttVr+fA+ST3w8fI8RHP5lhWhgp1QOFwKuqE5/uAPqYSzfpLfwMawTBBb1aE3VUyllsYT7GYzBhmpDeMVr8KByw=="
                ));
        System.out.println(decrypt);
    }

    @Test
    public void convert_string_to_public_key_happy_path() throws NoSuchPaddingException, NoSuchAlgorithmException {
        PublicKey key = new EncryptDecrypt().convertStringToPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApZ4fzLOpvo3L+5kCrcf1D2gkbiw+Rd/9xWqkww5lqAy94sfQ6Hw4tAhHec6vzDkV2/xbGcbLYBtCHE88nWccpKtG+1KZVdImZg+ehYtPjnE+4t81UUuXfeBloM0pY8/LKkNahEgB2004D04lRMTvuTjO8Dp2h2t/QDItdDsB4SdsAIQY93QM8np1TNv5RG8xmk1SR5TQ0C2ghYLSW2G6sUnwJVJp3OdY20tCuPwPhiZgiI1bQnoZ0K0NQaWMAqRsl7ZBSiRhtlZP3bc1fxPLMzGE9unAz4W5Z4mfGjssrJ6RtgPEUHPp9BZeFzU+AgA3CBwYhd+dzUf7JMoV9HSmRQIDAQAB");
        assertNotNull(key);
        assertEquals("RSA",key.getAlgorithm());
    }

    @Test(expected = RuntimeException.class)
    public void convert_string_to_public_key_invalid_key() throws NoSuchPaddingException, NoSuchAlgorithmException {
        PublicKey key = new EncryptDecrypt().convertStringToPublicKey("I am invalid");
    }

    @Test
    public void encryptWithPublicKey_long() throws Exception {

        EncryptDecrypt encryptDecrypt = new EncryptDecrypt();
        EncryptedContent content = encryptDecrypt.encryptWithPublicKey(getPublicKey("keyPair/publicKey"), aLongString());
        String decypted = encryptDecrypt.decryptWithPrivateKey(getPrivateKey("keyPair/privateKey"), content);
        assertEquals(aLongString(), decypted);

    }
    private String aShortString() {
        char[] content = new char[1024];
        Arrays.fill(content, 'Z');
        return new String(content);
    }

    private String aLongString() {
        char[] content = new char[1024*100];
        Arrays.fill(content, 'Z');
        return new String(content);
    }



}