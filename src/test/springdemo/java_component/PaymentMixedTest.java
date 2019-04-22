package java_component;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = PaymentConfig.class)
public class PaymentMixedTest {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PaymentActionMixed paymentActionMixed;

    @Test
    public void testPaymentMixedAddOrder() {
        logger.info("stupid");
        this.paymentActionMixed.addOrder("create_sub");
    }

}

