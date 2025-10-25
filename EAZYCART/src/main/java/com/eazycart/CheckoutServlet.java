package com.eazycart;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eazycart", "root", "3009")) {

            // Calculate total price
            String getTotalSql = "SELECT SUM(p.price * c.quantity) AS total FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            PreparedStatement totalStmt = con.prepareStatement(getTotalSql);
            totalStmt.setInt(1, userId);
            ResultSet totalRs = totalStmt.executeQuery();
            double totalAmount = 0.0;
            if (totalRs.next()) {
                totalAmount = totalRs.getDouble("total");
            }

            // Insert into orders table
            String insertOrder = "INSERT INTO orders (user_id, total_amount) VALUES (?, ?)";
            PreparedStatement orderStmt = con.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.setDouble(2, totalAmount);
            orderStmt.executeUpdate();

            ResultSet generatedKeys = orderStmt.getGeneratedKeys();
            int orderId = -1;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
                System.out.println("Order placed with ID: " + orderId);
            }

            // Insert into order_items
            String getItemsSql = "SELECT product_id, quantity, p.price FROM cart c JOIN products p ON c.product_id = p.id WHERE user_id = ?";
            PreparedStatement itemsStmt = con.prepareStatement(getItemsSql);
            itemsStmt.setInt(1, userId);
            ResultSet itemsRs = itemsStmt.executeQuery();

            String insertItem = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement itemStmt = con.prepareStatement(insertItem);

            while (itemsRs.next()) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, itemsRs.getInt("product_id"));
                itemStmt.setInt(3, itemsRs.getInt("quantity"));
                itemStmt.setDouble(4, itemsRs.getDouble("price"));
                itemStmt.executeUpdate();
            }

            // Clear the cart
            String clearSql = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement clearStmt = con.prepareStatement(clearSql);
            clearStmt.setInt(1, userId);
            clearStmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("order-success.jsp");
    }
}
