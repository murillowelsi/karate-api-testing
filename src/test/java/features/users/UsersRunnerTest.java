package features.users;

import com.intuit.karate.junit5.Karate;

public class UsersRunnerTest {
    @Karate.Test
    public Karate createUser() {
        return Karate.run("classpath:../features/users/create-user.feature");
    }

    @Karate.Test
    public Karate getAllUsers() {
        return Karate.run("classpath:../features/users/get-all-users.feature");
    }

    @Karate.Test
    public Karate getUserById() {
        return Karate.run("classpath:../features/users/get-user-by-id.feature");
    }
}
