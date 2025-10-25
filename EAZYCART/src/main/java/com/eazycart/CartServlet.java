package com.eazycart;

import com.eazycart.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet({"/add-to-cart", "/view-cart"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Add to Cart
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/eazycart", "root", "3009"
            );

            // ✅ Check if item already in cart
            String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkSql);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, productId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                int existingQty = rs.getInt("quantity");
                String updateSql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                PreparedStatement updateStmt = con.prepareStatement(updateSql);
                updateStmt.setInt(1, existingQty + quantity);
                updateStmt.setInt(2, userId);
                updateStmt.setInt(3, productId);
                updateStmt.executeUpdate();
            } else {
                String insertSql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = con.prepareStatement(insertSql);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, quantity);
                insertStmt.executeUpdate();
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("shop?added=success");


    }

    // ✅ View Cart
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        List<Product> cartProducts = new ArrayList<>();
        double total = 0.0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/eazycart", "root", "3009"
            );

            String sql = "SELECT p.*, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("image_path"));
                p.setQuantity(rs.getInt("quantity"));

                total += rs.getDouble("price") * rs.getInt("quantity");

                cartProducts.add(p);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("cartProducts", cartProducts);
        request.setAttribute("totalPrice", total);

        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.forward(request, response);
    }
}
