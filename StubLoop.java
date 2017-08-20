package ab.common;

import cucumber.api.java.en.When;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTopic;
import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by 1571168 on 8/4/2017.
 */
public class StubLoop {


    public static void main(String args[]) throws JMSException, IOException {

            ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://10.23.210.60:61616");
            Connection con = null;

            String amount = "9600";
            String currencyCode = "INR";
            String accountNumber = "17082017";
            String trxType = "C";
            String bic = "SCBLINBBXXX";
            for (int j = 0; j < 5; j++) {
                try {
                con = connectionFactory.createConnection();
                Session session = con.createSession(true, Session.AUTO_ACKNOWLEDGE);
                MessageProducer producer = session.createProducer(new ActiveMQTopic("scbCoreBankingTxnAlertCorpFinTxnNotifyV1T"));
                PostMessageForWebHook postMessageForWebHook = new PostMessageForWebHook();
                String filepath = new File(".").getCanonicalPath() + "/src/test/resources/rta-template.xml";
                DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
                System.out.println(filepath);
                Document doc = docBuilder.parse(filepath);
                System.out.println(doc);
                Node staff = doc.getElementsByTagName("notifyCorporateFinancialTransactionRequest").item(0);
                System.out.println(staff);
                NodeList list = staff.getChildNodes();
                Node student = list.item(3);
                System.out.println(student);
                NodeList list1 = student.getChildNodes();
                Node trxnRequest = list1.item(5);
                System.out.println(trxnRequest);
                NodeList list2 = trxnRequest.getChildNodes();
                Node trxDetail = list2.item(1);
                System.out.println(trxDetail);
                NodeList list3 = trxDetail.getChildNodes();
                Node trxEntry = list3.item(1);
                //System.out.println(student);
                NodeList lists = trxEntry.getChildNodes();
                for (int i = 0; i < lists.getLength(); i++) {
                    Node node = lists.item(i);
                    // get the salary element, and update the value
                    if (node.getNodeName().equals("tns:TrnAmount")) {
                        int intnumber = Integer.parseInt(amount)+5;
                        amount = ""+intnumber;
                        node.setTextContent(amount);
                        System.out.println(node.getTextContent());
                    }
                    if (node.getNodeName().equals("tns:Account")) {
                        NodeList accountList = node.getChildNodes();
                        Node currencyCodeNode = accountList.item(1);
                        currencyCodeNode.setTextContent(currencyCode);
                        System.out.println(currencyCodeNode.getTextContent());
                        Node accountNo = accountList.item(3);
                        accountNo.setTextContent(accountNumber);
                        System.out.println(accountNo.getTextContent());
                    }
                    if (node.getNodeName().equals("tns:CreditDebitFlag")) {
                        if(j%2==0)
                            trxType = "C";
                        else
                        trxType = "D";
                        node.setTextContent(trxType);
                        System.out.println(node.getTextContent());
                    }
                    if (node.getNodeName().contains("tns:SwiftAddress")) {
                        node.setTextContent(bic);
                        System.out.println(node.getTextContent());
                    }
                }
                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(doc);
                StreamResult result = new StreamResult(new File(filepath));
                transformer.transform(source, result);
                producer.send(postMessageForWebHook.createTextMessage(session, new FileInputStream(new ClassPathResource("rta-template.xml").getFile())));
                session.commit();
                producer.close();
                session.close();
                con.close();
                System.out.println("Message published");
            }catch(ParserConfigurationException pce){
                pce.printStackTrace();
            }catch(TransformerException tfe){
                tfe.printStackTrace();
            }catch(IOException ioe){
                ioe.printStackTrace();
            }catch(SAXException sae){
                sae.printStackTrace();
            }catch(JMSException e){
                e.printStackTrace();
            }
        }
    }
}

