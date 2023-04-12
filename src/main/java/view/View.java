package view;

import java.util.Scanner;

public class View {
    private static Scanner scanner = new Scanner(System.in);

    public static void showMenu() {
        System.out.println("""
                1 Завести новое животное
                2 Показать список всех команд
                3 Добавить новую команду всем животным
                4 Выход
                """);
    }

    public static String userInput() {
        System.out.print("Введите команду: ");
        return scanner.nextLine();
    }

    public static void showSubmenu() {
        System.out.println("Введите через пробел: Класс животного, Имя и год рождения");
    }
}
