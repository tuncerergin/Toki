package com.tuncerergin.toki.repositories;

import com.tuncerergin.toki.entity.Departman;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DepartmanRepository extends JpaRepository<Departman, Integer> {
    long count();

    @Query("SELECT COUNT(per) as toplam, dep.adi FROM Personel per " +
            "INNER JOIN Departman dep on per.departman=dep " +
            "GROUP BY dep.adi")
    List<Object[]> findSumPersonByDepartman();
}
