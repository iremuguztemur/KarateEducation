package examples.education;
import com.intuit.karate.junit5.Karate;
public class EducationRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("Education").relativeTo(getClass());
    }

}