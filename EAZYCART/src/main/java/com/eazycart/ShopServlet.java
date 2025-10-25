package com.eazycart;

import com.eazycart.model.Product;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Inner class for order item
    static class OrderItem {
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

        List<Product> productList = new ArrayList<>();
        List<OrderItem> orderItems = new ArrayList<>();

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eazycart", "root", "3009");

            // 1. Get all products
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("image_path"));
                productList.add(p);
            }

            // 2. Get order history of logged-in user
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId != null) {
                String sql = "SELECT o.id AS order_id, p.name AS product_name, oi.quantity, p.price, o.order_date " +
                             "FROM orders o " +
                             "JOIN order_items oi ON o.id = oi.order_id " +
                             "JOIN products p ON oi.product_id = p.id " +
                             "WHERE o.user_id = ? " +
                             "ORDER BY o.order_date DESC";

                try (PreparedStatement stmt2 = con.prepareStatement(sql)) {
                    stmt2.setInt(1, userId);
                    try (ResultSet rs2 = stmt2.executeQuery()) {
                        while (rs2.next()) {
                            OrderItem item = new OrderItem(
                                    rs2.getInt("order_id"),
                                    rs2.getString("product_name"),
                                    rs2.getInt("quantity"),
                                    rs2.getDouble("price"),
                                    rs2.getTimestamp("order_date")
                            );
                            orderItems.add(item);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        request.setAttribute("products", productList);
        request.setAttribute("orderItems", orderItems);
        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
        rd.forward(request, response);
    }
}
