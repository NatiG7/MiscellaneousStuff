import java.util.Random;

public class StringGenerator {
    // Default character set for generating random strings
    private static final String DEFAULT_CHAR_SET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    /**
     * Generates a random string of specified length using the given character set.
     *
     * @param length  The length of the random string to generate.
     * @param charSet The character set to use for generating the string. If null or
     *                empty, the default character set is used.
     * @return        A random string of the specified length.
     * @throws IllegalArgumentException If the length is less than or equal to 0.
     */

    // Generate a string with specific charset (not UTF-8 etc.)
    public static String generateRandomString(int length, String charSet) {
        if (length <= 0) {
            throw new IllegalArgumentException("String length must be greater than 0.");
        }
        if (charSet == null || charSet.isEmpty()) {
            charSet = DEFAULT_CHAR_SET; // Use the default character set if none is provided
        }

        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(charSet.length()); // Select a random character from the set
            // Add random char to string, append at index.
            stringBuilder.append(charSet.charAt(index));
        }

        return stringBuilder.toString();
    }

    /**
     * Generates a random string of specified length using the default character
     * set.
     *
     * @param length The length of the random string to generate.
     * @return A random string of the specified length.
     */
    public static String generateRandomString(int length) {
        return generateRandomString(length, DEFAULT_CHAR_SET);
    }

    /**
     * Generates a string consisting of a specified number of random words.
     * Each word has a random length up to the specified maximum word length.
     *
     * @param numberOfWords The number of words to generate.
     * @param maxWordLength The maximum length of each word.
     * @param charSet       The character set to use for generating the words. If
     *                      null or empty, the default character set is used.
     * @return A string of random words separated by spaces.
     * @throws IllegalArgumentException If the number of words or max word length is
     *                                  less than or equal to 0.
     */
    public static String generateRandomWords(int numberOfWords, int maxWordLength, String charSet) {
        if (numberOfWords <= 0) {
            throw new IllegalArgumentException("Number of words must be greater than 0.");
        }
        if (maxWordLength <= 0) {
            throw new IllegalArgumentException("Max word length must be greater than 0.");
        }

        Random random = new Random();
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < numberOfWords; i++) {
            int wordLength = random.nextInt(maxWordLength) + 1; // Generate word length between 1 and maxWordLength
            String word = generateRandomString(wordLength, charSet);
            result.append(word);

            if (i < numberOfWords - 1) {
                result.append(" "); // Add a space between words
            }
        }

        return result.toString();
    }

    /**
     * Generates a string consisting of a specified number of random words using the
     * default character set.
     * Each word has a random length up to the specified maximum word length.
     *
     * @param numberOfWords The number of words to generate.
     * @param maxWordLength The maximum length of each word.
     * @return A string of random words separated by spaces.
     */
    public static String generateRandomWords(int numberOfWords, int maxWordLength) {
        return generateRandomWords(numberOfWords, maxWordLength, DEFAULT_CHAR_SET);
    }

    public static void main(String[] args) {
        // Example usage of the StringGenerator

        // Generate a single random string of length 10
        String randomString = generateRandomString(10);
        System.out.println("Random String (Default Set): " + randomString);

        // Generate a string of 5 random words, each up to 8 characters long
        String randomWords = generateRandomWords(5, 8);
        System.out.println("Random Words (Default Set): " + randomWords);

        // Generate a string of 3 random words with a custom character set
        String charSet = "abcdef123";
        String randomCustomWords = generateRandomWords(3, 6, charSet);
        System.out.println("Random Words (Custom Set): " + randomCustomWords);
    }
}
