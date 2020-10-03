package com.tuncerergin.toki.dto;


import lombok.Data;

@Data
//@JsonIgnoreProperties(ignoreUnknown = true)
//@JsonNaming(PropertyNamingStrategy.CamelCase.class)
public class PersonelDTO {
    private Integer id;
    private String ad;
    private String soyad;
    private String tcKimlikNo;
    private String eMail;
    private String dogumTarihi;
    private String iseBaslamaTarihi;
    private String gorev;
    private Integer departman;
    private String sifre;
}
