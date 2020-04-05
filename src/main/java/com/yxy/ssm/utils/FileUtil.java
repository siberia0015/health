package com.yxy.ssm.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Created by 便便 on 2017/4/20.
 */
public class FileUtil {


    /**
     * 删除某个文件夹下的所有文件夹和文件
     * @param delpath
     * @return
     * @throws FileNotFoundException
     * @throws IOException
     */
    public static boolean deleteFile(String delpath)
            throws FileNotFoundException, IOException {
        try {
            File file = new File(delpath);
            if (!file.isDirectory()) {//文件
                if(file.exists()){
                    System.out.println(file.delete());
                }
            } else if (file.isDirectory()) {//文件夹
                System.out.println("2");
                File[] fileList = file.listFiles();
                for (int i = 0; i < fileList.length; i++) {
                    File delfile = fileList[i];
                    if (!delfile.isDirectory()) {
                        System.out.println("相对路径=" + delfile.getPath());
                        System.out.println("绝对路径=" + delfile.getAbsolutePath());
                        System.out.println("文件全名=" + delfile.getName());
                        delfile.delete();
                        System.out.println("删除文件成功");
                    } else if (delfile.isDirectory()) {
                        deleteFile(fileList[i].getPath());
                    }
                }
                file.delete();
            }
        } catch (FileNotFoundException e) {
            System.out.println("deletefile()   Exception:" + e.getMessage());
        }
        return true;
    }






}
