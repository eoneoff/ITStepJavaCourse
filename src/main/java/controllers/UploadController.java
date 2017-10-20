package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
public class UploadController
{
    @RequestMapping("/uploadPicture")
    public ModelAndView uploadPicture(@RequestParam("picture")MultipartFile picture, HttpSession session)
    {
        if(!picture.isEmpty())
        {
            try
            {
                byte[] bytes = picture.getBytes();
                String rootPath=session.getServletContext().getRealPath("/images");
                File dir = new File(rootPath+File.separator+"test");
                dir.mkdir();
                File uploadedPicture = new File(dir.getAbsolutePath()+File.separator+"test.jpg");
                BufferedOutputStream ostream = new BufferedOutputStream(new FileOutputStream(uploadedPicture));
                ostream.write(bytes);
                ostream.close();
            }
            catch (Exception ex)
            {
                String err = ex.toString();
                System.out.println(err);
            }

        }

        return new ModelAndView("/admin/picture");
    }
}
