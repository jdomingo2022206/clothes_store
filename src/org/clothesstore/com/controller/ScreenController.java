package org.clothesstore.com.controller;

import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import org.clothesstore.com.utils.Pantallas;

import java.util.HashMap;

/*
* handle the screen changes, this class is a singleton
* it is used as ScreenController.getInstance().activate(Pantallas.LOGIN);
* */
public class ScreenController {
    Parent currentScreen;
    Stage currentStage;

    // this is where you put the screens
    private HashMap<Pantallas, ScreenChanger> screenMap = new HashMap<Pantallas, ScreenChanger>() {
        {
            /*
            // Usage Example, with a component
            put(Pantallas.EMPRESAS, () -> new CompanyComponent());
            // if you want to use a fxml file, instead of a component, use this:
            put(Pantallas.PROGRAMADOR, () -> {
                try {
                    return FXMLLoader.load(this.getClass().getResource("../view/ProgramadorView.fxml"));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            });
            */
        }
    };
    private Scene main;
    private static ScreenController instance;

    public static ScreenController getInstance() {
        if (instance == null) {
            instance = new ScreenController();
        }
        return instance;
    }

    private ScreenController() {
    }

    public void activate(Pantallas pantallas) {
        if (this.main == null) {
            this.main = new Scene(screenMap.get(pantallas).changeScreen());
        }
        if (currentScreen != null) {
            currentScreen.setDisable(true);
        }
        Parent root = screenMap.get(pantallas).changeScreen();
        main.setRoot(root);
        currentScreen = root;
        currentStage.setScene(this.main);
        /*stage.setScene();
        stage.show();*/
    }

    public void activate(String name) {
        activate(Pantallas.valueOf(name.replace(' ', '_').toUpperCase()));
    }

    public Scene getMain() {
        return this.main;
    }

    public void setStage(Stage stage) {
//        this.main = new Scene(screenMap.get("Menu").changeScreen());
        this.currentStage = stage;
//        stage.setScene(this.main);
    }
}

interface ScreenChanger {
    Parent changeScreen();
}
