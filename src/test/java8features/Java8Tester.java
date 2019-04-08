import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Java8Tester {
    public static void main(String[] args) {

        List<String> name1 = new ArrayList<>();
        name1.add("Taobao");
        name1.add("xinlan");
        name1.add("baidu");
        name1.add("sina");


        List<String> name2 = new ArrayList<>();
        name2.add("Taobao");
        name2.add("Xinlan");
        name2.add("baidu");
        name2.add("sina");


        Java8Tester test = new Java8Tester();

        test.sortUpdateJava7(name1);
        System.out.println(name1);

        test.sortUpdateJava8(name2);
        System.out.println(name2);


    }

    private void sortUpdateJava7(List<String> names) {

        Collections.sort(names, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });

    }

    private void sortUpdateJava8(List<String> names) {
        Collections.sort(names, (s1, s2) -> s1.compareTo(s2));
    }
}
