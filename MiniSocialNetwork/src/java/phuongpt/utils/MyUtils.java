/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongpt.utils;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author PhuongPT
 */
public class MyUtils {

    private static byte[] getSHA(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    private static String toHexString(byte[] input) {
        BigInteger num = new BigInteger(1, input);
        StringBuilder hexString = new StringBuilder(num.toString(16));
        while (hexString.length() < 32) {
            hexString.insert(0, '0');
        }
        return hexString.toString();
    }

    public static String encryptPassword(String input) throws NoSuchAlgorithmException {
        return toHexString(getSHA(input));
    }

    public static int seperateNumber(String postID) throws NumberFormatException {
        String[] arr = postID.split("", 2);
        return Integer.parseInt(arr[1]);
    }

    public static String getRandomCode() {
        // chose a Character random from this String 
        String alphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        // create StringBuffer size of 6 
        StringBuilder sb = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            // generate a random number between 0 to AlphaNumericString variable length 
            int index = (int) (alphaNumericString.length() * Math.random());

            // add Character one by one in end of sb 
            sb.append(alphaNumericString.charAt(index));
        }
        return sb.toString();
    }

}
