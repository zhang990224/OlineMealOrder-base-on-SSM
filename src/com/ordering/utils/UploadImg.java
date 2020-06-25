package com.ordering.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadImg {
    public static String Upload(MultipartFile upload, HttpServletRequest request) throws IOException {
        final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".png" };
        String path = request.getSession().getServletContext().getRealPath("/upload/");
        //判断该路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            //如果这个文件夹不存在的话,就创建这个文件
            file.mkdirs();
        }
        //获取上传文件名称
        String filename = upload.getOriginalFilename();
        System.out.println(filename);
        //把文件名称设置成唯一值 uuid 以防止文件名相同覆盖
        String uuid = UUID.randomUUID().toString().replace("-", "");
        //新文件名
        filename = uuid + "_" + filename;
        System.out.println(filename);
        //完成文件上传
        upload.transferTo(new File(path, filename));
        String NewFilePath = "upload/" + filename;
        return NewFilePath;
    }
}
