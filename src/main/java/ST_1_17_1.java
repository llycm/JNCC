import java.io.IOException;

public class ST_1_17_1 {
    public static void main(String[] args) throws IOException {
        int[] cards = {2, 3, 4, 5, 6, 7, 8};
        int count = 0;
        for (int i = 0; i < cards.length; i++) {
            for (int j = 0; j < cards.length; j++) {
                if (i != j && (cards[i] + cards[j]) % 2 == 1) {
                    count++;
                }
            }
        }
        System.out.println("小米猜对的次数为：" + count);
    }
}
