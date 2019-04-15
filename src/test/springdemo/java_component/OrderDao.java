package java_component;

import org.springframework.stereotype.Component;

@Component
public class OrderDao implements IOrderDao {

    @Override
    public void addOrder(String orderType) {
        System.out.println("real add order, order type is " + orderType);
    }
}
