package org.clothesstore.com.controller;

import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import org.clothesstore.com.views.GeneralModelCrudComponent;

import javax.swing.JOptionPane;

public class CRUDOperation<M> {
    private final GeneralModelCrudComponent<M> component;
    private final Image imageSave;
    private final Image imageCreate;
    private final Image imageDelete;
    private final Image imageCancel;
    private final ImageView imageViewCreateSave;
    private final ImageView imageViewDeleteCancel;
    private final FormOperationsController<M> formOperationsController;

    public CRUDOperation(GeneralModelCrudComponent<M> component) {
        this.component = component;
        this.imageSave = component.getImageSave();
        this.imageCreate = component.getImageCreate();
        this.imageDelete = component.getImageDelete();
        this.imageCancel = component.getImageCancel();
        this.imageViewCreateSave = component.getImageViewCreateSave();
        this.imageViewDeleteCancel = component.getImageViewDeleteCancel();
        this.formOperationsController = component.getFormOperations();
    }

    // public
    public void onCreate() {
        formOperationsController.enableFields();
        if (component.getBtnSave().getText().equals("Guardar")) onSave();
        toggleImage("Nuevo");
        toggleImageCancel();
        component.setCurrentOperation(() -> component.getDAO().save(component.getModel()));
    }

    public void onCancel() {
        System.out.println("OnCancelDelete Clicked");
        formOperationsController.disableFields();
        formOperationsController.clearFields();
        System.out.println(component.getBtnDelete().getText());
        if (component.getBtnDelete().getText().equals("Eliminar") && component.getModelID() == null) return;
        if (component.getBtnDelete().getText().equals("Eliminar")) {
            onDelete();
            return;
        }
        System.out.println("cancel");
        toggleImageCancel();
        toggleImage("Nuevo");
    }

    public void onEdit() {
        if (component.getSelectedModel() == null) return;
        formOperationsController.enableFields();
        component.setFields(component.getSelectedModel());
        if (component.getBtnSave().getText().equals("Guardar")) return;
        toggleImage("Modificar");
        toggleImageCancel();
        component.setCurrentOperation(() -> component.getDAO().update(component.getModel()));
    }


    // private
    private void onSave() {
        try {
            if (formOperationsController.areFieldsEmpty()) throw new Exception("Fields are empty");
            component.getCurrentOperation().operate();
            formOperationsController.clearFields();
            formOperationsController.disableFields();
            component.fetchData();
//            getBtnSave().setText("Nuevo");
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    private void onDelete() {
        try {
            int respuesta = JOptionPane.showConfirmDialog(null, "¿Está seguro que desea eliminar este registro?" + "\n esta tabla puede ser una llave foranea", "Eliminar", JOptionPane.YES_NO_OPTION);
            if (respuesta == JOptionPane.NO_OPTION) return;
            component.getDAO().delete(component.getModelID());
            component.fetchData();
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    private void toggleImageCancel() {
        if (imageViewDeleteCancel.getImage() == imageDelete) {
            imageViewDeleteCancel.setImage(imageCancel);
            component.getBtnDelete().setText("Cancelar");
            return;
        }

        if (imageViewDeleteCancel.getImage() == imageCancel) {
            imageViewDeleteCancel.setImage(imageDelete);
            component.getBtnDelete().setText("Eliminar");
            formOperationsController.disableFields();
            formOperationsController.clearFields();
        }
    }

    private void toggleImage(String text) {
        if (imageViewCreateSave.getImage() == imageSave) {
            imageViewCreateSave.setImage(imageCreate);
            component.getBtnSave().setText(text);
            return;
        }
        // Guardar
        if (imageViewCreateSave.getImage() == imageCreate) {
            imageViewCreateSave.setImage(imageSave);
            component.getBtnSave().setText("Guardar");
            formOperationsController.enableFields();
        }

    }

}

