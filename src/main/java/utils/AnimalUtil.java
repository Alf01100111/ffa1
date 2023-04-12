package utils;

import model.*;
import view.View;

import java.util.ArrayList;
import java.util.List;

public class AnimalUtil {
    List<Animal> animals = new ArrayList<>();

    public void addNewCommand() {
        Animal.getCommands().add(View.userInput());
        System.out.println();
        System.out.println("Команда успешно добавлена\n");
    }

    public void createAnimal() {
        View.showSubmenu();

        String[] input = View.userInput().split(" ");
        if (input.length != 3 || input[2].matches("\\d")) {
            System.err.println("Не верно введены данные\n");
            return;
        }

        switch (input[0].toLowerCase()) {
            case "camel" -> animals.add(new Camel(input[1], Integer.parseInt(input[2])));
            case "cat" -> animals.add(new Cat(input[1], Integer.parseInt(input[2])));
            case "dog" -> animals.add(new Dog(input[1], Integer.parseInt(input[2])));
            case "donkey" -> animals.add(new Donkey(input[1], Integer.parseInt(input[2])));
            case "hamster" -> animals.add(new Hamster(input[1], Integer.parseInt(input[2])));
            case "horse" -> animals.add(new Horse(input[1], Integer.parseInt(input[2])));
            default -> System.err.println("Введены не корректные данные\n");
        }
    }

    public void showAllCommands() {
        if (animals.size() == 0) {
            System.err.println("В зоопарке нет ни одного животного\n");
            return;
        }

        if (Animal.getCommands().size() == 0) {
            System.err.println("Нет выученных команд\n");
            return;
        }

        Animal.getCommands().forEach(System.out::println);
    }
}
