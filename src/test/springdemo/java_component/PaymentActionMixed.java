package java_component;

import java_component.IOrderDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PaymentActionMixed {

    private static final Logger logger = LoggerFactory.getLogger(PaymentActionMixed.class);

    private IOrderDao orderDao;

    @Autowired
    public PaymentActionMixed(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public void addOrder(String orderType) {
        this.orderDao.addOrder(orderType);
    }
}
