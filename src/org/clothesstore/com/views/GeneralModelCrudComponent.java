package org.clothesstore.com.views;

import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import org.clothesstore.com.controller.FormOperationsController;
import org.clothesstore.com.dao.DAO;

import java.util.HashMap;
import java.util.List;

/*
* This interface represents a component that can be used to
* create, update, delete and cancel operations, it has a
* tableview, a form and a set of buttons to perform the
* operations. It also has a DAO to perform the operations
* on the database. It is a generic interface, so it can be
* used with any model. It might become an abstract class
* that implements this interface and implements the methods
* that are common to all models and then extend that class
* to create a component for a specific model.
* */
public interface GeneralModelCrudComponent<M> {
    /*
     * represents the current operation, it can be:
     * 1. CREATE
     * 2. SAVE
     * 3. DELETE
     * 4. CANCEL
     * */
    public UIOperation getCurrentOperation();

    /*
     * sets the current operation
     * */
    public void setCurrentOperation(UIOperation currentOperation);

    /*
     * returns the selected tuple from the tableview as a model
     * */
    public M getSelectedModel();

    /*
     * fetches data from the database and populates the tableview
     * basically calls the DAO's getAll() method and returns
     * a list of models
     * */
    public void fetchData();

    public Button getBtnSave();

    public Button getBtnDelete();

    public Button getBtnEdit();

    public Button getBtnReport();

    /*
     * represents the fields of the form, the key is the name of the field
     * and the value is the node itself, the node can be a TextField, ComboBox,
     * DatePicker, etc
     * */
    public HashMap<String, Node> getFields();

    public Node getSelectedModelID();

    /*
     * sets the fields of the form with the data from the model,
     * basically it sets the text of the textfields, the value of the
     * comboboxes, DatePicker, etc
     * */
    public void setFields(M model);

    public DAO<M> getDAO();

    public ImageView getImageViewDeleteCancel();

    public ImageView getImageViewCreateSave();

    public Image getImageDelete();

    public Image getImageCancel();

    public Image getImageCreate();

    public Image getImageSave();

    public FormOperationsController<M> getFormOperations();

    public M getModel();

    public String getModelID();

    /*
    * returns the columns of the tableview
    * */
    public List<TableColumn<M, ?>> createColumns();


}
