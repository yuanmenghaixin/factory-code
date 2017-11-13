package com.code.factory.bean;

/**
 * 存储路径配置bean
 */
public class ConfigBean {

    private Long id;
    /**
     * 配置名称
     */
    private String configName;
    /**
     * 项目路径
     */
    private String projectPath;
    /**
     * 包名
     */
    private String packageName;
    /**
     * 页面路径
     */
    private String pagePath;
    /**
     * 包文件的相对路径
     */
    private String packagePath;
    /**
     * 页面文件相对储存路径
     */
    private String relativePath;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getConfigName() {
        return configName;
    }

    public void setConfigName(String configName) {
        this.configName = configName;
    }

    public String getProjectPath() {
        return projectPath;
    }

    public void setProjectPath(String projectPath) {
        this.projectPath = projectPath;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getPagePath() {
        return pagePath;
    }

    public void setPagePath(String pagePath) {
        this.pagePath = pagePath;
    }

    public String getPackagePath() {
        if(null !=this.packageName)
            return this.packageName.replaceAll("\\.","/");
        return packagePath;
    }

    public void setPackagePath(String packagePath) {
        this.packagePath = packagePath;
    }

    public String getRelativePath() {
        return relativePath;
    }

    public void setRelativePath(String relativePath) {
        this.relativePath = relativePath;
    }


    public static void main(String[] args) {
        String ss = "com.a.b";
        System.out.println(ss.replaceAll("\\.","/"));
    }
}
