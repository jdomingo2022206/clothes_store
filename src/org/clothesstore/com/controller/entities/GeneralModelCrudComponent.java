package org.clothesstore.com.controller.entities;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import org.clothesstore.com.controller.CRUDOperation;
import org.clothesstore.com.controller.FormOperationsController;
import org.clothesstore.com.controller.ScreenController;
import org.clothesstore.com.dao.DAO;
import org.clothesstore.com.report.GenerateReport;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

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
public abstract class GeneralModelCrudComponent<M> implements Initializable {
    @FXML private ImageView homeImg;
    @FXML private ImageView imageViewCreateSave;
    @FXML private ImageView imageViewDeleteCancel;
    @FXML private Image imageCreate;
    @FXML private Image imageSave;
    @FXML private Image imageDelete;
    @FXML private Image imageCancel;
    @FXML private Button btnEdit;
    @FXML private Button btnDelete;
    @FXML private Button btnSave;
    @FXML private Button btnReport;
    @FXML
    private TableView<M> tblModel;

    private String title = "";

    private FormOperationsController<M> formOperations;
    protected DAO<M> dao;
    protected HashMap<String, Node> fields;
    private final String separator = " - ";
    private final CRUDOperation<M> crudOperations = new CRUDOperation<>(this);

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        setDefaultDAO();
        setDefaultTitle();
                HashMap<String, Object> parameters = new HashMap<String, Object>() {{
            // replace \ with \\ to avoid errors
            put("baseDir", System.getProperty("user.dir").replaceAll("\\\\", "\\\\\\\\"));
        }};
        System.out.println(parameters.get("baseDir"));
        System.out.println("baseDir");
        getBtnSave().setOnMouseClicked(event -> crudOperations.onCreate());
        getBtnDelete().setOnMouseClicked(event -> crudOperations.onCancel());
        getBtnEdit().setOnMouseClicked(event -> crudOperations.onEdit());
        getBtnReport().setOnMouseClicked(vent -> GenerateReport.mostrarReporte(this.title, "Reporte de " + this.title,
                parameters));
        getImageViewCreateSave().setImage(getImageCreate());
        getImageViewDeleteCancel().setImage(getImageDelete());
        // getFormOperations().setDefaultFields();
        // getFormOperations().setFormData();
        getFormOperations().disableFields();

        getHomeImg().setOnMouseClicked(event -> {
            // hide current window
            ScreenController.getInstance().getMain().getWindow().hide();
            Stage stage = new Stage();

            // set the main window to the stage
            ScreenController.getInstance().setStage(stage);
            // ScreenController.getInstance().activate(Pantallas.SOMETHING);
            stage.setResizable(true);

            // show the stage
            stage.show();
        });

        // when clicked on a row, select the row, on click again, deselect the row
        AtomicBoolean isAlreadySelected = new AtomicBoolean(false);
        AtomicReference<M> currentSelected = new AtomicReference<M>(null);
        tblModel.setOnMouseClicked(event -> {
            if (!isAlreadySelected.get() || (currentSelected.get() != getSelectedModel())) {
                isAlreadySelected.set(true);
                currentSelected.set(getSelectedModel());
                setFields(getSelectedModel());
                return;
            }
            tblModel.getSelectionModel().clearSelection();
            getFormOperations().clearFields();
            isAlreadySelected.set(false);
            currentSelected.set(null);
        });

        try {
            // set the columns to the table
            tblModel.getColumns().addAll(createColumns());
            fetchData();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void setComboboxValue(ComboBox comboBox, int id) {
        // iterate over the comboBox items
        for (int i = 0; i < comboBox.getItems().size(); i++) {
            // if the item is equal to the model's id, set the comboBox value to that item
            if (comboBox.getItems().get(i).toString().split(separator)[0].equals(String.valueOf(id))) {
                comboBox.getSelectionModel().select(i);
                comboBox.setValue(comboBox.getItems().get(i));
                break;
            }
        }
    }

    /*
     * fetches data from the database and populates the tableview
     * basically calls the DAO's getAll() method and returns
     * a list of models
     * */
    public void fetchData() throws Exception {
        tblModel.setItems(FXCollections.observableArrayList(getDAO().readAll()));
    }

    // Getters

    /*
     * returns the selected tuple from the tableview as a model
     * */
    public M getSelectedModel() {
        return tblModel.getSelectionModel().getSelectedItem();
    }

    /*
     * represents the fields of the form, the key is the name of the field
     * and the value is the node itself, the node can be a TextField, ComboBox,
     * DatePicker, etc
     * */
    public HashMap<String, Node> getFields() {
        return this.fields;
    }

    public void setFields(HashMap<String, Node> fields) {
        this.fields = fields;
    }

    public DAO<M> getDAO() {
        return this.dao;
    }

    public ImageView getImageViewCreateSave() {
        return imageViewCreateSave;
    }

    public ImageView getImageViewDeleteCancel() {
        return imageViewDeleteCancel;
    }

    public Image getImageCreate() {
        return imageCreate;
    }

    public Image getImageSave() {
        return imageSave;
    }

    public Image getImageDelete() {
        return imageDelete;
    }

    public Image getImageCancel() {
        return imageCancel;
    }

    public Button getBtnEdit() {
        return btnEdit;
    }

    public Button getBtnDelete() {
        return btnDelete;
    }

    public Button getBtnSave() {
        return btnSave;
    }

    public Button getBtnReport() {
        return btnReport;
    }

    public ImageView getHomeImg() {
        return homeImg;
    }

    public FormOperationsController<M> getFormOperations() {
        return formOperations;
    }

    /*
    * because we don't have constructors in interfaces, we use this method
    * to set the DAO, it is called in the initialize method of the class
    * that implements this interface. it must be used as follows:
    * this.dao = new ModelDAO(new ModelQueryMapper<M>(), "save", "update", "delete", "readAll", "readByID");
    * */
    protected abstract void setDefaultDAO();
    /*
    * because we don't have constructors in interfaces, we use this method
    * to set the title, it is called in the initialize method of the class
    * that implements this interface. it must be used as follows:
    * this.title = "Model";
    * */
    protected abstract void setDefaultTitle();
    /*
     * represents the current operation, it can be:
     * 1. CREATE
     * 2. SAVE
     * 3. DELETE
     * 4. CANCEL
     * */
    public abstract UIOperation getCurrentOperation();

    /*
     * sets the current operation
     * */
    public abstract void setCurrentOperation(UIOperation currentOperation);


    public abstract Node getSelectedModelID();

    /*
     * sets the fields of the form with the data from the model,
     * basically it sets the text of the textfields, the value of the
     * comboboxes, DatePicker, etc
     * */
    public abstract void setFields(M model);

    public abstract M getModel();

    public abstract String getModelID();

    /*
    * returns the columns of the tableview
    * */
    public abstract List<TableColumn<M, ?>> createColumns();
}
