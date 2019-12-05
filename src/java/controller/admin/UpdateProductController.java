package controller.admin;

import data.CategoryData;
import data.ProductData;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Category;
import model.Product;

@WebServlet(urlPatterns = "/admin/product/update")
public class UpdateProductController extends HttpServlet {

    CategoryData categoryData = new CategoryData();
    ProductData productData = new ProductData();
    List<Category> categories = categoryData.search("");
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pid = req.getParameter("pid");
        Product product = productData.get(Integer.parseInt(pid));
//        List<Category> categories = categoryData.search("");
        req.setAttribute("categories", categories);
        req.setAttribute("product", product);
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/update_product.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Product product = new Product();
        Category category = new Category();

        String[] message = new String[5];
        boolean filled = true;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(new File("F:\\JaVa\\NongSan\\web\\static\\admin\\images\\product"));
            ServletFileUpload fileUpload = new ServletFileUpload(factory); // doc request de lay cac truong tu form tu client
            List<FileItem> fieldList = fileUpload.parseRequest(req);
            
            for (FileItem field : fieldList) {
                if (field.getFieldName().equals("id")) {
                    if (field.getString().isEmpty()) {
                        filled = false;
                    } else {
                        product.setId(Integer.parseInt(field.getString()));
                    }
                }
                if (field.getFieldName().equals("name")) {
                    if (field.getString().isEmpty()) {
                        message[0] = "You must enter a name for the product.";
                        filled = false;
                    } else {
                        product.setName(field.getString());
                    }
                }
                if (field.getFieldName().equals("price")) {
                    float price = -1;
                    try {
                        price = Float.parseFloat(field.getString());
                        if (price < 0) {
                            throw new NumberFormatException();
                        }

                    } catch (NumberFormatException e) {
                        message[1] = "You must enter a valid weight number.";
                        filled = false;
                    }
                    product.setPrice(price);
                }
                if (field.getFieldName().equals("weight")) {
                    int weight = -1;
                    try {
                        weight = Integer.parseInt(field.getString());
                        if (weight < 0) {
                            throw new NumberFormatException();
                        }

                    } catch (NumberFormatException e) {
                        message[2] = "You must enter as valid weight number.";
                        filled = false;
                    }
                    product.setWeight(weight);
                }
                if (field.getFieldName().equals("description")) {
                    if (field.getString().isEmpty()) {
                        message[3] = "You must enter description";
                        filled = false;
                    } else {
                        product.setDescription(field.getString());
                    }
                }
                if (field.getFieldName().equals("category")) {
                    if (field.getString().isEmpty()) {
                        filled = false;
                    } else {
                        category.setId(Integer.parseInt(field.getString()));
                        product.setCategory(category);
                    }

                }
                else if (field.getFieldName().equals("imageFile")) {
                    String location = "F:\\JaVa\\NongSan\\web\\static\\admin\\images\\product";
                    if (field.getSize() > 0) {
                        String fileName = field.getName();
                        int index = fileName.lastIndexOf(".");
                        String ext = fileName.substring(index);

                        String saveFileName = System.currentTimeMillis() + ext;
                        FileOutputStream fileOutputStream
                                = new FileOutputStream(location + File.separator + saveFileName);
                        fileOutputStream.write(field.get());
                        fileOutputStream.flush();
                        fileOutputStream.close();
                        product.setImageName(saveFileName);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("LOI " + e);
        }

       if (filled) {
            productService(product);
            resp.sendRedirect(req.getContextPath() + "/admin/product/search");
        }else{
            req.setAttribute("product", product);
            req.setAttribute("message", message);
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/view/admin/update_product.jsp").forward(req, resp);
        }

    }

    private void productService(Product product) {
        Product oldProduct = productData.get(product.getId());
        Category oldCategory = categoryData.getCategory(product.getCategory().getId());
        if (oldProduct != null) {
            oldProduct.setName(product.getName());
            oldProduct.setPrice(product.getPrice());
            oldProduct.setWeight(product.getWeight());
            oldProduct.setDescription(product.getDescription());

            if (product.getImageName() != null) {
                oldProduct.setImageName(product.getImageName());
            }

            oldCategory.setName(product.getCategory().getName());
            oldProduct.setCategory(oldCategory);

            productData.update(oldProduct);

        }
    }
}

//
//try {
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//            factory.setRepository(new File("F:\\JaVa\\NongSan\\web\\static\\admin\\images\\product"));
//            ServletFileUpload fileUpload = new ServletFileUpload(factory); // doc request de lay cac truong tu form tu client
//            List<FileItem> fieldList = fileUpload.parseRequest(req);
//
//            for (FileItem field : fieldList) {
//                if (field.getFieldName().equals("id")) {
//                    product.setId(Integer.parseInt(field.getString()));
//                } else if (field.getFieldName().equals("name")) {
//                    product.setName(field.getString());
//                } else if (field.getFieldName().equals("price")) {
//                    product.setPrice(Float.parseFloat(field.getString()));
//                } else if (field.getFieldName().equals("weight")) {
//                    product.setWeight(Integer.parseInt(field.getString()));
//                } else if (field.getFieldName().equals("description")) {
//                    product.setDescription(field.getString());
//                } else if (field.getFieldName().equals("category")) {
//                    category.setId(Integer.parseInt(field.getString()));
//                    product.setCategory(category);
//                } else if (field.getFieldName().equals("imageFile")) {
//                    String location = "F:\\JaVa\\NongSan\\web\\static\\admin\\images\\product";
//                    if (field.getSize() > 0) {
//                        String fileName = field.getName();
//                        int index = fileName.lastIndexOf(".");
//                        String ext = fileName.substring(index);
//
//                        String saveFileName = System.currentTimeMillis() + ext;
//                        FileOutputStream fileOutputStream
//                                = new FileOutputStream(location + File.separator + saveFileName);
//                        fileOutputStream.write(field.get());
//                        fileOutputStream.flush();
//                        fileOutputStream.close();
//                        product.setImageName(saveFileName);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            System.out.println("LOI " + e);
//        }
