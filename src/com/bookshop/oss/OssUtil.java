package com.bookshop.oss;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.DeleteObjectsRequest;
import com.aliyun.oss.model.DeleteObjectsResult;
import com.bookshop.utils.Base64Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : OssUtil
 * @ Date       : 2019/5/21 14:18
 * @ Description:
 */

public class OssUtil {
    private OSSClient ossClient;
    private String BUCKETNAME = "rain-bucket";


    // Endpoint以杭州为例，其它Region请按实际情况填写。
    String endpoint = "http://oss-cn-beijing.aliyuncs.com";
    // 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建。
    String accessKeyId = "LTAIZdPXjaY8vWw1";
    String accessKeySecret = "Vqz1ICHNtvB1EvA8bwyzMlwuYlAVr6";
    // 创建OSSClient实例。




    public String deleteImage(String objectName) {
        ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

        int last = objectName.lastIndexOf('?');
        objectName = objectName.substring(48, last);
        // 删除一个文件。
        boolean exist = ossClient.doesObjectExist(BUCKETNAME, objectName);
        if (!exist) {
            return "failure";
        }
        ossClient.deleteObject(BUCKETNAME, objectName);
        ossClient.shutdown();
        return "success";


    }

    public String deleteImages(List keys) {
        ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
      /*
        List<String> keys = new ArrayList<String>();
        keys.add("key0");
        keys.add("key1");
        keys.add("key2");*/

        DeleteObjectsResult deleteObjectsResult = ossClient.deleteObjects(new DeleteObjectsRequest(BUCKETNAME).withKeys(keys));
        List<String> deletedObjects = deleteObjectsResult.getDeletedObjects();

        ossClient.shutdown();
        return "success";


    }


    public String upload(File image, String imageFileName) {
        ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);


        // 上传文件流。
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(image);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        long lon = System.currentTimeMillis();
        String imageSuffix = imageFileName.split("\\.")[1];
        String imageName = Base64Util.encode(image.getName()) + lon + "." + imageSuffix;
        ossClient.putObject(BUCKETNAME, imageName, inputStream);

        ossClient.shutdown();
        return imageName;

    }

}
