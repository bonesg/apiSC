package common;

/**
 * Created by 1556780 on 6/22/2017.
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Key;
import java.security.KeyStore;
import java.security.cert.Certificate;
import java.io.IOException;
import java.io.InputStream;
import java.io.DataInputStream;
import java.io.ByteArrayInputStream;
import java.security.spec.*;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.util.Collection;

public class ImportCA {
    public static void main(String[] argv) throws Exception {

        String certfile = ".\\src\\test\\resources\\Client_Cert.cer"; /*your cert path*/
        FileInputStream is = new FileInputStream("exampleraystore.keystore");

        KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        keystore.load(is, "abc12345".toCharArray());

        String alias = "mk";
        char[] password = "abc12345".toCharArray();

        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        InputStream certstream = fullStream (certfile);
        Certificate certs =  cf.generateCertificate(certstream);

        File keystoreFile = new File("abc12345.keystore");

// Load the keystore contents
        FileInputStream in = new FileInputStream(keystoreFile);
        keystore.load(in, password);
        in.close();

// Add the certificate
        keystore.setCertificateEntry(alias, certs);

// Save the new keystore contents
        FileOutputStream out = new FileOutputStream(keystoreFile);
        keystore.store(out, password);
        out.close();

    }

    private static InputStream fullStream ( String fname ) throws IOException {
        FileInputStream fis = new FileInputStream(fname);
        DataInputStream dis = new DataInputStream(fis);
        byte[] bytes = new byte[dis.available()];
        dis.readFully(bytes);
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        return bais;
    }
}
