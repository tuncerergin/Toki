package com.tuncerergin.toki.repositories;

import com.tuncerergin.toki.entity.Izin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;
import java.util.List;

public interface IzinRepository extends JpaRepository<Izin, Integer> {

    @Query("SELECT i FROM Izin i " +
            "INNER JOIN Personel per ON i.personel=per " +
            "INNER JOIN Departman dep ON per.departman=dep " +
            "WHERE dep.id=?1 " +
            "ORDER BY i.izinBaslangicTarihi")
    Collection<Izin> findAllIzinByDepartmanId(Integer id);

    @Query("SELECT AVG(EXTRACT(DAY FROM izin.izinBitisTarihi-izin.izinBaslangicTarihi)) as ortalamaIzin, dep.adi, izTur.izinTur " +
            "FROM Personel per " +
            "INNER JOIN Izin izin on izin.personel=per " +
            "INNER JOIN IzinTuru izTur on izin.izinTuru=izTur " +
            "INNER JOIN Departman dep on per.departman=dep " +
            "WHERE EXTRACT(YEAR FROM izin.izinBitisTarihi)=?1 " +
            "GROUP BY dep.adi,izTur.izinTur")
    List<Object[]> getAvgIzinPerDepartman(Integer year);
}
