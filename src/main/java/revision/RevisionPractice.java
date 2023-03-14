package revision;

import java.util.regex.Pattern;

public class RevisionPractice {
    public static void main(String[] args) {
        String mobileNo = "17976897915";
        String pattern = "[678]{1}[0-9]{9}";
        System.out.println(Pattern.matches(pattern,mobileNo));
    }
}
