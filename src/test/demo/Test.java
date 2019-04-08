public class Test {
    public static void main(String[] args) {
        String s1 = "ABC";
        String s2 = "abc";
        String s3 = "abc123";

        System.out.println(s1.compareTo(s2));
        System.out.println(s2.compareTo(s3));
        System.out.println(s1.compareTo(s3));
    }
}
