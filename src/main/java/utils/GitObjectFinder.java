package utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GitObjectFinder {
    public static void main(String[] args) {
        // 替换为你的 .git/objects 路径
        String gitObjectsPath = "D:\\Projects\\Idea\\JNCC\\.git\\objects";
        File objectsDir = new File(gitObjectsPath);

        if (!objectsDir.exists() || !objectsDir.isDirectory()) {
            System.err.println("Invalid .git/objects directory: " + gitObjectsPath);
            return;
        }

        // 目标日期：2025-09-14
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date targetDate = null;
        try {
            targetDate = sdf.parse("2025-09-14");
        } catch (Exception e) {
            System.err.println("Failed to parse date: " + e.getMessage());
            return;
        }

        List<String> commands = new ArrayList<>();
        findObjectsByDate(objectsDir, targetDate, commands);

        // 输出所有符合条件的 git cat-file 命令
        System.out.println("Found " + commands.size() + " objects modified on 2025-09-14:");
        for (String cmd : commands) {
            System.out.println(cmd);
        }
    }

    private static void findObjectsByDate(File dir, Date targetDate, List<String> commands) {
        File[] subDirs = dir.listFiles(File::isDirectory);
        if (subDirs == null) return;

        for (File subDir : subDirs) {
            File[] objectFiles = subDir.listFiles();
            if (objectFiles == null) continue;

            for (File objectFile : objectFiles) {
                long lastModified = objectFile.lastModified();
                Date modifiedDate = new Date(lastModified);

                // 检查修改日期是否匹配 2025-09-14（忽略时间部分）
                if (isSameDay(modifiedDate, targetDate)) {
                    String objectHash = subDir.getName() + objectFile.getName();
                    long fileSize = objectFile.length(); // 文件大小（字节）

                    // 根据文件大小决定输出格式
                    String outputPath;
                    if (fileSize > 100 * 1024) { // > 100KB 输出为 .png
//                        outputPath = "/d/g/" + objectFile.getName() + ".png";
                        outputPath = "/d/g/代码+运行.png";
                    } else { // ≤ 100KB 输出为 .txt
//                        outputPath = "/d/g/" + objectFile.getName() + ".txt";
                        outputPath = "/d/g/a.txt";
                    }

                    String command = "git cat-file -p " + objectHash + " > " + outputPath;
                    commands.add(command);
                }
            }
        }
    }

    private static boolean isSameDay(Date date1, Date date2) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date1).equals(sdf.format(date2));
    }
}
