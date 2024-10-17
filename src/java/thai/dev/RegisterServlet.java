package thai.dev;

import thai.dev.util.EmailService;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.UserDAO;
import thai.dev.data.model.User;

public class RegisterServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Email and password validation
        if (!isValidEmail(email)) {
            session.setAttribute("error", "Invalid email format");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (!isValidPassword(password)) {
            session.setAttribute("error", "Password must be at least 8 characters, include a number and a special character");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = DatabaseDao.getInstance().getUserDao();
        User user = userDAO.find(email);

        if (user != null) {
            session.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // Hash the password using MD5
            String hashedPassword = hashPassword(password);
            String confirmationCode = generateConfirmationCode(); // Generate a confirmation code
            user = new User(email, hashedPassword, "user", confirmationCode, false);
            userDAO.insert(user); // Save user to the database

            // Send confirmation email
            sendConfirmationEmail(email, confirmationCode);

            // Store the email in session for confirmation page
            session.setAttribute("email", email);
            session.setAttribute("confirmationCode", confirmationCode);
            session.setAttribute("waitingForConfirmation", true);
            response.sendRedirect("confirm.jsp"); // Redirect to confirmation page
        }
    }

    // Method to hash the password using MD5
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    // Email format validation
    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

// Password complexity validation
    private boolean isValidPassword(String password) {
        // Regex checks for at least 8 characters, at least one uppercase letter
        String passwordRegex = "^(?=.*[A-Z]).{8,}$";
        Pattern pattern = Pattern.compile(passwordRegex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    private String generateConfirmationCode() {
        int code = new Random().nextInt(999999); // Generate a random 6-digit code
        return String.format("%06d", code); // Format to 6 digits
    }

    private void sendConfirmationEmail(String email, String confirmationCode) {
        String subject = "Confirm your account";
        String body = "Your confirmation code is: " + confirmationCode + ". Please enter this code to confirm your account.";

        System.out.println("Attempting to send confirmation email to: " + email); // Debug log

        try {
            EmailService.sendEmail(email, subject, body);
            System.out.println("Email sent successfully to: " + email); // Log success
        } catch (Exception e) {
            System.err.println("Failed to send email to " + email + ": " + e.getMessage()); // Log failure
            e.printStackTrace(); // Print stack trace for further inspection
        }
    }
}
