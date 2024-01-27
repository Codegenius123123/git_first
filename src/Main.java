import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.HashMap;

public class Main{
    public static void main(String[] args){

        //array, arrayList, linkedList, hashMaps

        String[] friendsArray = new String[5];
        friendsArray[0] = "kl";
        friendsArray[1] = "virat";
        friendsArray[2] = "rohit";
        friendsArray[3] = "bumrah";
        friendsArray[4] = "jadeja";

        for (String i : friendsArray){
            System.out.println(i);
        }

        ArrayList<String> friendsArrayList = new ArrayList<>(Arrays.asList("kl","virat","rohit","bumrah","jaddu"));

        System.out.println(friendsArray[0]);
        System.out.println(friendsArrayList.get(0));

        friendsArray[2]  = "rohitGurunath";
        System.out.println(friendsArray[2]);
        friendsArrayList.set(2,"rogitGurunath");
        System.out.println(friendsArrayList.get(2));

        friendsArrayList.add("ashwin");
        System.out.println(friendsArrayList.get(5));

        friendsArrayList.remove(4);
        System.out.println(friendsArrayList.get(4));

        LinkedList<String> friendsLinkedList = new LinkedList<>();

        friendsLinkedList.add("kl");
        friendsLinkedList.add("virat");
        friendsLinkedList.add("rohit");
        friendsLinkedList.add("bumrah");
        friendsLinkedList.add("jadeja");

        System.out.println(friendsLinkedList);

        HashMap<String, Integer> empIds = new HashMap<>();

        empIds.put("kl",1);
        empIds.put("virat",18);
        empIds.put("rohit",45);
        empIds.put("bumtah",50);
        empIds.put("jadeja",34);

        System.out.println(empIds.get(1));
        System.out.println(empIds.containsKey("kl"));
        System.out.println(empIds.containsValue("456"));

    }
}



