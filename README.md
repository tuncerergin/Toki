# Toki 

Kurum içi kullanılacak personellerin izin işlemlerini yönetebilecekleri ve sistem admin i tarafından personel kaydı ve güncellemesi yapılabilecek bir uygulama geliştirilmesi istenmekte.

Yapılacak uygulamada 3 farklı yetkilendirme bulunmalı,


## Yetkiler

### Personel

- Personelin kalan izinlerini kontrol edebilmesi,
- Yeni izin alabilmesi,
- İzin hak edişine göre -5 gün izin alabilmesine imkan tanınsın (bu izin yıl dönümünde hak edilecek izinden düşülmelidir),
- Personelin izin talebi birim amiri tarafından onaylanana kadar taslak olarak kalsın ve personel bu aşamada,
  - silme güncelleme işlemlerini yapabilsin,
  - Ancak izin amir tarafından onaylanır ya da iptal edilirse personelin değişiklik yapmasına izin verilmesin,
- Personel onaylanan izinlerini amirine onaylatmak için sistemden rapor alabilsin,
### Amir 
- Personel izinlerini onaylama, reddetme
### Admin

- Yeni personel kaydı, mevcut personellerin güncellenmesi silinmesi
- Yeni birim tanımlanması ve güncellenmesi, birim amiri atanması
- Birim amirlerinin yerlerine vekalet edecek personelleri atamaları ve vekalet süresi boyunca yetkilerinin bu personelde olması, vekalet süresi bitiminde tüm yetkilerin alınması
- Sisteme harici bir API ile kullanıcı bilgilerinin alınması ve periyodik olarak bu API den yeni kullanıcı gelip gelmediğinin kontrol edilmesi

## Yardımcı olabilecek bilgiler

- Sistemde yapılacak işlemler için authentication - authorization mekanizması esas alınmalı.

- Proje geliştirme çatısı olarak spring boot kullanılmalı.
- Veri tabanı olarak postgresql veri tabanı kullanılmalı.
- Yazılan rest servislerin dokümantasyonu yapılmalıdır. (Uygulamaya entegre olabilir) 
- Kullanabileceğiniz  [dummy api]( http://dummy.restapiexample.com/api/v1/employees) örneği


Sistemde yer alan kullanıcılar temel olarak aşağıda yer alan işlemleri yapmaya yetkili olacak şekilde tasarım yapmalısınız.

- **admin** --> personel kaydı, güncellemesi - birim tanımlama ve güncelleme, birimlere vekalet edecek kişileri atama
- **amir** --> personel izinlerini onaylama,
- **personel** --> izin alma sorgulama taslak izinle için güncelleme silme
