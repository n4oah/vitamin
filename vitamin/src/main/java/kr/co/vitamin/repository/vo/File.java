package kr.co.vitamin.repository.vo;

public class File {

    private Integer fileNo;

    private String originalName;

    private String systemName;

    private String fileSize;

    private String filePath;

    public Integer getFileNo() {
        return fileNo;
    }

    public void setFileNo(Integer fileNo) {
        this.fileNo = fileNo;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    // File 모델 복사
    public void CopyData(File param)
    {
        this.fileNo = param.getFileNo();
        this.originalName = param.getOriginalName();
        this.systemName = param.getSystemName();
        this.fileSize = param.getFileSize();
        this.filePath = param.getFilePath();
    }
}