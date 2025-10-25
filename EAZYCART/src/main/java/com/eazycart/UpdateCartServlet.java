package com.eazycart;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eazycart", "root", "3009"
            );

            if ("increase".equals(action)) {
                String sql = "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, productId);
                ps.executeUpdate();

            } else if ("decrease".equals(action)) {
                String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
                PreparedStatement checkStmt = con.prepareStatement(checkSql);
                checkStmt.setInt(1, userId);
                checkStmt.setInt(2, productId);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next() && rs.getInt("quantity") > 1) {
                    String updateSql = "UPDATE cart SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ?";
                    PreparedStatement updateStmt = con.prepareStatement(updateSql);
                    updateStmt.setInt(1, userId);
                    updateStmt.setInt(2, productId);
                    updateStmt.executeUpdate();
                }

            } else if ("remove".equals(action)) {
                String deleteSql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
                PreparedStatement ps = con.prepareStatement(deleteSql);
                ps.setInt(1, userId);
                ps.setInt(2, productId);
                ps.executeUpdate();
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("view-cart");
    }
}
