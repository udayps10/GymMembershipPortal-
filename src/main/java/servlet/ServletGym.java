package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/ServletGym")
public class ServletGym extends HttpServlet {

    private UserDAO dao = new UserDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");
        HttpSession session = req.getSession();

        if (action == null) {
            res.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

       
        if (action.equals("login")) {

            String email = req.getParameter("email");
            String password = req.getParameter("password");

         
            if (email.equals("admin@gym.com") && password.equals("admin123")) {
                session.setAttribute("admin", "true");
                res.sendRedirect(req.getContextPath() + "/adminDashboard.jsp");
                return;
            }

            User u = dao.login(email, password);

            if (u != null) {
                session.setAttribute("user", u);
                res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
            } else {
                res.sendRedirect(req.getContextPath() + "/index.jsp?error=1");
            }
        }

       
        else if (action.equals("register")) {

            User u = new User();

            u.setName(req.getParameter("name"));
            u.setAge(Integer.parseInt(req.getParameter("age")));
            u.setGender(req.getParameter("gender"));
            u.setWeight(Float.parseFloat(req.getParameter("weight")));
            u.setHeight(Float.parseFloat(req.getParameter("height")));
            u.setEmail(req.getParameter("email"));
            u.setPassword(req.getParameter("password"));

            u.setTrainer("None");
            u.setPlan("Basic");

            LocalDate start = LocalDate.now();
            LocalDate expiry = start.plusMonths(6);

            u.setMembershipStartDate(start);
            u.setExpiry(expiry);

            if (dao.addUser(u)) {
                res.sendRedirect(req.getContextPath() + "/index.jsp?msg=registered");
            } else {
                res.sendRedirect(req.getContextPath() + "/index.jsp?error=reg_failed");
            }
        }

        
        else if (action.equals("selectTrainer")) {

            User u = (User) session.getAttribute("user");
            String trainer = req.getParameter("trainer");

            if (u != null) {

                dao.updateTrainer(u.getId(), trainer);

                u.setTrainer(trainer);
                session.setAttribute("user", u);
            }

            res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
        }

      
        else if (action.equals("upgradePlan")) {

            User u = (User) session.getAttribute("user");
            String plan = req.getParameter("planName");

            if (u != null) {

                dao.upgradeMembership(u.getId(), plan);

                u.setPlan(plan);
                session.setAttribute("user", u);
            }

            res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");

        if (action == null) {
            res.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }


        if (action.equals("delete")) {

            int id = Integer.parseInt(req.getParameter("id"));

            dao.deleteUser(id);

            res.sendRedirect(req.getContextPath() + "/ServletGym?action=view");
        }

        else if (action.equals("view")) {

            req.setAttribute("members", dao.getAllUsers());

            req.getRequestDispatcher("/viewMembers.jsp").forward(req, res);
        }

        else if (action.equals("logout")) {

            req.getSession().invalidate();

            res.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }
}