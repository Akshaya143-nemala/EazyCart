package com.eazycart;

import com.eazycart.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order-history")
public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static class OrderItem {
        private int orderId;
        private String productName;
        private int quantity;
        private double price;
        private double total;
        private Timestamp orderDate;

        public OrderItem(int orderId, String productName, int quantity, double price, Timestamp orderDate) {
            this.orderId = orderId;
            this.productName = productName;
            this.quantity = quantity;
            this.price = price;
            this.total = quantity * price;
            this.orderDate = orderDate;
        }

        public int getOrderId() { return orderId; }
        public String getProductName() { return productName; }
        public int getQuantity() { return quantity; }
        public double getPrice() { return price; }
        public double getTotal() { return total; }
        public Timestamp getOrderDate() { return orderDate; }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("User ID from session: " + userId);

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
        	String sql = "SELECT oi.order_id, p.name AS product_name, oi.quantity, oi.price, o.order_date " +
                    "FROM order_items oi " +
                    "JOIN orders o ON oi.order_id = o.id " +
                    "JOIN products p ON oi.product_id = p.id " +
                    "WHERE o.user_id = ? ORDER BY o.order_date DESC";


            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int orderId = rs.getInt("order_id");
                        String productName = rs.getString("product_name");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        Timestamp orderDate = rs.getTimestamp("order_date");

                        OrderItem item = new OrderItem(orderId, productName, quantity, price, orderDate);
                        orderItems.add(item);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Order Items Size = " + orderItems.size()); // 🐞 Debug

        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
    }
}
