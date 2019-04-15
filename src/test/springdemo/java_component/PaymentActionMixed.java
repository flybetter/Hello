package java_component;

import java_component.IOrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PaymentActionMixed {


    private IOrderDao orderDao;

    @Autowired
    public PaymentActionMixed(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public void addOrder(String  orderType) {
        this.orderDao.addOrder(orderType);
    }
}
