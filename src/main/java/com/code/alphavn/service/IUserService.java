package com.code.alphavn.service;

import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.ProductReview;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<ProductInfo> getNewProducts() throws SQLException;

    List<ProductInfo> getProductByCategory(String category) throws SQLException;

    ProductInfo getProductByID(int id) throws SQLException;

    Boolean insertReview(ProductReview productReview) throws SQLException;
  
    ProductReview getProductRatingReviews(int pid) throws SQLException;

    List<ProductDiscount> getProductDiscounts() throws SQLException;

    List<ProductReview> getProductReviews(int pid) throws SQLException;

}
