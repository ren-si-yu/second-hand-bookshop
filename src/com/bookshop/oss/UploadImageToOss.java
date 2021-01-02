package com.bookshop.oss;

import com.opensymphony.xwork2.ActionSupport;
import org.junit.Test;

import java.io.File;

/**
 * @ Author     : Rain
 * @ Classname  : UploadImageToOss
 * @ Date       : 2019/5/21 13:26
 * @ Description:
 */

public class UploadImageToOss extends ActionSupport {
    private File image;
    //当前上传的文件名
    private String imageFileName;
    //文件类型(MIME)
    private String imageContentType;

    public File getImage() {
        return image;
    }

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

    public void setImage(File image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "UploadImageToOss{" +
                "imageToOss=" + image +
                ", imageFileName='" + imageFileName + '\'' +
                ", imageContentType='" + imageContentType + '\'' +
                '}';
    }
    @Override
    public String execute() throws Exception {

       /* // Endpoint以杭州为例，其它Region请按实际情况填写。
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        // 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建。
        String accessKeyId = "LTAIZdPXjaY8vWw1";
        String accessKeySecret = "Vqz1ICHNtvB1EvA8bwyzMlwuYlAVr6";

        // 创建OSSClient实例。
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

        // 上传文件流。
        InputStream inputStream = new FileInputStream(this.imageToOss);

        System.out.println(System.currentTimeMillis());
        try {
            ossClient.putObject("rain-bucket", "first3.jpg", inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ossClient.shutdown();
        */
        System.out.println(toString());
        try {

            new OssUtil().upload(this.image, this.imageFileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return NONE;
    }

    @Test
    public void test() {
        String timp = "web/WEB-INF/classes/com/bookshop/oss/timg.jpg";
        String s = new OssUtil().upload(new File(timp),timp);
        System.out.println(s);
    }


}
