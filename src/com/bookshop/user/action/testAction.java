package com.bookshop.user.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import javax.servlet.http.Cookie;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ Author     : Rain
 * @ Classname  : testAction
 * @ Date       : 2019/6/1 17:19
 * @ Description:
 */

public class testAction extends ActionSupport {
    private File image;
    //当前上传的文件名
    private String imageFileName;
    //文件类型(MIME)
    private String imageContentType;

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }


    @Override
    public String execute() throws Exception {
/*        String imagePath = new OssUtil().upload(image, imageFileName);
        imagePath = "https://rain-bucket.oss-cn-beijing.aliyuncs.com/" + imagePath + "?x-oss-process=style/one";
        System.out.println("UploadImageToOss{" +
                "imageToOss=" + imagePath);*/

        Cookie[] cookies = ServletActionContext.getRequest().getCookies();

        for (Cookie cookie : cookies)
            System.out.println(cookie.getName()+cookie.getComment()+cookie.getValue());
        return super.execute();
    }

    @Test
    public void test() {
        long currentTime = System.currentTimeMillis();

        SimpleDateFormat formatter = new SimpleDateFormat("ddHHmmss");

        int a = 91192200;
        Date date = new Date(currentTime);
        System.out.println(formatter.format(date));
    }
}
