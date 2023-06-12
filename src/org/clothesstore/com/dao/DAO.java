package org.clothesstore.com.dao;

import org.clothesstore.com.dao.mapper.ModelQueryMapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO<M> {
    // Attributes
    private final String saveProcedure;
    private final String readProcedure;
    private final String readAllProcedure;
    private final String updateProcedure;
    private final String deleteProcedure;
    private final ModelQueryMapper<M> modelQueryMapper;

    // Constructor
    public DAO(ModelQueryMapper<M> modelQueryMapper, String saveProcedure, String readProcedure, String readAllProcedure, String updateProcedure, String deleteProcedure) {
        this.modelQueryMapper = modelQueryMapper;
        this.saveProcedure = saveProcedure;
        this.readProcedure = readProcedure;
        this.readAllProcedure = readAllProcedure;
        this.updateProcedure = updateProcedure;
        this.deleteProcedure = deleteProcedure;
    }

    protected PreparedStatement prepareCall(String procedure) throws SQLException {
        return DBConnection.getInstance().getConnection().prepareCall("CALL " + procedure);
    }

    protected void printError(Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }

    public void save(M model) throws Exception {
        try {
            PreparedStatement sp = prepareCall(saveProcedure);
            modelQueryMapper.setProcedureParamsCreate(sp, model);
            sp.execute();
        } catch (SQLException e) {
            printError(e);
            throw new Exception("no se ha podido Guardar los Datos");
        }
    }

    public M search(String id) throws Exception {
        try {
            PreparedStatement sp = prepareCall(readProcedure);
            modelQueryMapper.setIdParam(sp, id);
            ResultSet resultSet = sp.executeQuery();
            while (resultSet.next()) {
                return modelQueryMapper.resulsetToObject(resultSet);
            }
        } catch (SQLException e) {
            printError(e);
            throw new Exception("no se ha podido Encontrar los Datos");
        }
        return null;
    }

    public ArrayList<M> readAll() throws Exception {

        try {
            ArrayList<M> modelList = new ArrayList<>();
            PreparedStatement sp = prepareCall(readAllProcedure);
            ResultSet resultSet = sp.executeQuery();
            while (resultSet.next()) {
                modelList.add(modelQueryMapper.resulsetToObject(resultSet));
            }
            return modelList;
        } catch (SQLException e) {
            printError(e);
            throw new Exception("Ha habido algún error en la base de Datos");
        }
    }

    public void update(M model) throws Exception {
        try {
            PreparedStatement sp = prepareCall(updateProcedure);
            modelQueryMapper.setProcedureParamsUpdate(sp, model);
            sp.execute();
        } catch (SQLException e) {
            printError(e);
            throw new Exception("no se ha podido Actualizar los datos");
        }
    }

    public void delete(String id) throws Exception {
        try {
            PreparedStatement sp = prepareCall(deleteProcedure);
            modelQueryMapper.setIdParam(sp, id);
            sp.execute();
        } catch (SQLException e) {
            printError(e);
            throw new Exception("no se ha podido Eliminar los datos");
        }
    }
}

