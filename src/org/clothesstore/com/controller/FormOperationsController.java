package org.clothesstore.com.controller;

import eu.schudt.javafx.controls.calendar.DatePicker;
import javafx.scene.Node;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import org.clothesstore.com.views.GeneralModelCrudComponent;

import java.util.Map;

public class FormOperationsController<M> {

    private final GeneralModelCrudComponent<M> component;

    public FormOperationsController(GeneralModelCrudComponent<M> component) {
        this.component = component;
    }

    private void makeOperation(FormOperation operation) {
        for (Node node : component.getFields().values()) {
            operation.operate(node);
        }
    }

    public void clearFields() {
        makeOperation((node) -> {
            if (node instanceof TextField) {
                ((TextField) node).setText("");
            }

            if (node instanceof ComboBox) {
                ComboBox<?> comboBox = ((ComboBox<?>) node);
                comboBox.setValue(null);
                comboBox.getSelectionModel().clearSelection();
            }

            if (node instanceof DatePicker) {
                System.out.println("clearing datepicker");
                ((DatePicker) node).setSelectedDate(null);
            }
        });
    }

    public void enableFields() {
        makeOperation((node) -> node.setDisable(false));

        // set the id field to disabled
        component.getSelectedModelID().setDisable(true);
    }

    public void disableFields() {
        makeOperation((node) -> node.setDisable(true));
    }

    public boolean areFieldsEmpty() {
        for (Map.Entry<String, Node> field : component.getFields().entrySet()) {
            if (component.getSelectedModelID() == field.getValue()) continue;

            if (field.getValue() instanceof TextField) {
                System.out.println("text field");
                System.out.println(((TextField) field.getValue()).getText());
                if (((TextField) field.getValue()).getText().isEmpty()) return true;
            }

            if (field.getValue() instanceof ComboBox<?>) {
                System.out.println("combo box");
                System.out.println(((ComboBox<?>) field.getValue()).getSelectionModel().getSelectedItem());
                if (((ComboBox<?>) field.getValue()).getSelectionModel().isEmpty()) return true;
            }

            if (field.getValue() instanceof DatePicker) {
                System.out.println(((DatePicker) field.getValue()).getSelectedDate());
                if (((DatePicker) field.getValue()).getSelectedDate() == null) return true;
            }
        }
        return false;
    }

}

interface FormOperation {
    void operate(Node node);
}

