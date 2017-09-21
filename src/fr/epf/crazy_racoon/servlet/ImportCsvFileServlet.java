package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.nio.file.Files;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.MotmDao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;

/**
 * Servlet implementation class ImportCsvFileServlet
 */
@WebServlet("/import-file")
public class ImportCsvFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String FILE_NAME = "motms.csv";
    @Inject
    private MotmDao motmDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		uploadFile(response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void uploadFile(HttpServletResponse response) {
		String fileName = FILE_NAME;
		try {
			byte[] outFile =  motmDao.toStringCsv().getBytes();
			response.reset();
			response.setContentType( "text/csv" );
			response.setContentLength( outFile.length );
			response.setHeader( "Content-Disposition", "attachment; filename=\"" + FILE_NAME + "\"" );
			ServletOutputStream responseOutputStream = response.getOutputStream();
			responseOutputStream.write(outFile);
			responseOutputStream.flush();
			responseOutputStream.close();
		} 
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();		
		}
	}
}
