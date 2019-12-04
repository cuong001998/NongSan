package controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;


@WebServlet(urlPatterns="/downloadProduct")
public class DownloadFileProductCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            
		String filename = req.getParameter("filename");
                String location = getServletContext().getRealPath("\\static\\admin\\images\\product");
		File file = new File(location+File.separator+filename);
		
		if(file.exists()) {
                    FileUtils.copyFile(file, resp.getOutputStream());
		}
	}
}
