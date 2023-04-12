package model;

import java.util.ArrayList;
import java.util.List;

public abstract class Animal {
    private static int count;
    private static List<String> commands = new ArrayList<>();
    private String name;
    private int birthYear;

    public Animal(String name, int birthYear) {
        this.name = name;
        this.birthYear = birthYear;
        count++;
    }

    public static int getCount() {
        return count;
    }

    public static List<String> getCommands() {
        return commands;
    }
}
