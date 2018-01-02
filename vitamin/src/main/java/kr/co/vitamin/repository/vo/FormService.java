package kr.co.vitamin.repository.vo;

public class FormService {
	private Integer formServiceNo;

    private String formServiceName;

    private Integer formServiceType;

    public Integer getFormServiceNo() {
        return formServiceNo;
    }

    public void setFormServiceNo(Integer formServiceNo) {
        this.formServiceNo = formServiceNo;
    }

    public String getFormServiceName() {
        return formServiceName;
    }

    public void setFormServiceName(String formServiceName) {
        this.formServiceName = formServiceName;
    }

    public Integer getFormServiceType() {
        return formServiceType;
    }

    public void setFormServiceType(Integer formServiceType) {
        this.formServiceType = formServiceType;
    }

    // ViFormService 모델 복사
    public void CopyData(FormService param)
    {
        this.formServiceNo = param.getFormServiceNo();
        this.formServiceName = param.getFormServiceName();
        this.formServiceType = param.getFormServiceType();
    }
}
