/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package thai.dev.util;

import thai.dev.data.model.OrderItem;
import java.util.List;

/**
 *
 * @author Welcome
 */
public class Helper {

    public static double total(List<OrderItem> orderItemList) {
        double total = 0;
        for (int i = 0; i < orderItemList.size(); i++) {
            OrderItem ord = orderItemList.get(i); // Lấy phần tử theo chỉ số i
            total += ord.getPrice() * ord.getQuantity(); // Tính tổng cho phần tử hiện tại
        }
        return total;
    }

}
