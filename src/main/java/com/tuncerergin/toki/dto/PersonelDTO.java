package com.tuncerergin.toki.dto;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import lombok.Data;

@Data
public class PersonelDTO {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("ad")
    @Expose
    private String ad;
    @SerializedName("soyad")
    @Expose
    private String soyad;
    @SerializedName("tcKimlikNo")
    @Expose
    private String tcKimlikNo;
    @SerializedName("eMail")
    @Expose
    private String eMail;
    @SerializedName("dogumTarihi")
    @Expose
    private String dogumTarihi;
    @SerializedName("iseBaslamaTarihi")
    @Expose
    private String iseBaslamaTarihi;
    @SerializedName("gorev")
    @Expose
    private String gorev;
    @SerializedName("departman")
    @Expose
    private Integer departman;
    @SerializedName("sifre")
    @Expose
    private String sifre;
}
