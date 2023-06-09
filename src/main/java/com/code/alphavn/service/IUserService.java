package com.code.alphavn.service;

import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.ProductReview;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<ProductInfo> getProducts() throws SQLException;

    List<ProductInfo> getProductByCategory(String category) throws SQLException;

    ProductInfo getProductByID(int id) throws SQLException;
    boolean insertReview(ProductReview productReview) throws SQLException;
    ProductReview getProductRatingReviews(int pid) throws SQLException;



}
