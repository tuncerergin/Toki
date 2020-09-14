package com.tuncerergin.toki.repositories;

import com.tuncerergin.toki.entity.Izin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;

public interface IzinRepository extends JpaRepository<Izin, Integer> {

    @Query("SELECT i FROM Izin i " +
            "INNER JOIN Personel per ON i.personel=per " +
            "INNER JOIN Departman dep ON per.departman=dep " +
            "WHERE dep.id=?1 " +
            "ORDER BY i.izinBaslangicTarihi")
    Collection<Izin> findAllIzinByDepartmanId(Integer id)
            ;
}
