import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDao {

	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean result = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/dare_to_design?useSSL=false", "root", "12345");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
				        .prepareStatement("select * from usersignup where email = ? and passwords = ? ")) {
			preparedStatement.setString(1, loginBean.getEmail());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			result = rs.next();

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
		return result;
		
	}
}
